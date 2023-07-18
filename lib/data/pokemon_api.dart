import 'package:flutter_base/core/api_base.dart';
import 'package:flutter_base/data/pokemon_retrofit_api.dart';

class PokemonApi extends ApiBase implements PokemonRetrofitApi {
  PokemonApi({required this.api});

  final PokemonRetrofitApi api;

  @override
  Future getPokemonsList({ApiParameters? apiParameters}) {
    print('API getPokemonsList');
    return callAPI(api.getPokemonsList, apiParameters: apiParameters);
  }

  @override
  Future getPokemonFail({ApiParameters? apiParameters}) {
    print('API getPokemonsFail');
    return callAPI(api.getPokemonFail, apiParameters: apiParameters);
  }
}
