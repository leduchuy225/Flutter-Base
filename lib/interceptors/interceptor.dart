import 'package:dio/dio.dart';

class MyInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('onError Interceptor');
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('onRequest Interceptor ${options.toString()}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('onResponse Interceptor ${response.toString()}');
    print('requestOptions Interceptor ${response.requestOptions.toString()}');
    if (response.data is Map && response.data?['results'] == null) {
      handler.reject(DioException(
        response: response,
        error: DioExceptionType.unknown,
        message: 'Get response message here',
        requestOptions: response.requestOptions,
      ));
      return;
    }
    handler.next(response);
  }
}
