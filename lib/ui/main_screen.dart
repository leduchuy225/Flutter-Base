import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/const/config.dart';
import 'package:flutter_base/ui/dev_screen.dart';
import 'package:flutter_base/widgets/function_item.dart';
import 'package:flutter_base/widgets/my_appbar.dart';
import 'package:flutter_base/widgets/my_texttile.dart';
import 'package:get/get.dart';

import '../core/services/notification_service.dart';
import '../theme/styles.dart';
import '../widgets/drawer/scaffold_drawer_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await NotificationService.initializeFBMessaging((message) {
        NotificationService.navigateFromNotification(context, message: message);
      });

      final initialMessage = await FirebaseMessaging.instance
          .getInitialMessage();

      if (initialMessage != null) {
        NotificationService.navigateFromNotification(
          context,
          message: initialMessage,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      appBar: MyAppbar.appBar('Màn hình chính'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppStyles.pdt15,
            Padding(
              padding: AppStyles.horizontalPadding,
              child: Column(
                children: [
                  FunctionItem(
                    counter: 10,
                    title: 'Sửa chữa',
                    icon: Icons.home_repair_service_rounded,
                    onTap: () {
                      Get.to(() => const DevScreen());
                    },
                  ),
                  FunctionItem(
                    title: 'Sửa chữa',
                    icon: Icons.home_repair_service_rounded,
                    onTap: () {},
                  ),
                  FunctionItem(
                    title: 'Sửa chữa',
                    icon: Icons.home_repair_service_rounded,
                    onTap: () {},
                  ),
                  AppStyles.pdt30,
                  FutureBuilder(
                    future: Config().deviceToken,
                    builder: (context, asyncSnapshot) {
                      return MyTexttile(
                        isShowCopyIcon: true,
                        text: asyncSnapshot.data,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
