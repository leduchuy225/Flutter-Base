import 'package:get/get.dart';

import '../../../../models/installation/update_device_response.dart';

class SlidAndDividerController extends GetxController {
  final _data = Rx<UpdateDeviceResponse?>(null);

  UpdateDeviceResponse? get data => _data.value;

  set data(UpdateDeviceResponse? result) {
    if (result == null) {
      return;
    }
    _data.value = result;
    update();
  }
}
