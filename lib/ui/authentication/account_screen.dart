import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/my_appbar.dart';

import '../../widgets/my_texttile.dart';

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
        padding: AppStyles.horizontalPadding,
        child: Column(
          children: [
            AppStyles.pdt20,
            MyTexttile.showList(
              textFlex: 2,
              maxLines: 5,
              labelFlex: 1,
              items: [
                MyTexttileItem(titleText: 'Họ và tên', text: 'Lê Đức Huy'),
                MyTexttileItem(titleText: 'Ngày sinh', text: '22/05/2000'),
                MyTexttileItem(
                  titleText: 'App',
                  text:
                      '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."',
                ),
              ],
            ),
          ],
        ),
        // child: Column(
        //   children: [
        //     MyTexttile(titleText: 'Họ và tên', text: 'Lê Đức Huy'),
        //     MyTexttile(titleText: 'Ngày sinh', text: '22/05/2000'),
        //     MyTexttile(titleText: 'App', text: 'MobiFiber'),
        //   ],
        // ),
      ),
    );
  }
}
