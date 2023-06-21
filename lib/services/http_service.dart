import 'package:dio/dio.dart';
import 'package:flutter_base/interceptors/authentication_interceptor.dart';

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

  void configureDio() {
    print('Configure dio');

    _dio.options.baseUrl = 'https://pokeapi.co/api/v2';
    // _dio.options.connectTimeout = const Duration(seconds: 5);
    // _dio.options.receiveTimeout = const Duration(seconds: 3);

    _dio.interceptors.addAll([
      AuthenticationInterceptor(),
      LogInterceptor(),
    ]);
  }
}
