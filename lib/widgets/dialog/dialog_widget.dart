import 'package:flutter/material.dart';
import 'package:flutter_base/theme/app_theme.dart';
import 'package:get/get.dart';

enum SnackbarType { ERROR, SUCCESS, WARNING, INFORMATION }

class MyDialog {
  MyDialog._();

  static void snackbar(
    String? message, {
    Widget? icon,
    String title = 'Notification',
    SnackbarType type = SnackbarType.INFORMATION,
  }) {
    if ((message ?? '').isEmpty) {
      return;
    }
    Get.showSnackbar(
      GetSnackBar(
        icon: icon,
        title: title,
        message: message,
        backgroundColor: type.colors[0],
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static void alertDialog(String message) {
    Get.dialog(
      AlertDialog(
        content: Text(message),
        actions: [
          TextButton(onPressed: () {}, child: const Text('OK')),
          TextButton(
            onPressed: () {
              if (Get.isDialogOpen == true) {
                Get.back();
              }
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
