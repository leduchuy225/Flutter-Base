import 'package:api_annotation/api_annotation.dart' show ApiMethod;

import '../helper/error_handler.dart';

class Api extends ApiMethod {
  const Api() : super(onError: ErrorHandler.handleError);
}
