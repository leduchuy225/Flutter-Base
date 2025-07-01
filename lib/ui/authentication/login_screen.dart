import 'package:flutter/material.dart';
import 'package:flutter_base/core/services/user_service.dart';
import 'package:flutter_base/models/authentication/login_payload.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/ui/authentication/reset_password_screen.dart';
import 'package:flutter_base/widgets/button/button_controller.dart';
import 'package:flutter_base/widgets/button/button_widget.dart';
import 'package:get/get.dart';

import '../../core/const/config.dart';
import '../../core/services/shared_preference_service.dart';
import '../../widgets/text_field/text_field_controller.dart';
import '../../widgets/text_field/text_field_widget.dart';
import 'widgets/authentication_scaffold.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _obscurePasswordNotifier = ValueNotifier(true);

  final _useNameController = MyTextFieldController();
  final _passwordController = MyTextFieldController();

  final _loginButtonController = MyButtonController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((data) async {
      _useNameController.text = await SharedPreference.getStringValuesSF(
        SharedPreference.username,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AuthenticationScaffold(
      title: 'Đăng nhập',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppStyles.pdt20,
          MyTextField(
            labelText: 'Tên đăng nhập',
            controller: _useNameController,
          ),
          AppStyles.pdt20,
          ValueListenableBuilder(
            valueListenable: _obscurePasswordNotifier,
            builder: (context, value, child) {
              return MyTextField(
                obscureText: value,
                labelText: 'Mật khẩu',
                controller: _passwordController,
                suffixIcon: IconButton(
                  onPressed: () {
                    _obscurePasswordNotifier.value = !value;
                  },
                  icon: Icon(
                    value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    size: 20,
                  ),
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text('Quên mật khẩu', style: AppTextStyles.body1),
                onPressed: () {
                  Get.to(() => const ResetPasswordScreen());
                },
              ),
            ],
          ),
          AppStyles.pdt20,
        ],
      ),
      bottomChild: MyButton(
        controller: _loginButtonController,
        buttonChild: ElevatedButton(
          child: const Text('Đăng nhập'),
          onPressed: () async {
            if (!_useNameController.checkIsNotEmpty() ||
                !_passwordController.checkIsNotEmpty()) {
              return;
            }

            await SharedPreference.addStringToSF(
              SharedPreference.username,
              _useNameController.text,
            );

            final deviceToken = await Config().deviceToken;
            await UserService.login(
              LoginPayload(
                deviceId: deviceToken,
                taiKhoan: _useNameController.textTrim,
                password: _passwordController.textTrim,
              ),
            );
          },
        ),
      ),
    );
  }
}
