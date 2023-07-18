import 'package:flutter_base/helper/error_handler.dart';

class ApiParameters {
  final bool iShowError;
  final String? errorMessage;

  ApiParameters({this.errorMessage, this.iShowError = false});
}

class ApiBase<T> {
  Future callAPI(Future<T> Function() api, {ApiParameters? apiParameters}) {
    return api().catchError((error) => ErrorHandler.handleError(error, apiParameters: apiParameters));
  }
}
