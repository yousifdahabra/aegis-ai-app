import 'package:dio/dio.dart';

String handleDioError(DioException error) {
  if (error.response != null) {
    final responseData = error.response?.data;

    final message = responseData['message'] ?? 'Unknown error occurred';

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
    return error.message ?? 'An unknown network error occurred.';
  }
}
