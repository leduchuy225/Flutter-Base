import 'package:get/get.dart';

class MyCheckboxController extends GetxController {
  Rx<String> title = ''.obs;
  Rx<bool> isEnable = true.obs;
  Rx<bool?> isSelected = false.obs;
}
