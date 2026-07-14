class ServerException implements Exception {
  final String message;
  final int? statusCode;
  ServerException(this.message, {this.statusCode});
}

class NetworkException implements Exception {
  final String message;
  NetworkException([this.message = 'No internet connection']);
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException([this.message = 'Session expired, please login again']);
}

class NotFoundException implements Exception {  // NEW
  final String message;
  NotFoundException([this.message = 'Resource not found']);
}

class ValidationException implements Exception {
  final String message;
  final Map<String, List<String>> fieldErrors;
  ValidationException(this.message, {this.fieldErrors = const {}});
}

class CacheException implements Exception {
  final String message;
  CacheException([this.message = 'Local cache error']);
}