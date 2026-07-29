import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'exceptions.dart';

sealed class Failure {
  final String message;
  const Failure(this.message);

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  final int? statusCode;
  const ServerFailure(super.message, {this.statusCode});

  @override
  String toString() {
    if (statusCode == 429) {
      return 'Too many attempts. Please wait a few minutes before trying again.';
    }
    return message;
  }
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No internet connection']);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure([super.message = 'Session expired, please login again']);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message = 'Resource not found']);
}

class ValidationFailure extends Failure {
  final Map<String, List<String>> fieldErrors;
  const ValidationFailure(super.message, {this.fieldErrors = const {}});
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Local cache error']);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'Something went wrong']);
}

/// Maps any caught exception → a Failure, for use in repository catch blocks.
Failure mapExceptionToFailure(Object e) {
  final error = e is DioException ? (e.error ?? e) : e;
  debugPrint('🔴 RAW EXCEPTION: $error (${error.runtimeType})');
  return switch (error) {
    ServerException(message: final m, statusCode: final s) => ServerFailure(m, statusCode: s),
    NetworkException(message: final m) => NetworkFailure(m),
    UnauthorizedException(message: final m) => UnauthorizedFailure(m),
    NotFoundException(message: final m) => NotFoundFailure(m),
    ValidationException(message: final m, fieldErrors: final f) => ValidationFailure(m, fieldErrors: f),
    CacheException(message: final m) => CacheFailure(m),
    _ => const UnknownFailure(),
  };
}