import 'package:dio/dio.dart';

class DioConfig {
  final Dio _dio;

  DioConfig()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'http://127.0.0.1:8000/api',
          ),
        );

  Dio get dio => _dio;
}
