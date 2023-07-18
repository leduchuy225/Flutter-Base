import 'package:dio/dio.dart';

import '../config/strings.dart';
import '../core/api_base.dart';
import 'dialog_utils.dart';

class ErrorHandler {
  ErrorHandler._();

  static dynamic handleError(Object error, {ApiParameters? apiParameters}) {
    switch (error.runtimeType) {
      case DioException:
        final dioException = error as DioException;
        DialogUtility.snackbar(apiParameters?.errorMessage ?? dioException.message ?? Strings.httpError);
        return 'Dio Exception';
      default:
        DialogUtility.snackbar(apiParameters?.errorMessage ?? Strings.httpError);
        return 'Default Exception';
    }
  }
}
