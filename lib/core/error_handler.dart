import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/ui/splash_screen.dart';
import 'package:get/get.dart';

import '../theme/styles.dart';
import '../widgets/dialog/dialog_widget.dart';
import 'const/constants.dart';

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

  static void handleError(Object error, {bool iShowError = true}) {
    String? message;

    switch (error.runtimeType) {
      case DioException:
        final dioException = error as DioException;
        message = dioException.message;
        if (dioException.type == DioExceptionType.connectionError) {
          message = MyStrings.connectionOff;
        }
        break;
      case MyError:
        final myException = error as MyError;
        message = myException.message != null
            ? 'Lỗi [${myException.code}] - ${myException.message}'
            : null;

        if (myException.code == MyStatus.notAuthenticate2Fa) {
          Get.offAll(() => const SplashScreen());
        }
        break;
      default:
        message = error.toString();
    }

    print('Error message: $message');

    if (iShowError) {
      MyError.showErrorDialog(message ?? MyStrings.systemError);
    }
  }
}
