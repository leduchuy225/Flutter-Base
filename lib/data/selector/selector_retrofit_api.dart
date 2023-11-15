import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../models/base_response.dart';

part 'selector_retrofit_api.g.dart';

@RestApi()
abstract class SelectorRetrofitApi {
  factory SelectorRetrofitApi(Dio dio, {String baseUrl}) = _SelectorRetrofitApi;

  @GET('/pokemon/')
  Future<BaseResponseModel<List>> getPokemonsList();
}
