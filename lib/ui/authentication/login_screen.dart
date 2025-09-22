import 'package:flutter/material.dart';
import 'package:flutter_base/core/services/user_service.dart';
import 'package:flutter_base/models/authentication/login_payload.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/ui/authentication/reset_password_screen.dart';
import 'package:get/get.dart';

import '../../core/const/constants.dart';
import '../../core/services/shared_preference_service.dart';
import '../../core/utils/validation.dart';
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

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
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
            validations: const [MyValidation.checkIsNotEmpty],
          ),
          AppStyles.pdt20,
          ValueListenableBuilder(
            valueListenable: _obscurePasswordNotifier,
            builder: (context, value, child) {
              return MyTextField(
                obscureText: value,
                labelText: 'Mật khẩu',
                controller: _passwordController,
                validations: const [MyValidation.checkIsNotEmpty],
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
          AppStyles.pdt10,
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
      bottomChild: ElevatedButton(
        child: const Text('Đăng nhập'),
        onPressed: () async {
          if (!_useNameController.checkValidation() ||
              !_passwordController.checkValidation()) {
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
    );
  }
}
