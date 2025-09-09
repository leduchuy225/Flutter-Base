import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/data/authentication_api.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/button/button_controller.dart';
import 'package:flutter_base/widgets/button/button_widget.dart';
import 'package:flutter_base/widgets/my_appbar.dart';
import 'package:flutter_base/widgets/my_texttile.dart';
import 'package:flutter_base/widgets/scrollview_with_bottom_widget.dart';
import 'package:flutter_base/widgets/title_number_indicator.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/utils/utils.dart';
import '../../models/authentication/second_fa_status_response.dart';
import '../../models/authentication/sms_vertification_payload.dart';

class SecondFaStatusScreen extends StatefulWidget {
  const SecondFaStatusScreen({super.key});

  @override
  State<SecondFaStatusScreen> createState() => _SecondFaStatusScreenState();
}

class _SecondFaStatusScreenState extends State<SecondFaStatusScreen> {
  SecondFaStatusResponse? _secondFaStatusState;

  final _otpController = TextEditingController();
  final _updateButtonController = MyButtonController();

  @override
  void initState() {
    super.initState();

    _updateButtonController.isEnable.value = false;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final data = await Get.find<AuthenticationApi>().get2FaStatus().callApi(
        isShowSuccessMessage: false,
      );
      if (data.data == null) {
        return;
      }
      setState(() {
        _secondFaStatusState = data.data;
      });
    });
  }

  List<Widget> get2FaStepWidgets() {
    final List<Widget> stepWidgets = [];
    if (isNotNullOrEmpty(_secondFaStatusState?.setupCode)) {
      stepWidgets.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Bấm vào đường dẫn',
                    style: AppTextStyles.body2.copyWith(
                      color: AppColors.primary,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        await launchMyURL(
                          _secondFaStatusState?.secondFaLink,
                          mode: LaunchMode.externalApplication,
                        );
                      },
                  ),
                  TextSpan(
                    text: ' hoặc nhập mã dưới đây',
                    style: AppTextStyles.body2.copyWith(
                      color: AppColors.textGreyDark,
                    ),
                  ),
                ],
              ),
            ),
            AppStyles.pdt15,
            MyTexttile(
              isShowCopyIcon: true,
              text: _secondFaStatusState?.setupCode,
              textStyle: AppTextStyles.body2.copyWith(
                color: AppColors.textGrey3,
              ),
            ),
          ],
        ),
      );
    }
    stepWidgets.add(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Nhập mã xác nhận vào input'),
          AppStyles.pdt20,
          Pinput(
            length: 6,
            controller: _otpController,
            keyboardType: TextInputType.number,
            onCompleted: (value) {
              _updateButtonController.isEnable.value =
                  _secondFaStatusState != null;
            },
          ),
        ],
      ),
    );

    return stepWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar.appBar('Cài đặt 2FA'),
      body: ScrollViewWithBottom(
        padding: AppStyles.horizontalPadding,
        bodyChild: Column(
          children: [
            AppStyles.pdt20,
            Row(
              children: [
                Text(
                  'Trạng thái 2FA',
                  style: AppTextStyles.body2.copyWith(
                    color: AppColors.textGrey2,
                  ),
                ),
                AppStyles.pdl15,
                Expanded(
                  child: Text(
                    'Đang ${_secondFaStatusState?.status == false ? 'bật' : 'tắt'}',
                    style: AppTextStyles.roboto.copyWith(
                      fontSize: AppFontSizes.s20,
                      fontWeight: FontWeight.bold,
                      color: _secondFaStatusState?.status == false
                          ? AppColors.success
                          : AppColors.error,
                    ),
                  ),
                ),
              ],
            ),
            AppStyles.pdt30,
            ...get2FaStepWidgets().mapIndexed((index, element) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                  children: [
                    TitleNumberIndicator.getnumber(
                      index + 1,
                      radius: 50,
                      color: AppColors.primary,
                      padding: const EdgeInsets.all(10),
                    ),
                    AppStyles.pdl15,
                    Expanded(child: element),
                  ],
                ),
              );
            }),
          ],
        ),
        bottomChild: MyButton(
          controller: _updateButtonController,
          buttonChild: ElevatedButton(
            child: Text(
              '${_secondFaStatusState?.status == false ? 'Tắt' : 'Bật'} xác thực 2FA',
            ),
            onPressed: () async {
              final data = await Get.find<AuthenticationApi>()
                  .switch2FaStatus(
                    SmsVertificationPayload(codeKey: _otpController.text),
                  )
                  .callApi();

              if (data.isSuccess) {
                Navigator.pop(context);
              }
            },
          ),
        ),
      ),
    );
  }
}
