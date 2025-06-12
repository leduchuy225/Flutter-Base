import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';
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
          Pinput(
            length: 6,
            autofocus: true,
            controller: _otpController,
            onCompleted: (value) {},
          ),
        ],
      ),
    );
  }
}
