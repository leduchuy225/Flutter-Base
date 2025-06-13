import 'package:flutter/material.dart';
import 'package:flutter_base/core/services/cache_service.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/button/button_controller.dart';
import 'package:flutter_base/widgets/button/button_widget.dart';
import 'package:flutter_base/widgets/dialog/bottom_sheet_widget.dart';
import 'package:flutter_base/widgets/loading_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/services/shared_preference_service.dart';
import '../../theme/icon.dart';
import '../../widgets/text_field/text_field_controller.dart';
import '../../widgets/text_field/text_field_widget.dart';
import 'update_password_screen.dart';
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
            // hintText: 'Nhập số điện thoại',
            controller: _useNameController,
            onChanged: (text) {
              // _useNameController.errorTexts = [text];
              // _useNameController.shake(errorTexts: ['text']);
            },
          ),
          AppStyles.pdt20,
          ValueListenableBuilder(
            valueListenable: _obscurePasswordNotifier,
            builder: (context, value, child) {
              return MyTextField(
                obscureText: value,
                labelText: 'Mật khẩu',
                // hintText: 'Nhập mật khẩu',
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
                  Get.to(() => const UpdatePasswordScreen());
                },
              ),
            ],
          ),
          AppStyles.pdt20,
          MyButton(
            controller: _loginButtonController,
            buttonChild: ElevatedButton(
              onPressed: () async {
                final cache1 = CacheService();
                final cache2 = CacheService();

                cache1.write(key: '1', value: '1');

                print(cache2.read(key: '1'));

                await SharedPreference.addStringToSF(
                  SharedPreference.username,
                  _useNameController.text,
                );

                MyLoading.show();

                // Get.to(() => const OtpScreen());
              },
              child: const Text('Đăng nhập'),
            ),
          ),
          AppStyles.pdt20,
          Row(
            children: [
              Expanded(child: Divider(color: Colors.grey.shade200)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('Đăng nhập với', style: AppTextStyles.body1),
              ),
              Expanded(child: Divider(color: Colors.grey.shade200)),
            ],
          ),
          AppStyles.pdt20,
          OutlinedButton.icon(
            onPressed: () {
              _loginButtonController.enable = true;

              MyBottomSheet.showDraggableScrollableSheet(
                context,
                builder: (context, scrollController) {
                  return ListView.builder(
                    controller: scrollController,
                    itemBuilder: (context, index) {
                      return Text(index.toString());
                    },
                    itemCount: 100,
                  );

                  // return HomeScreen();
                },
              );
            },
            icon: SvgPicture.asset(MyIcons.google),
            label: const Text('Google'),
          ),
        ],
      ),
    );
  }
}
