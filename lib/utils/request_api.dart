import 'package:dio/dio.dart';

class RequestAPI {
  final Dio dio;

  RequestAPI({required this.dio});

  Future<Map<String, dynamic>> makeRequest({
    required String route,
    String method = 'GET',
    Map<String, dynamic>? body,
    String header = 'application/json',
    String? token,
  }) async {
    try {
      final options = Options(
        method: method,
        headers: {
          'Content-Type': header,
          if (token != null) 'Authorization': 'Bearer $token',
        },
      );

      return {};
    } catch (error) {
      return {
        'data': null,
        'success': false,
        'message': 'An unexpected error occurred.',
      };
    }
  }
}
