import 'package:flutter/material.dart';
import 'package:flutter_base/ui/authentication/account_screen.dart';
import 'package:flutter_base/ui/authentication/update_password_screen.dart';
import 'package:flutter_base/widgets/function_item.dart';
import 'package:get/get.dart';

import '../../theme/styles.dart';
import '../../ui/authentication/login_screen.dart';
import '../dialog/dialog_widget.dart';

// part 'drawer_inherited_widget.dart';

class MyDrawer extends StatelessWidget {
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
                        icon: Icons.logout,
                        title: 'Đăng xuất',
                        onTap: () {
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
                ),
              ],
            ),
          ),
          const Padding(
            child: Text('HELLO WORLD'),
            padding: EdgeInsetsGeometry.all(12),
          ),
          // Align(child: Text('HELLO WORLD'), alignment: Alignment.bottomCenter),
        ],
      ),
    );
  }
}
