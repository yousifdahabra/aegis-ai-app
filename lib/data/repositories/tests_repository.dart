import 'package:ai_safety_app/data/models/start_test_model.dart';
import 'package:ai_safety_app/data/models/submit_answer_model.dart';

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

  Future<Map<String, dynamic>> startTest(StartTestModel model) async {
    try {
      final response = await _dioClient.api.makeRequest(
        route: ApiEndpoints.addTest,
        method: 'POST',
        body: model.toJson(),
      );

      if (response['success']) {
        return {
          'data': response['data'],
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

  Future<Map<String, dynamic>> submitAnswer(SubmitAnswerModel model) async {
    try {
      final response = await _dioClient.api.makeRequest(
        route: ApiEndpoints.submitAnswer,
        method: 'POST',
        body: model.toJson(),
      );
      if (response['success'] == true) {
        return {
          'data': response['data'],
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

  Future<Map<String, dynamic>> getTestDetails(int testId) async {
    final response = await _dioClient.api.makeRequest(
      route: '${ApiEndpoints.getTestSolutions}/$testId',
      method: 'GET',
    );

    if (response['status']) {
      return response['data'];
    } else {
      throw Exception(response['message']);
    }
  }
}
