import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogUtility {
  DialogUtility._();

  static void snackbar(String message) {
    Get.snackbar('Snackbar', message, snackPosition: SnackPosition.BOTTOM);
  }

  static void dialog(String message) {
    Get.dialog(Text(message));
  }
}
