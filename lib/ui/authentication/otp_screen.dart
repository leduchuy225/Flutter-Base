import 'package:flutter/material.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/ui/main_screen.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../data/authentication_api.dart';
import '../../models/authentication/sms_vertification_payload.dart';
import 'widgets/authentication_scaffold.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _otpController = TextEditingController();

  Future<void> _onCompleted(String value) async {
    final data = await Get.find<AuthenticationApi>()
        .checkSmsVertification(SmsVertificationPayload(codeKey: value))
        .callApi(isShowSuccessMessage: false);

    if (data.isSuccess) {
      Get.offAll(() => MainScreen());
      return;
    }

    _otpController.clear();
  }

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
            keyboardType: TextInputType.number,
            onCompleted: (value) async {
              await _onCompleted(value);
            },
          ),
          const SizedBox(height: 100),
          Center(
            child: Column(
              children: [
                const Text('Không nhận được mã OTP ?'),
                AppStyles.pdt4,
                TextButton(
                  child: Text(
                    'Gửi lại mã OTP',
                    style: AppTextStyles.body1.copyWith(
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
