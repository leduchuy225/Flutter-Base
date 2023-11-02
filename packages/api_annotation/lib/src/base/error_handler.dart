import '../../api_annotation.dart';

abstract class ErrorHandler {
  dynamic handleError(Object error, {ApiMethod? params});
}
