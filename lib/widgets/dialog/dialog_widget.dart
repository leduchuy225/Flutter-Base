import 'package:flutter/material.dart';
import 'package:flutter_base/core/utils/utils.dart';
import 'package:flutter_base/theme/app_theme.dart';
import 'package:get/get.dart';

enum SnackbarType { ERROR, SUCCESS, WARNING, INFORMATION }

class MyDialog {
  MyDialog._();

  static void snackbar(
    String? message, {
    Widget? icon,
    String title = 'Thông báo',
    SnackbarType type = SnackbarType.WARNING,
  }) {
    if (isNullOrEmpty(message)) {
      return;
    }

    Widget _buildDefaultIcon() {
      switch (type) {
        case SnackbarType.SUCCESS:
          return const Icon(Icons.system_security_update_good_outlined);
        case SnackbarType.ERROR:
          return const Icon(Icons.error);
        case SnackbarType.WARNING:
          return const Icon(Icons.warning);
        case SnackbarType.INFORMATION:
          return const Icon(Icons.perm_device_information);
      }
    }

    Get.showSnackbar(
      GetSnackBar(
        title: title,
        message: message,
        shouldIconPulse: false,
        backgroundColor: type.colors[0],
        icon: icon ?? _buildDefaultIcon(),
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
