import '../api/dio_config.dart';
import '../api/api_endpoints.dart';

class TestsRepository {
  final DioConfig _dioClient;

  TestsRepository() : _dioClient = DioConfig();

  Future<Map<String, dynamic>> getTestList(TestsRepository userRequest) async {
    try {
      final response = await _dioClient.api.makeRequest(
        route: ApiEndpoints.geTesttList,
        method: 'GET',
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
