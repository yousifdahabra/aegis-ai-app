import 'package:dio/dio.dart';

class DioConfig {
  final Dio _dio;

  DioConfig()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'https://yousif.info/api/',
            responseType: ResponseType.json,
            headers: {
              'accept': 'application/json',
              'content-type': 'application/json',
            },
          ),
        );

  Dio get dio => _dio;
}
