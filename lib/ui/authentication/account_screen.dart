import 'package:flutter/material.dart';
import 'package:flutter_base/core/services/user_service.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/my_appbar.dart';
import 'package:flutter_base/widgets/text_field/text_field_controller.dart';
import 'package:flutter_base/widgets/text_field/text_field_widget.dart';
import 'package:get/get.dart';

import '../../widgets/scrollview_with_bottom_widget.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final _userService = Get.find<UserService>();

  final _emailTextController = MyTextFieldController();
  final _addressTextController = MyTextFieldController();

  @override
  void initState() {
    super.initState();

    _emailTextController.text = _userService.userInfor?.email ?? '';
    _addressTextController.text = _userService.userInfor?.address ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar.appBar('Tài khoản'),
      body: ScrollViewWithBottom(
        padding: AppStyles.horizontalPadding,
        bodyChild: Column(
          children: [
            AppStyles.pdt20,
            MyTextField(controller: _emailTextController, labelText: 'Email'),
            AppStyles.pdt20,
            MyTextField(
              labelText: 'Địa chỉ',
              controller: _addressTextController,
            ),
          ],
        ),
      ),
    );
  }
}
