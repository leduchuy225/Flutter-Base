import 'package:flutter/material.dart';
import 'package:flutter_base/core/services/user_service.dart';
import 'package:flutter_base/ui/dev_screen.dart';
import 'package:flutter_base/widgets/function_item.dart';
import 'package:flutter_base/widgets/gradient_background.dart';
import 'package:get/get.dart';

import '../theme/styles.dart';
import '../widgets/drawer/scaffold_drawer_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _userService = Get.find<UserService>();

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GradientBackground(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          return InkWell(
                            onTap: () {
                              InheritedDrawer.of(context)?.openDrawer();
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.account_box_rounded,
                                  size: 30,
                                  color: AppColors.textLight,
                                ),
                                AppStyles.pdl10,
                                Obx(() {
                                  return Text(
                                    _userService.userInfor?.email ?? '',
                                    style: AppTextStyles.h3.copyWith(
                                      color: AppColors.textLight,
                                    ),
                                  );
                                }),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    AppStyles.pdl10,
                    IconButton(
                      icon: const Icon(
                        Icons.logout,
                        color: AppColors.textLight,
                      ),
                      onPressed: () {
                        _userService.logOut();
                      },
                    ),
                  ],
                ),
              ],
            ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
