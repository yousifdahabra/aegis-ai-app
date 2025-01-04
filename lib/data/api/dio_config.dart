import 'package:dio/dio.dart';
import '../../utils/request_api.dart';

class DioConfig {
  final Dio _dio;
  late final RequestAPI _requestAPI;

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
        ) {
    _requestAPI = RequestAPI(dio: _dio);
  }

  RequestAPI get api => _requestAPI;
}
