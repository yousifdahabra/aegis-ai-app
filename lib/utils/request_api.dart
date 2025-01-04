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
  }) async {}
}
