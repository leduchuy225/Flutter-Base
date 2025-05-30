import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLoading extends StatelessWidget {
  static void show() {
    if (Get.isDialogOpen == true) {
      return;
    }
    Get.dialog(
      MyLoading(), barrierDismissible: true, barrierColor: Colors.green.shade50, //.withOpacity(0.5),
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
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blue[200],
        ),
        alignment: AlignmentDirectional.center,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50.0,
              width: 50.0,
              child: CircularProgressIndicator(),
            ),
            SizedBox(height: 16),
            Text('Loading.. Wait...'),
          ],
        ),
      ),
    );
  }
}
