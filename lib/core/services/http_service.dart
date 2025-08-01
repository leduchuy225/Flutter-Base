import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../const/constants.dart';
import '../interceptors/interceptor.dart';

class HttpService {
  factory HttpService() {
    return _singleton;
  }

  HttpService._();

  static final HttpService _singleton = HttpService._();

  final _dio = Dio();

  Dio get dio => _dio;

  Dio get dioInstance {
    return Dio(baseOptions);
  }

  BaseOptions get baseOptions {
    return BaseOptions(
      baseUrl: MyStrings.baseURL,
      contentType: 'application/json',
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
  }

  Future<PersistCookieJar> prepareJar() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;
    return PersistCookieJar(
      ignoreExpires: true,
      storage: FileStorage(appDocPath + '/.cookies/'),
    );
  }

  Future configureDio() async {
    final cookieJar = await prepareJar();
    _dio.options = baseOptions;
    _dio.interceptors.addAll([
      CookieManager(cookieJar),
      MyInterceptor(),
      PrettyDioLogger(),
    ]);
  }
}
