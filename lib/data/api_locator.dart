import 'package:flutter_base/core/services/http_service.dart';
import 'package:flutter_base/data/bo_chia_api.dart';
import 'package:flutter_base/data/olt_api.dart';
import 'package:flutter_base/data/pon_id_api.dart';
import 'package:flutter_base/data/slid_api.dart';
import 'package:get/instance_manager.dart';

import '../core/services/service_locator.dart';
import 'authentication_api.dart';
import 'customer_api.dart';
import 'installation_api.dart';
import 'repair_request_api.dart';

void setupApiLocator() {
  final dio = Get.find<HttpService>().dio;

  DI.lazyPut<CustomerApi>(() => CustomerApi(dio));
  DI.lazyPut<InstallationApi>(() => InstallationApi(dio));
  DI.lazyPut<RepairRequestApi>(() => RepairRequestApi(dio));
  DI.lazyPut<AuthenticationApi>(() => AuthenticationApi(dio));

  DI.lazyPut<OltApi>(() => OltApi(dio));
  DI.lazyPut<SlidApi>(() => SlidApi(dio));
  DI.lazyPut<PonIdApi>(() => PonIdApi(dio));
  DI.lazyPut<BoChiaApi>(() => BoChiaApi(dio));
}
