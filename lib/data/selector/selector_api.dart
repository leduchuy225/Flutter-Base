import 'package:flutter_base/models/base_selector.dart';

import '../../extensions/future_extension.dart';
import '../selector/selector_retrofit_api.dart';

class SelectorApi {
  SelectorApi({required this.api});

  final SelectorRetrofitApi api;

  Future<List<MySelectorModel>> getPokemonsList({ApiParameters? apiParameters}) {
    return api.getPokemonsList().call().then((value) {
      return (value.results ?? []).map((e) {
        return MySelectorModel(id: e['name'], name: e['name'], description: e['url']);
      }).toList();
    });
  }
}
