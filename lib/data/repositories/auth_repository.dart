import '../api/dio_config.dart';
import '../models/user_model.dart';
import '../api/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final DioConfig _dioClient;

  AuthRepository() : _dioClient = DioConfig();

  Future<Map<String, dynamic>> signup(UserModel user) async {
    try {
      final response = await _dioClient.api.makeRequest(
        route: ApiEndpoints.signup,
        method: 'POST',
        body: user.toJson(),
      );

      if (response['success']) {
        return {
          'data': null,
          'success': true,
          'message': response['message'],
        };
      } else {
        return {
          'data': null,
          'success': false,
          'message': response['message'],
        };
      }
    } catch (e) {
      return {
        'data': null,
        'success': false,
        'message': 'An unexpected error occurred. $e',
      };
    }
  }

  Future<Map<String, dynamic>> login(UserModel user) async {
    try {
      final response = await _dioClient.api.makeRequest(
        route: ApiEndpoints.login,
        method: 'POST',
        body: user.toJson(),
      );

      if (response['success']) {
        return {
          'data': null,
          'success': true,
          'message': response['message'],
        };
      } else {
        return {
          'data': null,
          'success': false,
          'message': response['message'],
        };
      }
    } catch (e) {
      return {
        'data': null,
        'success': false,
        'message': 'An unexpected error occurred. $e',
      };
    }
  }

  Future<Map<String, dynamic>> newToken() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    final password = prefs.getString('password');

    if (email == null || password == null) {
      return {
        'data': null,
        'success': false,
        'message': 'User not authenticated.',
      };
    }
  }
}
