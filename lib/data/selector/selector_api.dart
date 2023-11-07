import 'package:flutter_base/models/base_selector.dart';

import '../../extensions/future_extension.dart';
import '../selector/selector_retrofit_api.dart';

class SelectorApi {
  SelectorApi({required this.api});

  final SelectorRetrofitApi api;

  Future<List<MySelectorModel>> getPokemonsList({ApiParameters? apiParameters}) {
    print('API getPokemonsList');
    return Future.value([]);
  }
}
