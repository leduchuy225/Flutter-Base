import 'package:flutter_base/models/base_response.dart';

import '../error_handler.dart';

class ApiParameters {
  final bool iShowError;

  ApiParameters({this.iShowError = true});
}

extension FutureExtension<T> on Future<BaseResponseModel<T>> {
  Future<BaseResponseModel<T>> call({ApiParameters? apiParameters}) {
    return then((data) {
      if (data.code == 404) {
        throw MyError(message: 'Custom error', code: data.code);
      }
      return data;
    }).onError((error, stackTrace) {
      if (error != null) {
        MyError.handleError(error, apiParameters: apiParameters);
      }
      return BaseResponseModel();
    });
  }
}
