import 'package:flutter/material.dart';
import 'package:flutter_base/ui/authentication/login_screen.dart';
import 'package:flutter_base/widgets/function_item.dart';
import 'package:flutter_base/widgets/gradient_background.dart';
import 'package:get/get.dart';

import '../theme/styles.dart';
import '../widgets/dialog/dialog_widget.dart';
// import 'package:flutter_base/ui/home/home_screen.dart';
// import 'package:flutter_base/ui/settings/settings_screen.dart';
// import 'package:flutter_base/widgets/bottom_navigation/bottom_navigation_widget.dart';

// import '../../widgets/bottom_navigation/bottom_navigation_tab.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // List<GlobalKey<NavigatorState>> tabKeys = [
  //   GlobalKey<NavigatorState>(),
  //   GlobalKey<NavigatorState>(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      child: Row(
                        children: [
                          const Icon(
                            Icons.account_box_rounded,
                            size: 30,
                            color: AppColors.textLight,
                          ),
                          AppStyles.pdl10,
                          Text(
                            'Họ và tên',
                            style: AppTextStyles.h3.copyWith(
                              color: AppColors.textLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppStyles.pdl10,
                    IconButton(
                      icon: const Icon(
                        Icons.logout,
                        color: AppColors.textLight,
                      ),
                      onPressed: () {
                        MyDialog.alertDialog(
                          title: 'Xác nhận',
                          message: 'Bạn muốn đăng xuất ứng dụng ?',
                          okHandler: () {
                            Get.offAll(() => const LoginScreen());
                          },
                        );
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
                    onTap: () {},
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

    // return const Placeholder();
    // return MyBottomNavigation(
    //   pages: [
    //     BottomNavigationTab(
    //       label: 'Home',
    //       key: tabKeys[0],
    //       page: HomeScreen(),
    //       icon: const Icon(Icons.home),
    //     ),
    //     BottomNavigationTab(
    //       label: 'Setting',
    //       key: tabKeys[1],
    //       page: SettingsScreen(),
    //       icon: const Icon(Icons.settings),
    //     ),
    //   ],
    // );
  }
}
