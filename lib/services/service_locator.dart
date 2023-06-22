import 'package:get/instance_manager.dart';

import 'http_service.dart';

void setupServiceLocator() {
  Get.put(HttpService());
}
