import 'package:flutter/material.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/data/authentication_api.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/checkbox/checkbox_widget.dart';
import 'package:flutter_base/widgets/my_appbar.dart';
import 'package:flutter_base/widgets/text_field/text_field_controller.dart';
import 'package:get/get.dart';

import '../../models/authentication/change_password_payload.dart';
import '../../widgets/checkbox/checkbox_controller.dart';
import '../../widgets/scrollview_with_bottom_widget.dart';
import '../../widgets/text_field/text_field_widget.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final _currentPasswordController = MyTextFieldController();
  final _obscureCurrentPasswordNotifier = ValueNotifier(true);

  final _firstNewPasswordController = MyTextFieldController();
  final _obscureFirstNewPasswordNotifier = ValueNotifier(true);

  final _secondNewPasswordController = MyTextFieldController();
  final _obscureSecondNewPasswordNotifier = ValueNotifier(true);

  final _sendEmailCheckboxController = MyCheckboxController();

  Widget _buildIcon(bool value) {
    return Icon(
      value ? Icons.visibility_off_outlined : Icons.visibility_outlined,
      size: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar.appBar('Đổi mật khẩu'),
      body: ScrollViewWithBottom(
        padding: AppStyles.horizontalPadding,
        bodyChild: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppStyles.pdt20,
            ValueListenableBuilder(
              valueListenable: _obscureCurrentPasswordNotifier,
              builder: (context, value, child) {
                return MyTextField(
                  obscureText: value,
                  labelText: 'Mật khẩu hiện tại',
                  controller: _currentPasswordController,
                  suffixIcon: IconButton(
                    icon: _buildIcon(value),
                    onPressed: () {
                      _obscureCurrentPasswordNotifier.value = !value;
                    },
                  ),
                );
              },
            ),
            AppStyles.pdt20,
            ValueListenableBuilder(
              valueListenable: _obscureFirstNewPasswordNotifier,
              builder: (context, value, child) {
                return MyTextField(
                  obscureText: value,
                  labelText: 'Mật khẩu mới',
                  controller: _firstNewPasswordController,
                  suffixIcon: IconButton(
                    icon: _buildIcon(value),
                    onPressed: () {
                      _obscureFirstNewPasswordNotifier.value = !value;
                    },
                  ),
                );
              },
            ),
            AppStyles.pdt20,
            ValueListenableBuilder(
              valueListenable: _obscureSecondNewPasswordNotifier,
              builder: (context, value, child) {
                return MyTextField(
                  obscureText: value,
                  labelText: 'Nhập lại mật khẩu mới',
                  controller: _secondNewPasswordController,
                  suffixIcon: IconButton(
                    icon: _buildIcon(value),
                    onPressed: () {
                      _obscureSecondNewPasswordNotifier.value = !value;
                    },
                  ),
                );
              },
            ),
            AppStyles.pdt12,
            MyCheckbox(
              title: 'Gửi email',
              controller: _sendEmailCheckboxController,
            ),
            AppStyles.pdt20,
          ],
        ),
        bottomChild: ElevatedButton(
          child: const Text('Lưu thay đổi'),
          onPressed: () async {
            if (!_currentPasswordController.checkIsNotEmpty() ||
                !_firstNewPasswordController.checkIsNotEmpty() ||
                !_secondNewPasswordController.checkIsNotEmpty()) {
              return;
            }
            if (_secondNewPasswordController.text !=
                _firstNewPasswordController.text) {
              _secondNewPasswordController.shake(
                errorTexts: ['Không khớp với mật khẩu mới'],
              );
              return;
            }

            final data = await Get.find<AuthenticationApi>()
                .changePassword(
                  ChangePasswordPayload(
                    oldPassword: _currentPasswordController.textTrim,
                    newPassword: _firstNewPasswordController.textTrim,
                    confirmPassword: _firstNewPasswordController.textTrim,
                    sendMail: _sendEmailCheckboxController.isSelected.value,
                  ),
                )
                .callApi();

            if (data.isSuccess) {
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }
}
