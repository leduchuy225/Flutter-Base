import 'package:flutter_base/models/base_response.dart';

import '../const/constants.dart';
import '../error_handler.dart';

extension FutureExtension<T> on Future<BaseResponse<T>> {
  Future<BaseResponse<T>> callApi({
    bool iShowError = true,
    BaseResponse<T>? mockData,
  }) {
    if (mockData != null) {
      return Future.value(mockData).callApi(iShowError: iShowError);
    }
    return then((data) {
      if (data.code != MyStatus.success) {
        throw MyError(message: data.message, code: data.code);
      }
      return data;
    }).onError((error, stackTrace) {
      if (error != null) {
        MyError.handleError(error, iShowError: iShowError);
      }
      return BaseResponse();
    });
  }
}
