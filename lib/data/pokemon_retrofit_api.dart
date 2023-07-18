import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'pokemon_retrofit_api.g.dart';

@RestApi()
abstract class PokemonRetrofitApi {
  factory PokemonRetrofitApi(Dio dio, {String baseUrl}) = _PokemonRetrofitApi;

  @GET('/pokemon/')
  Future getPokemonsList();

  @GET('/pokemon/huy')
  Future getPokemonFail();
}
