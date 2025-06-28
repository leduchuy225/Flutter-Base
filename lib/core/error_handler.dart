import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../theme/styles.dart';
import '../widgets/dialog/dialog_widget.dart';
import 'const/strings.dart';
import 'extensions/future_extension.dart';

class MyError implements Exception {
  final int? code;
  final String? message;

  MyError({this.code, this.message});

  static void showErrorDialog(String? message) {
    MyDialog.snackbar(
      message,
      type: SnackbarType.ERROR,
      icon: const Icon(Icons.error, color: AppColors.white),
    );
  }

  static void handleError(Object error, {ApiParameters? apiParameters}) {
    final _apiParameters = apiParameters ?? ApiParameters();

    String? message;

    switch (error.runtimeType) {
      case DioException:
        final dioException = error as DioException;
        message = dioException.message;
        if (dioException.type == DioExceptionType.connectionError) {
          message = Strings.connectionOff;
        }
        break;
      case MyError:
        final myException = error as MyError;
        message = myException.message;
      default:
        message = error.toString();
    }

    if (_apiParameters.iShowError) {
      MyError.showErrorDialog(message ?? Strings.systemError);
    }
  }
}
