import 'package:dio/dio.dart';
import '../api/dio_config.dart';
import '../models/user_model.dart';
import '../api/api_endpoints.dart';

class AuthRepository {
  final DioConfig _dioClient;

  AuthRepository() : _dioClient = DioConfig();

  Future<void> signup(UserModel user) async {
    try {
      final response = await _dioClient.dio.post(
        ApiEndpoints.signup,
        data: user.toJson(),
      );

      print('Signup Successful: ${response.data}');
    } on DioException catch (e) {
      throw Exception('Signup Failed: ${e.response?.data}');
    }
  }
}
