import 'package:flutter/material.dart';
import 'package:flutter_base/core/services/cache_service.dart';
import 'package:flutter_base/core/services/user_service.dart';
import 'package:flutter_base/ui/authentication/account_screen.dart';
import 'package:flutter_base/ui/authentication/update_password_screen.dart';
import 'package:flutter_base/widgets/function_item.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../theme/styles.dart';
import '../../ui/authentication/2fa_status_screen.dart';

class MyDrawer extends StatelessWidget {
  final _userService = Get.find<UserService>();

  String get packageInfoText {
    final packageInfo = CacheService().read<PackageInfo>(
      key: CacheService.packageInfo,
    );
    if (packageInfo == null) {
      return '';
    }
    return 'Phiên bản ${packageInfo.version} - ${packageInfo.buildNumber}';
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.bgColorScreen,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 150,
                  child: DrawerHeader(
                    decoration: const BoxDecoration(color: AppColors.primary),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Họ và tên',
                          style: AppTextStyles.h3.copyWith(
                            color: AppColors.textLight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsGeometry.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      FunctionItem(
                        title: 'Tài khoản',
                        icon: Icons.account_circle,
                        onTap: () {
                          Get.to(() => const AccountScreen());
                        },
                      ),
                      FunctionItem(
                        title: 'Đổi mật khẩu',
                        icon: Icons.password_outlined,
                        onTap: () {
                          Get.to(() => const UpdatePasswordScreen());
                        },
                      ),
                      FunctionItem(
                        title: 'Cài đặt 2FA',
                        icon: Icons.settings,
                        onTap: () {
                          Get.to(() => const SecondFaStatusScreen());
                        },
                      ),
                      FunctionItem(
                        icon: Icons.logout,
                        title: 'Đăng xuất',
                        onTap: () {
                          _userService.logOut();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            child: Text(packageInfoText, style: AppTextStyles.body1),
            padding: const EdgeInsetsGeometry.symmetric(
              vertical: 20,
              horizontal: 12,
            ),
          ),
        ],
      ),
    );
  }
}
