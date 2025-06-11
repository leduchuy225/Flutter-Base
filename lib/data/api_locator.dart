import 'package:flutter_base/core/services/http_service.dart';
import 'package:flutter_base/data/pokemon/pokemon_api.dart';
import 'package:flutter_base/data/pokemon/pokemon_retrofit_api.dart';
import 'package:flutter_base/data/selector/selector_api.dart';
import 'package:flutter_base/data/selector/selector_retrofit_api.dart';
import 'package:get/instance_manager.dart';

void setupApiLocator() {
  final dio = Get.find<HttpService>().dio;

  Get.put(PokemonApi(api: PokemonRetrofitApi(dio)));

  Get.put(SelectorApi(api: SelectorRetrofitApi(dio)));
}
