import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routers/main_router.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          child: const Text('Home Screen'),
          onTap: () {
            Get.toNamed(MainRouter.SETTINGS);
          },
        ),
      ),
    );
  }
}
