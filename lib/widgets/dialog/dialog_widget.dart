import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDialog {
  MyDialog._();

  static void snackbar(String message) {
    Get.snackbar('Notification', message, snackPosition: SnackPosition.TOP);
  }

  static void dialog(String message) {
    Get.dialog(Text(message));
  }
}
