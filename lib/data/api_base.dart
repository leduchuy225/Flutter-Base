import 'package:flutter_base/services/api/error_handler.dart';

class ApiBase<T> {
  Future callAPI(Future<T> Function() api) {
    return api().catchError(ErrorHandler.handleError);
  }
}
