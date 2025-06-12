import 'package:flutter/material.dart';
import 'package:flutter_base/ui/authentication/widgets/authentication_scaffold.dart';
import 'package:flutter_base/widgets/text_field/text_field_controller.dart';
import 'package:flutter_base/widgets/text_field/text_field_widget.dart';

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
        children: [MyTextField(controller: _usernameController)],
      ),
    );
  }
}
