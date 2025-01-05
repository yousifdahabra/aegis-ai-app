import '../api/dio_config.dart';
import '../models/add_user_expert_requests_model.dart';
import '../api/api_endpoints.dart';

class UserExpertRequestRepository {
  final DioConfig _dioClient;

  UserExpertRequestRepository() : _dioClient = DioConfig();

  Future<Map<String, dynamic>> addUserExpertRequest(
      AddUserExpertRequestModel userRequest) async {
    try {
      final response = await _dioClient.api.makeRequest(
        route: ApiEndpoints.expert,
        method: 'POST',
        body: userRequest.toJson(),
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
}
