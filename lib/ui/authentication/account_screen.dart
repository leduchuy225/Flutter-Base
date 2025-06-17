import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/my_appbar.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar.appBar('Tài khoản'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Họ và tên',
                style: AppTextStyles.body2.copyWith(color: AppColors.textGrey2),
              ),
              subtitle: Text(
                'Lê Đức Huy',
                style: AppTextStyles.title1.copyWith(
                  color: AppColors.fontBlack,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
