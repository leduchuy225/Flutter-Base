import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/models/base_response.dart';
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

  static BaseResponse handleError(Object? error, {bool isShowMessage = true}) {
    BaseResponse _baseResponse = BaseResponse(
      code: MyStatus.error,
      message: MyStrings.systemError,
    );

    if (error == null) {
      return _baseResponse;
    }

    switch (error.runtimeType) {
      case DioException:
        final dioException = error as DioException;
        _baseResponse = _baseResponse.copyWith(message: dioException.message);
        if (dioException.type == DioExceptionType.connectionError) {
          _baseResponse = _baseResponse.copyWith(
            message: MyStrings.connectionOff,
          );
        }
        break;
      case MyError:
        final myException = error as MyError;
        final message = myException.message != null
            ? 'Lỗi [${myException.code}] - ${myException.message}'
            : null;

        if (myException.code == MyStatus.notAuthenticate2Fa) {
          Get.offAll(() => const SplashScreen());
        }
        _baseResponse = _baseResponse.copyWith(
          message: message,
          code: myException.code,
        );
        break;
      default:
        _baseResponse = _baseResponse.copyWith(message: error.toString());
    }

    print('Error message: ${_baseResponse.message}');

    if (isShowMessage) {
      MyError.showErrorDialog(_baseResponse.message);
    }

    return _baseResponse;
  }
}
