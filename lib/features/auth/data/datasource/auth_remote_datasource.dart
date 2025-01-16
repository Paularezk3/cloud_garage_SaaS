// lib\features\auth\data\datasource\auth_remote_datasource.dart

import '../../../../core/error/exceptions.dart';

class AuthRemoteDatasource {
  Future<void> loginUser(String email, String password) async {
    try {
      // Simulate a network request
      if (email == 'test@example.com' && password == 'password') {
        // Success
        return;
      } else {
        throw ServerException('Invalid credentials');
      }
    } catch (e) {
      throw ServerException('Failed to login: $e');
    }
  }
}
