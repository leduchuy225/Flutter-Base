import 'package:flutter/material.dart';
import 'package:flutter_base/models/base_response.dart';
import 'package:flutter_base/widgets/dialog/dialog_widget.dart';
import 'package:flutter_base/widgets/loading_widget.dart';

import '../../theme/styles.dart';
import '../error_handler.dart';

extension FutureExtension<T> on Future<BaseResponse<T>> {
  Future<BaseResponse<T>> callApi({
    Duration? delay = const Duration(milliseconds: 1500), // FOR TEST ONLY
    BaseResponse<T>? mockData,
    bool isShowLoading = true,
    bool isShowErrorMessage = true,
    bool isShowSuccessMessage = true,
  }) async {
    if (mockData != null) {
      return Future.value(mockData).callApi(
        isShowLoading: isShowLoading,
        delay: const Duration(seconds: 2),
        isShowErrorMessage: isShowErrorMessage,
        isShowSuccessMessage: isShowSuccessMessage,
      );
    }

    if (isShowLoading) {
      MyLoading.show();
    }
    if (delay != null) {
      await Future.delayed(delay);
    }
    return then((data) {
      if (isShowLoading) {
        MyLoading.hide();
      }
      if (!data.isSuccess) {
        throw MyError(message: data.message, code: data.code);
      }
      if (isShowSuccessMessage && (data.message ?? '').isNotEmpty) {
        MyDialog.snackbar(
          data.message,
          type: SnackbarType.SUCCESS,
          icon: const Icon(
            Icons.system_security_update_good_outlined,
            color: AppColors.white,
          ),
        );
      }
      return data;
    }).onError((error, stackTrace) {
      if (isShowLoading) {
        MyLoading.hide();
      }
      final data = MyError.handleError(
        error,
        isShowMessage: isShowErrorMessage,
      );
      return BaseResponse(code: data.code, message: data.message);
    });
  }
}
