import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/ui/authentication/widgets/authentication_scaffold.dart';
import 'package:flutter_base/widgets/text_field/text_field_controller.dart';
import 'package:get/get.dart';

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

  Widget _buildIcon(bool value) {
    return Icon(
      value ? Icons.visibility_off_outlined : Icons.visibility_outlined,
      size: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthenticationScaffold(
      title: 'Đổi mật khẩu',
      child: Column(
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
              Get.back();
            },
            child: const Text('Lưu thay đổi'),
          ),
        ],
      ),
    );
  }
}
