import 'package:dio/dio.dart';

class ErrorHandler {
  static dynamic handleError(Object error) {
    switch (error.runtimeType) {
      case DioException:
        final response = error as DioException;
        final statusCode = response.response?.statusCode;

        // print('ERROR: $error');
        // print('Error: ${response.error}');
        // print('Response: ${response.response}');
        // print('StackTrace: ${response.stackTrace}');
        // print('Type: ${response.type}');

        return 'DioException';
      default:
        return 'Default';
    }
  }
}
