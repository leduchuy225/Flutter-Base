import 'package:flutter_base/core/services/http_service.dart';
import 'package:flutter_base/data/mock/mock_authentication_api.dart';
import 'package:flutter_base/data/mock/mock_installation_api.dart';
import 'package:get/instance_manager.dart';

import '../core/services/service_locator.dart';
import 'authentication_api.dart';
import 'installation_api.dart';
import 'jsonplaceholder_api.dart';
import 'mock/mock_repair_request_api.dart';
import 'repair_request_api.dart';

void setupApiLocator() {
  final dio = Get.find<HttpService>().dio;

  DI.lazyPut(() => JsonPlaceholderApi(dio));
  DI.lazyPut<InstallationApi>(() => MockInstallationApi(dio));
  DI.lazyPut<RepairRequestApi>(() => MockRepairRequestApi(dio));
  DI.lazyPut<AuthenticationApi>(() => MockAuthenticationApi(dio));
}
