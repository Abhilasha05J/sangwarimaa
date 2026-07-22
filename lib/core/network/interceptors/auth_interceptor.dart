import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sangwari_maa/core/constants/api_endpoints.dart';
import 'package:sangwari_maa/core/services/auth_event_bus.dart';

class AuthInterceptor extends Interceptor {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  Dio? _retryDio; // set via attachDio() after the main Dio is built — avoids circular construction

  // ── Refresh lock — prevents concurrent refresh calls ──────────────────
  bool _isRefreshing = false;
  Future<bool>? _refreshFuture;

  void attachDio(Dio dio) => _retryDio = dio;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.extra['skipAuth'] != true) {
      final token = await _storage.read(key: 'access_token');
      if (token != null) options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final isAuthError = err.response?.statusCode == 401;
    final alreadyRetried = err.requestOptions.extra['_retried'] == true;
    final alreadySkipped = err.requestOptions.extra['skipAuth'] == true;

    if (isAuthError && !alreadyRetried && _retryDio != null) {
      final refreshed = await _getOrStartRefresh();
      if (refreshed) {
        try {
          final token = await _storage.read(key: 'access_token');
          err.requestOptions.extra['_retried'] = true;
          err.requestOptions.headers['Authorization'] = 'Bearer $token';
          final response = await _retryDio!.fetch(err.requestOptions);
          return handler.resolve(response);
        } catch (_) {
          // fall through, propagate original error
        }
      } else {
        await _storage.deleteAll();
        AuthEventBus.instance.fire(AuthEvent.sessionExpired);
      }
    }
    handler.next(err);
  }

  // Future<bool> _tryRefresh() async {
  //   final refreshToken = await _storage.read(key: 'refresh_token');
  //   if (refreshToken == null || _retryDio == null) return false;
  //   try {
  //     final response = await _retryDio!.post(
  //       ApiEndpoints.refresh,
  //       data: {'refresh_token': refreshToken},
  //       options: Options(extra: {'skipAuth': true}),
  //     );
  //     final newAccess = response.data['access_token'] as String?;
  //     final newRefresh = response.data['refresh_token'] as String?;
  //     if (newAccess == null) return false;
  //     await _storage.write(key: 'access_token', value: newAccess);
  //     if (newRefresh != null) await _storage.write(key: 'refresh_token', value: newRefresh);
  //     return true;
  //   } catch (_) {
  //     return false;
  //   }
  // }
  Future<bool> _getOrStartRefresh() {
    if (_isRefreshing && _refreshFuture != null) {
      return _refreshFuture!;
    }
    _isRefreshing = true;
    _refreshFuture = _tryRefresh().whenComplete(() {
      _isRefreshing = false;
      _refreshFuture = null;
    });
    return _refreshFuture!;
  }

  Future<bool> _tryRefresh() async {
    final refreshToken = await _storage.read(key: 'refresh_token');
    if (refreshToken == null || _retryDio == null) return false;
    try {
      final response = await _retryDio!.post(
        ApiEndpoints.refresh,
        data: {'refresh_token': refreshToken},
        options: Options(extra: {'skipAuth': true}),
      );
      // Unwrap your success envelope: {success, data: {access_token, ...}}
      final data = response.data as Map<String, dynamic>;
      final envelope = data['data'] as Map<String, dynamic>?;
      final newAccess = envelope?['access_token'] as String?;
      if (newAccess == null) return false;
      await _storage.write(key: 'access_token', value: newAccess);
      // refresh endpoint only returns access_token per your backend code
      return true;
    } catch (_) {
      return false;
    }
  }

}