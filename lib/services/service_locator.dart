import 'package:get/instance_manager.dart';

import 'http_service.dart';
import 'sqlite_service.dart';

void setupServiceLocator() {
  Get.put(HttpService());

  Get.put(SqliteService());
}
