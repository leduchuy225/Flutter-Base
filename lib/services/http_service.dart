import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

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
    _dio.options.baseUrl = 'https://pokeapi.co/api/v2';
    // _dio.options.baseUrl = 'http://localhost:8080';

    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);

    _dio.interceptors.addAll([PrettyDioLogger()]);
  }
}
