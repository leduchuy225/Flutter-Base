import 'package:dio/dio.dart';
import 'package:flutter_base/models/base_response.dart';
import 'package:retrofit/retrofit.dart';

part 'jsonplaceholder_retrofit_api.g.dart';

@RestApi()
abstract class JsonPlaceholderRetrofitApi {
  factory JsonPlaceholderRetrofitApi(Dio dio, {String baseUrl}) =
      _JsonPlaceholderRetrofitApi;

  @GET('/posts')
  Future<BaseResponseModel<List>> getPostList();

  @GET('/posts/1')
  Future<BaseResponseModel> getPostDetail();
}
