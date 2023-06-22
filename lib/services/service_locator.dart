import 'package:get/instance_manager.dart';

import 'api/http_service.dart';

void setupServiceLocator() {
  Get.put(HttpService());
}
