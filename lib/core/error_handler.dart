import 'package:dio/dio.dart';
import 'package:flutter_base/core/base_error.dart';

import '../extensions/future_extension.dart';
import '../widgets/dialog/dialog_widget.dart';

class ErrorHandler {
  ErrorHandler._();

  static dynamic handleError(Object error, {ApiParameters? apiParameters}) {
    switch (error.runtimeType) {
      case DioException:
        final dioException = error as DioException;
        MyDialog.snackbar('DioException');

        print('Error Type: ${dioException.type.toString()}');
        print('Error Message: ${dioException.message.toString()}');
        print('Error Response: ${dioException.response.toString()}');

        throw MyError('DioException');
      default:
        MyDialog.snackbar('Default Exception');
        throw MyError('Default Exception');
    }
  }
}
