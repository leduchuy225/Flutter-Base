import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_base/core/services/cache_service.dart';
import 'package:flutter_base/core/services/user_service.dart';
import 'package:get/get.dart' hide Response;

import '../services/http_service.dart';

class MyInterceptor extends Interceptor {
  final int maxRetry;
  final Duration retryDelay;

  MyInterceptor({
    this.maxRetry = 1,
    this.retryDelay = const Duration(seconds: 2),
  });

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    if (!_shouldRetry(err) || _getIsExcessRetryAttempt(err)) {
      _clearRetryCount(err);
      return handler.next(err);
    }
    await Future.delayed(retryDelay);
    try {
      // Handle something here
      await UserService.getNewTokens();

      _addOneMoreRetry(err);
      final options = Options(
        method: err.requestOptions.method,
        headers: err.requestOptions.headers,
      );
      final response = await Get.find<HttpService>().dio.request(
        options: options,
        err.requestOptions.path,
        data: err.requestOptions.data,
        queryParameters: err.requestOptions.queryParameters,
      );
      _clearRetryCount(err);
      return handler.resolve(response);
    } catch (error) {
      _clearRetryCount(err);
      return handler.next(err);
    }
  }

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await UserService.accessToken;
    if (accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  bool _shouldRetry(DioException error) {
    return [
      HttpStatus.forbidden,
      HttpStatus.unauthorized,
    ].contains(error.response?.statusCode);
  }

  bool _getIsExcessRetryAttempt(DioException error) {
    if (_getRetryCount(error) >= maxRetry) {
      return true;
    }
    return false;
  }

  int _getRetryCount(DioException error) {
    return CacheService().read<int>(key: _getRetryKey(error)) ?? 0;
  }

  String _getRetryKey(DioException error) {
    return '${CacheService.retryCount}-${error.requestOptions.path}';
  }

  void _addOneMoreRetry(DioException error) {
    CacheService().write(
      key: _getRetryKey(error),
      value: _getRetryCount(error) + 1,
    );
  }

  void _clearRetryCount(DioException error) {
    CacheService().write(key: _getRetryKey(error), value: 0);
  }
}
