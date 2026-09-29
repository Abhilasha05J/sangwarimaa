// import 'package:dio/dio.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:sangwari_maa/core/constants/api_endpoints.dart';
// import 'package:sangwari_maa/core/services/auth_event_bus.dart';
//
// class AuthInterceptor extends Interceptor {
//   final FlutterSecureStorage _storage = const FlutterSecureStorage();
//   Dio? _retryDio; // set via attachDio() after the main Dio is built — avoids circular construction
//
//   // ── Refresh lock — prevents concurrent refresh calls ──────────────────
//   bool _isRefreshing = false;
//   Future<bool>? _refreshFuture;
//
//   void attachDio(Dio dio) => _retryDio = dio;
//
//   @override
//   Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
//     if (options.extra['skipAuth'] != true) {
//       final token = await _storage.read(key: 'access_token');
//       if (token != null) options.headers['Authorization'] = 'Bearer $token';
//     }
//     handler.next(options);
//   }
//
//   @override
//   Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
//     final isAuthError = err.response?.statusCode == 401;
//     final alreadyRetried = err.requestOptions.extra['_retried'] == true;
//     final alreadySkipped = err.requestOptions.extra['skipAuth'] == true;
//
//     if (isAuthError && !alreadyRetried && _retryDio != null) {
//       final refreshed = await _getOrStartRefresh();
//       if (refreshed) {
//         try {
//           final token = await _storage.read(key: 'access_token');
//           err.requestOptions.extra['_retried'] = true;
//           err.requestOptions.headers['Authorization'] = 'Bearer $token';
//           final response = await _retryDio!.fetch(err.requestOptions);
//           return handler.resolve(response);
//         } catch (_) {
//           // fall through, propagate original error
//         }
//       } else {
//         await _storage.deleteAll();
//         AuthEventBus.instance.fire(AuthEvent.sessionExpired);
//       }
//     }
//     handler.next(err);
//   }
//
//   // Future<bool> _tryRefresh() async {
//   //   final refreshToken = await _storage.read(key: 'refresh_token');
//   //   if (refreshToken == null || _retryDio == null) return false;
//   //   try {
//   //     final response = await _retryDio!.post(
//   //       ApiEndpoints.refresh,
//   //       data: {'refresh_token': refreshToken},
//   //       options: Options(extra: {'skipAuth': true}),
//   //     );
//   //     final newAccess = response.data['access_token'] as String?;
//   //     final newRefresh = response.data['refresh_token'] as String?;
//   //     if (newAccess == null) return false;
//   //     await _storage.write(key: 'access_token', value: newAccess);
//   //     if (newRefresh != null) await _storage.write(key: 'refresh_token', value: newRefresh);
//   //     return true;
//   //   } catch (_) {
//   //     return false;
//   //   }
//   // }
//   Future<bool> _getOrStartRefresh() {
//     if (_isRefreshing && _refreshFuture != null) {
//       return _refreshFuture!;
//     }
//     _isRefreshing = true;
//     _refreshFuture = _tryRefresh().whenComplete(() {
//       _isRefreshing = false;
//       _refreshFuture = null;
//     });
//     return _refreshFuture!;
//   }
//
//   Future<bool> _tryRefresh() async {
//     final refreshToken = await _storage.read(key: 'refresh_token');
//     if (refreshToken == null || _retryDio == null) return false;
//     try {
//       final response = await _retryDio!.post(
//         ApiEndpoints.refresh,
//         data: {'refresh_token': refreshToken},
//         options: Options(extra: {'skipAuth': true}),
//       );
//       // Unwrap your success envelope: {success, data: {access_token, ...}}
//       final data = response.data as Map<String, dynamic>;
//       final envelope = data['data'] as Map<String, dynamic>?;
//       final newAccess = envelope?['access_token'] as String?;
//       if (newAccess == null) return false;
//       await _storage.write(key: 'access_token', value: newAccess);
//       // refresh endpoint only returns access_token per your backend code
//       return true;
//     } catch (_) {
//       return false;
//     }
//   }
//
// }
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sangwari_maa/core/constants/api_endpoints.dart';
import 'package:sangwari_maa/core/services/auth_event_bus.dart';

/// Result of a token refresh attempt.
///  - refreshed:   new access token stored, the original request can be retried
///  - rejected:    server said the refresh token is dead (401/403) → real logout
///  - unavailable: no verdict from the server (offline, timeout, 5xx, bad body)
///                 → keep the session and surface a network error
enum _RefreshOutcome { refreshed, rejected, unavailable }

class AuthInterceptor extends Interceptor {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  Dio? _retryDio; // set via attachDio() after the main Dio is built — avoids circular construction

  // ── Refresh lock — prevents concurrent refresh calls ──────────────────
  bool _isRefreshing = false;
  Future<_RefreshOutcome>? _refreshFuture;

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
    // The refresh call itself is sent with skipAuth — it must never trigger
    // another refresh, otherwise it awaits its own in-flight future (deadlock).
    final skipAuth = err.requestOptions.extra['skipAuth'] == true;

    if (isAuthError && !alreadyRetried && !skipAuth && _retryDio != null) {
      final outcome = await _getOrStartRefresh();
      switch (outcome) {
        case _RefreshOutcome.refreshed:
          try {
            final token = await _storage.read(key: 'access_token');
            err.requestOptions.extra['_retried'] = true;
            err.requestOptions.headers['Authorization'] = 'Bearer $token';
            final response = await _retryDio!.fetch(err.requestOptions);
            return handler.resolve(response);
          } on DioException catch (e) {
            // The retry's own error (e.g. 404 = registration incomplete,
            // or a network failure) must reach the caller — not the stale 401.
            return handler.next(e);
          } catch (_) {
            // fall through, propagate original error
          }
        case _RefreshOutcome.rejected:
        // Server said the refresh token is dead → real logout.
          await _storage.deleteAll();
          AuthEventBus.instance.fire(AuthEvent.sessionExpired);
        case _RefreshOutcome.unavailable:
        // Couldn't reach the server (offline, timeout, 5xx) → keep the
        // session and surface a network error instead of a 401.
          return handler.next(err.copyWith(type: DioExceptionType.connectionError));
      }
    }
    handler.next(err);
  }

  Future<_RefreshOutcome> _getOrStartRefresh() {
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

  Future<_RefreshOutcome> _tryRefresh() async {
    final refreshToken = await _storage.read(key: 'refresh_token');
    if (refreshToken == null) return _RefreshOutcome.rejected; // nothing left to refresh with
    if (_retryDio == null) return _RefreshOutcome.unavailable;
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
      if (newAccess == null) return _RefreshOutcome.unavailable;
      await _storage.write(key: 'access_token', value: newAccess);
      // refresh endpoint only returns access_token per your backend code
      return _RefreshOutcome.refreshed;
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      if (status == 401 || status == 403) return _RefreshOutcome.rejected;
      return _RefreshOutcome.unavailable;
    } catch (_) {
      // e.g. a captive-portal page returned as 200 HTML → not a server verdict
      return _RefreshOutcome.unavailable;
    }
  }
}
