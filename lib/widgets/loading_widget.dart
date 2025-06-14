import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:get/get.dart';

class MyLoading extends StatelessWidget {
  static void show() {
    if (Get.isDialogOpen == true) {
      return;
    }
    Get.dialog(
      MyLoading(),
      barrierDismissible: true,
      barrierColor: Colors.black54, //.withOpacity(0.5),
    );
  }

  static void hide() {
    if (Get.isDialogOpen == false) {
      return;
    }
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                constraints: const BoxConstraints(
                  minWidth: 200.0,
                  maxWidth: 280.0,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.fromLTRB(10, 50, 10, 20),
                child: Column(
                  children: [
                    Text(
                      'Đang xử lý yêu cầu...',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.title2.copyWith(
                        color: AppColors.primary,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(width: 5, color: Colors.white),
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                ),
                child: const SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(color: AppColors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
