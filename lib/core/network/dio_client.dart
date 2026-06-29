import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sangwari_maa/core/constants/api_endpoints.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/logging_interceptor.dart';

class DioClient {
  DioClient._();
  static final DioClient instance = DioClient._();

  final AuthInterceptor _authInterceptor = AuthInterceptor();

  late final Dio dio = () {
    final d = Dio(
      BaseOptions(
        baseUrl: const String.fromEnvironment('API_BASE_URL', defaultValue: ApiEndpoints.baseUrl),
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
        headers: {'Content-Type': 'application/json'},
      ),
    );
    d.interceptors.addAll([
      _authInterceptor,
      ErrorInterceptor(),
      if (!const bool.fromEnvironment('dart.vm.product')) LoggingInterceptor(),
    ]);
    _authInterceptor.attachDio(d); // wire retry dio after construction
    return d;
  }();
}

final dioProvider = Provider<Dio>((ref) {
  return DioClient.instance.dio;
});