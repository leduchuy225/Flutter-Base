import 'package:flutter_base/models/base_response.dart';

import '../core/error_handler.dart';

class ApiParameters {
  final bool iShowError;
  final String? errorMessage;

  ApiParameters({this.errorMessage, this.iShowError = false});
}

extension FutureExtension<T> on Future<BaseResponseModel<T>> {
  Future<BaseResponseModel<T>> call({ApiParameters? apiParameters}) {
    return catchError((error) {
      return ErrorHandler.handleError(error, apiParameters: apiParameters);
    });
  }
}
