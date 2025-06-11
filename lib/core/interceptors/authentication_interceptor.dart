import 'package:dio/dio.dart';

class AuthenticationInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('onError AuthenticationInterceptor');
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('onRequest AuthenticationInterceptor');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('onResponse AuthenticationInterceptor');
    handler.next(response);
  }
}
