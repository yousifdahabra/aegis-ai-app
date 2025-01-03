import 'package:dio/dio.dart';
import '../api/dio_config.dart';

class AuthRepository {
  final DioConfig _dioClient;

  AuthRepository() : _dioClient = DioConfig();
}
