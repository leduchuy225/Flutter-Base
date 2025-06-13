import 'package:get/get.dart';

import 'http_service.dart';

class DI {
  DI._();

  static void putPermanent<S>(S service) {
    Get.put(service, permanent: true);
  }

  static void lazyPut<S>(S Function() service) {
    Get.lazyPut(service, fenix: true);
  }
}

void setupServiceLocator() {
  DI.putPermanent(HttpService());
}
