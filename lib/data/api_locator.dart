import 'package:flutter_base/core/services/http_service.dart';
import 'package:get/instance_manager.dart';

import '../core/services/service_locator.dart';
import 'authentication_api.dart';
import 'installation_api.dart';
import 'repair_request_api.dart';

void setupApiLocator() {
  final dio = Get.find<HttpService>().dio;

  DI.lazyPut<InstallationApi>(() => InstallationApi(dio));
  DI.lazyPut<RepairRequestApi>(() => RepairRequestApi(dio));
  DI.lazyPut<AuthenticationApi>(() => AuthenticationApi(dio));
}
