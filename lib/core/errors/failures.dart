import 'package:flutter/foundation.dart';

import 'exceptions.dart';

sealed class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  final int? statusCode;
  const ServerFailure(super.message, {this.statusCode});
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No internet connection']);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure([super.message = 'Session expired, please login again']);
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
  debugPrint('🔴 RAW EXCEPTION: $e (${e.runtimeType})');
  return switch (e) {
    ServerException(message: final m, statusCode: final s) => ServerFailure(m, statusCode: s),
    NetworkException(message: final m) => NetworkFailure(m),
    UnauthorizedException(message: final m) => UnauthorizedFailure(m),
    ValidationException(message: final m, fieldErrors: final f) => ValidationFailure(m, fieldErrors: f),
    CacheException(message: final m) => CacheFailure(m),
    _ => const UnknownFailure(),
  };
}