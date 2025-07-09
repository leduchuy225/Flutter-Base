import 'package:flutter/material.dart';
import 'package:flutter_base/ui/dev_screen.dart';
import 'package:flutter_base/widgets/function_item.dart';
import 'package:flutter_base/widgets/my_appbar.dart';
import 'package:get/get.dart';

import '../core/services/notification_service.dart';
import '../theme/styles.dart';
import '../widgets/drawer/scaffold_drawer_widget.dart';
import 'new_installation/new_installation_list/new_installation_list.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await NotificationService.initializeFBMessaging(context);
    });
  }

  @override
  void dispose() {
    super.dispose();
    NotificationService.cancel();
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
                    title: 'Yêu cầu lắp mới',
                    icon: Icons.home_repair_service_rounded,
                    onTap: () {
                      Get.to(() => const NewInstallationListScreen());
                    },
                  ),
                  FunctionItem(
                    counter: 10,
                    title: 'DEV',
                    icon: Icons.developer_board,
                    onTap: () {
                      Get.to(() => const DevScreen());
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
