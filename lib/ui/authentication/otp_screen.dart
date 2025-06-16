import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/ui/main_screen.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import 'widgets/authentication_scaffold.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AuthenticationScaffold(
      title: 'OTP',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppStyles.pdt20,
          const Text('Nhập mã OTP'),
          AppStyles.pdt15,
          Pinput(
            length: 6,
            autofocus: true,
            controller: _otpController,
            onCompleted: (value) {
              Get.offAll(() => MainScreen());
            },
          ),
          AppStyles.pdt50,
          Center(
            child: Column(
              children: [
                const Text('Không nhận được mã OTP ?'),
                AppStyles.pdt10,
                TextButton(
                  child: Text(
                    'Gửi lại mã OTP',
                    style: AppTextStyles.title1.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
