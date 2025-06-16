import 'package:flutter/material.dart';
import 'package:flutter_base/ui/authentication/login_screen.dart';
import 'package:flutter_base/ui/authentication/widgets/authentication_scaffold.dart';
import 'package:flutter_base/widgets/text_field/text_field_controller.dart';
import 'package:flutter_base/widgets/text_field/text_field_widget.dart';
import 'package:get/get.dart';

import '../../theme/styles.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _usernameController = MyTextFieldController();

  final _firstNewPasswordController = MyTextFieldController();
  final _obscureFirstNewPasswordNotifier = ValueNotifier(true);

  final _secondNewPasswordController = MyTextFieldController();
  final _obscureSecondNewPasswordNotifier = ValueNotifier(true);

  Widget _buildIcon(bool value) {
    return Icon(
      value ? Icons.visibility_off_outlined : Icons.visibility_outlined,
      size: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthenticationScaffold(
      title: 'Cấp mật khẩu mới',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppStyles.pdt20,
          MyTextField(
            labelText: 'Tên đăng nhập',
            controller: _usernameController,
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
                labelText: 'Nhập mật khẩu mới',
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
          AppStyles.pdt30,
          ElevatedButton(
            onPressed: () {
              Get.offAll(() => const LoginScreen());

              // Get.to(() => SettingsScreen());

              // Get.back();
            },
            child: const Text('Xác nhận'),
          ),
        ],
      ),
    );
  }
}
