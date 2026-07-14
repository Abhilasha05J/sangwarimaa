import 'package:dio/dio.dart';
import 'package:sangwari_maa/core/errors/exceptions.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err.copyWith(error: _mapError(err)));
  }

  Exception _mapError(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return NetworkException();
      default:
        break;
    }

    final statusCode = err.response?.statusCode;
    final data = err.response?.data;

    if (statusCode == 401) return UnauthorizedException();
    if (statusCode == 404) return NotFoundException();

    // Your backend's custom AppException envelope:
    // {"success": false, "data": null, "error": {"code", "message", "details"}}
    if (data is Map && data['error'] is Map) {
      final errorObj = data['error'] as Map;
      final message = errorObj['message']?.toString() ?? 'Something went wrong';
      final code = errorObj['code']?.toString();

      if (statusCode == 422 && errorObj['details'] is Map) {
        final details = (errorObj['details'] as Map).map(
              (k, v) => MapEntry(k.toString(), v is List ? v.map((e) => e.toString()).toList() : [v.toString()]),
        );
        return ValidationException(message, fieldErrors: details);
      }
      return ServerException(message, statusCode: statusCode);
      // `code` (e.g. "OTP_INVALID", "RATE_LIMIT_EXCEEDED") is available here too —
      // surface it later via a dedicated OtpException type if you want UI to branch on it.
    }

    // FastAPI's automatic Pydantic validation envelope (still used for raw 422s
    // that never reach your AppException handler — e.g. malformed request body):
    // {"detail": [{"loc", "msg", "type"}]}
    if (statusCode == 422 && data is Map && data['detail'] is List) {
      final fieldErrors = <String, List<String>>{};
      for (final item in (data['detail'] as List)) {
        final loc = (item['loc'] as List?)?.map((e) => e.toString()).join('.') ?? 'field';
        final msg = item['msg']?.toString() ?? 'Invalid value';
        fieldErrors.putIfAbsent(loc, () => []).add(msg);
      }
      return ValidationException('Please check the highlighted fields', fieldErrors: fieldErrors);
    }

    if (statusCode != null && statusCode >= 500) {
      return ServerException('Server error, please try again later', statusCode: statusCode);
    }

    return ServerException('Something went wrong', statusCode: statusCode);
  }
}