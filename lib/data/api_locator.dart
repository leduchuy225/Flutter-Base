import 'package:flutter_base/core/services/http_service.dart';
import 'package:flutter_base/data/pokemon/pokemon_api.dart';
import 'package:flutter_base/data/pokemon/pokemon_retrofit_api.dart';
import 'package:flutter_base/data/selector/selector_api.dart';
import 'package:flutter_base/data/selector/selector_retrofit_api.dart';
import 'package:get/instance_manager.dart';

import '../core/services/service_locator.dart';

void setupApiLocator() {
  final dio = Get.find<HttpService>().dio;

  DI.lazyPut(() => PokemonApi(api: PokemonRetrofitApi(dio)));
  DI.lazyPut(() => SelectorApi(api: SelectorRetrofitApi(dio)));
}
