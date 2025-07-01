import 'package:flutter_base/models/base_response.dart';
import 'package:flutter_base/widgets/loading_widget.dart';

import '../const/constants.dart';
import '../error_handler.dart';

extension FutureExtension<T> on Future<BaseResponse<T>> {
  Future<BaseResponse<T>> callApi({
    Duration? delay,
    bool iShowError = true,
    bool isShowLoading = true,
    BaseResponse<T>? mockData,
  }) async {
    if (mockData != null) {
      return Future.value(mockData).callApi(
        iShowError: iShowError,
        isShowLoading: isShowLoading,
        delay: const Duration(seconds: 2),
      );
    }

    if (isShowLoading) {
      MyLoading.show();
    }

    if (delay != null) {
      await Future.delayed(delay);
    }

    return then((data) {
          if (data.code != MyStatus.success) {
            throw MyError(message: data.message, code: data.code);
          }
          return data;
        })
        .onError((error, stackTrace) {
          if (error != null) {
            MyError.handleError(error, iShowError: iShowError);
          }
          return BaseResponse();
        })
        .whenComplete(() {
          if (isShowLoading) {
            MyLoading.hide();
          }
        });
  }
}
