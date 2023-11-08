import 'package:get/get.dart';

import '../services/connectivity_service.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ConnectivityService());
  }
}
