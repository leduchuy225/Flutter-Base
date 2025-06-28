import 'package:flutter_base/models/base_response.dart';

import '../../core/extensions/future_extension.dart';
import 'jsonplaceholder_retrofit_api.dart';

class JsonPlaceholderApi {
  JsonPlaceholderApi({required this.api});

  final JsonPlaceholderRetrofitApi api;

  Future<BaseResponseModel> getPostList({ApiParameters? apiParameters}) {
    return api
        .getPostList()
        .then((value) {
          return BaseResponseModel(data: value);
        })
        .call(apiParameters: apiParameters);
  }

  Future<BaseResponseModel> getPostDetail({ApiParameters? apiParameters}) {
    return api
        .getPostDetail()
        .then((value) {
          return BaseResponseModel(data: value, code: 404);
        })
        .call(apiParameters: apiParameters);
  }
}
