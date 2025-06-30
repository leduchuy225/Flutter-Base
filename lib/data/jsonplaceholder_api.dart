import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'jsonplaceholder_api.g.dart';

@RestApi()
abstract class JsonPlaceholderApi {
  factory JsonPlaceholderApi(Dio dio, {String? baseUrl}) = _JsonPlaceholderApi;

  @GET('/posts')
  Future getPostList();

  @GET('/posts/1')
  Future getPostDetail();
}
