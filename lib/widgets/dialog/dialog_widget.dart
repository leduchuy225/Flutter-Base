import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDialog {
  MyDialog._();

  static void snackbar(String message) {
    Get.snackbar(
      'Notification',
      message,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(16),
    );
  }

  static void dialog(String message) {
    Get.dialog(AlertDialog(
      content: const Text('Do you love me ?'),
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text('OK'),
        ),
        TextButton(
          onPressed: () {
            if (Get.isDialogOpen == true) {
              Get.back();
            }
          },
          child: const Text('Cancel'),
        )
      ],
    ));
  }
}
