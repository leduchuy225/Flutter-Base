import 'package:flutter_base/data/nodejs_api.dart';
import 'package:flutter_base/data/nodejs_retrofit_api.dart';
import 'package:flutter_base/data/pokemon_api.dart';
import 'package:flutter_base/data/pokemon_retrofit_api.dart';
import 'package:flutter_base/services/api/http_service.dart';
import 'package:get/instance_manager.dart';

void setupApiLocator() {
  final dio = Get.find<HttpService>().dio;

  Get.put(PokemonApi(api: PokemonRetrofitApi(dio)));

  Get.put(NodejsApi(api: NodejsRetrofitApi(dio)));
}
