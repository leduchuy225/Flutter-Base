import 'package:flutter_base/data/api_base.dart';
import 'package:flutter_base/data/pokemon_retrofit_api.dart';

class PokemonApi extends ApiBase {
  PokemonApi({required this.api});

  final PokemonRetrofitApi api;

  Future getPokemonsList() {
    print('API getPokemonsList');
    return callAPI(api.getPokemonsList);
  }
}
