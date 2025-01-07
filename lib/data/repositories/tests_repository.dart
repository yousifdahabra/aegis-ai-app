import '../api/dio_config.dart';
import '../api/api_endpoints.dart';

class TestsRepository {
  final DioConfig _dioClient;

  TestsRepository() : _dioClient = DioConfig();

  Future<Map<String, dynamic>> getTestList() async {
    try {
      final response = await _dioClient.api.makeRequest(
        route: ApiEndpoints.geTesttList,
        method: 'GET',
      );

      final data = response['data'];
      if (response['success']) {
        return {
          'data': data['data'],
          'success': true,
          'message': data['message'],
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
