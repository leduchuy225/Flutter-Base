import 'package:flutter/material.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/data/authentication_api.dart';
import 'package:flutter_base/models/authentication/forgot_password_payload.dart';
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

  @override
  Widget build(BuildContext context) {
    return AuthenticationScaffold(
      title: 'Cấp mật khẩu mới',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppStyles.pdt20,
          const Text('Mật khẩu mới sẽ được gửi qua email'),
          AppStyles.pdt30,
          MyTextField(labelText: 'Email', controller: _usernameController),
        ],
      ),
      bottomChild: ElevatedButton(
        child: const Text('Xác nhận'),
        onPressed: () async {
          if (!_usernameController.checkIsNotEmpty() ||
              !_usernameController.checkIsEmail()) {
            return;
          }

          final data = await Get.find<AuthenticationApi>()
              .forgotPassword(
                ForgotPasswordPayload(email: _usernameController.textTrim),
              )
              .callApi();

          if (data.isSuccess) {
            Get.offAll(() => const LoginScreen());
          }
        },
      ),
    );
  }
}
