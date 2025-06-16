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

  static void alertDialog({
    required String message,
    String title = 'Thông báo',
    void Function()? okHandler,
    bool isDismissOnTap = true,
  }) {
    Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              if (isDismissOnTap && Get.isDialogOpen == true) {
                Get.back();
              }
            },
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              if (isDismissOnTap && Get.isDialogOpen == true) {
                Get.back();
              }
              if (okHandler != null) {
                okHandler();
              }
            },
            child: const Text('Đồng ý'),
          ),
        ],
      ),
    );
  }
}
