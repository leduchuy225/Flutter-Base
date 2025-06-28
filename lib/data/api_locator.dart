import 'package:flutter_base/core/services/http_service.dart';
import 'package:get/instance_manager.dart';

import '../core/services/service_locator.dart';
import 'jsonplaceholder/jsonplaceholder_api.dart';
import 'jsonplaceholder/jsonplaceholder_retrofit_api.dart';

void setupApiLocator() {
  final dio = Get.find<HttpService>().dio;

  DI.lazyPut(() => JsonPlaceholderApi(api: JsonPlaceholderRetrofitApi(dio)));
}
