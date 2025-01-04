import '../api/dio_config.dart';
import '../models/user_model.dart';
import '../api/api_endpoints.dart';

class AuthRepository {
  final DioConfig _dioClient;

  AuthRepository() : _dioClient = DioConfig();

  Future<Map<String, dynamic>> signup(UserModel user) async {
    final response = await _dioClient.api.makeRequest(
      route: ApiEndpoints.signup,
      method: 'POST',
      body: user.toJson(),
    );
    return response;
  }
}
