import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../const/strings.dart';
import '../interceptors/interceptor.dart';

class HttpService {
  factory HttpService() {
    return _singleton;
  }

  HttpService._() {
    configureDio();
  }

  static final HttpService _singleton = HttpService._();

  final _dio = Dio();

  Dio get dio => _dio;

  Dio get dioInstance {
    return Dio(baseOptions);
  }

  BaseOptions get baseOptions {
    return BaseOptions(
      baseUrl: Strings.baseURL,
      contentType: 'application/json',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );
  }

  void configureDio() {
    _dio.options = baseOptions;
    _dio.interceptors.addAll([PrettyDioLogger(), MyInterceptor()]);
  }
}
