import 'package:flutter_base/data/pokemon_retrofit_api.dart';

class PokemonApi {
  PokemonApi({required this.api});

  final PokemonRetrofitApi api;

  Future getPokemonsList() {
    print('API getPokemonsList');
    return api.getPokemonsList();
  }
}
