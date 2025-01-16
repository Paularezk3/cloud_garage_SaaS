// lib\core\error\exceptions.dart

class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}

class AuthException implements Exception {
  final String message;
  AuthException(this.message);
}

class CacheException implements Exception {
  final String message;
  CacheException(this.message);
}