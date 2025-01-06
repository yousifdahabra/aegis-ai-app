import '../api/dio_config.dart';
import '../models/user_model.dart';
import '../api/api_endpoints.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  final DioConfig _dioClient;
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  AuthRepository() : _dioClient = DioConfig();

  Future<Map<String, dynamic>> login(UserModel user) async {
    final response = await _dioClient.api.makeRequest(
      route: ApiEndpoints.login,
      method: 'POST',
      body: user.toJson(),
    );

    if (response['success']) {
      await _storeLoginStatus(true);
      await _storeToken(response['data']['token']);
      await _storeEmail(user.email);
      return {
        'data': null,
        'success': true,
        'message': 'Login successful.',
      };
    } else {
      return {
        'data': null,
        'success': false,
        'message': response['message'] ?? 'Login failed.',
      };
    }
  }

  Future<Map<String, dynamic>> signup(UserModel user) async {
    final response = await _dioClient.api.makeRequest(
      route: ApiEndpoints.signup,
      method: 'POST',
      body: user.toJson(),
    );

    if (response['success']) {
      await _storeLoginStatus(true);
      await _storeToken(response['data']['token']);
      await _storeEmail(user.email);
      return {
        'data': null,
        'success': true,
        'message': 'Registration successful.',
      };
    } else {
      return {
        'data': null,
        'success': false,
        'message': response['message'] ?? 'Registration failed.',
      };
    }
  }

  Future<void> logout() async {
    await _secureStorage.deleteAll();
  }

  Future<bool> checkLoginStatus() async {
    final status = await _secureStorage.read(key: 'isLoggedIn');
    return status == 'true';
  }

  Future<Map<String, dynamic>> refreshToken() async {
    final email = await _secureStorage.read(key: 'email');
    final password = await _secureStorage.read(key: 'password');

    if (email == null || password == null) {
      return {
        'data': null,
        'success': false,
        'message': 'User not authenticated.',
      };
    }

    final response = await _dioClient.api.makeRequest(
      route: ApiEndpoints.login,
      method: 'POST',
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response['success']) {
      await _storeToken(response['data']['token']);
      return {
        'data': null,
        'success': true,
        'message': 'Token refreshed successfully.',
      };
    } else {
      return {
        'data': null,
        'success': false,
        'message': 'Failed to refresh token.',
      };
    }
  }

  Future<void> _storeLoginStatus(bool isLoggedIn) async {
    await _secureStorage.write(key: 'isLoggedIn', value: isLoggedIn.toString());
  }

  Future<void> _storeToken(String token) async {
    await _secureStorage.write(key: 'auth_token', value: token);
  }

  Future<void> _storeEmail(String email) async {
    await _secureStorage.write(key: 'email', value: email);
  }
}
