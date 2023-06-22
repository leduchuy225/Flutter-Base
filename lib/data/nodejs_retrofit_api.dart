import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'nodejs_retrofit_api.g.dart';

@RestApi()
abstract class NodejsRetrofitApi {
  factory NodejsRetrofitApi(Dio dio, {String baseUrl}) = _NodejsRetrofitApi;

  @GET('/api/success')
  Future getSuccessfulData();

  @GET('/api/failure')
  Future getFailData();
}
