// import 'package:flutter_base/core/extensions/future_extension.dart';
// import 'package:flutter_base/data/pokemon/pokemon_retrofit_api.dart';

// import '../../models/base_response.dart';

// class PokemonApi {
//   PokemonApi({required this.api});

//   final PokemonRetrofitApi api;

//   Future<BaseResponse<List>> getPokemonsList({ApiParameters? apiParameters}) {
//     print('API getPokemonsList');
//     return api.getPokemonsList().call(apiParameters: apiParameters);
//   }

//   Future<BaseResponse> getButterFreePokemon({ApiParameters? apiParameters}) {
//     return api.getButterFreePokemon().call(apiParameters: apiParameters);
//   }

//   Future<BaseResponse> getPokemonFail() {
//     return api.getPokemonFail().call();
//   }
// }
