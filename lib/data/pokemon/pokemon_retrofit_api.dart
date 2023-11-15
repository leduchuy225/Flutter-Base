import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../models/base_response.dart';

part 'pokemon_retrofit_api.g.dart';

@RestApi()
abstract class PokemonRetrofitApi {
  factory PokemonRetrofitApi(Dio dio, {String baseUrl}) = _PokemonRetrofitApi;

  @GET('/pokemon/')
  Future<BaseResponseModel<List>> getPokemonsList();

  @GET('/pokemon/12/')
  Future<BaseResponseModel> getButterFreePokemon();

  @GET('/pokemon/huy')
  Future<BaseResponseModel> getPokemonFail();
}
