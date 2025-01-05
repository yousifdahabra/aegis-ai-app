import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequestAPI {
  final Dio dio;

  RequestAPI({required this.dio});

  Future<Map<String, dynamic>> makeRequest({
    required String route,
    String method = 'GET',
    Map<String, dynamic>? body,
    String header = 'application/json',
  }) async {
    try {
      final options = Options(
        method: method,
        headers: {
          'Content-Type': header,
        },
      );

      final response = await dio.request(
        route,
        data: body,
        options: options,
      );

      return {
        'data': response.data,
        'success': true,
        'message': 'Request successful',
      };
    } on DioException catch (error) {
      final errorMessage = _handleDioError(error);
      return {
        'data': null,
        'success': false,
        'message': errorMessage,
      };
    } catch (error) {
      return {
        'data': null,
        'success': false,
        'message': 'An unexpected error occurred. $error',
      };
    }
  }

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  String _handleDioError(DioException error) {
    if (error.response != null) {
      final responseData = error.response?.data;

      final message =
          responseData['message'] ?? 'Unknown error occurred $error';

      if (responseData['errors'] != null) {
        final errors = responseData['errors'] as Map<String, dynamic>;
        final errorMessages = errors.entries
            .map((entry) => '${entry.key}: ${entry.value.join(", ")}')
            .join("\n");

        return '$message\n$errorMessages';
      } else {
        return message;
      }
    } else {
      return error.message ?? 'An unknown network error occurred. $error';
    }
  }
}
