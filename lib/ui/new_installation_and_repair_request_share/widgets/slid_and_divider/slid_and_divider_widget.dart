import 'package:flutter/material.dart';
import 'package:flutter_base/widgets/my_texttile.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'slid_and_divider_controller.dart';
import 'slid_and_divider_selector_widget.dart';

class SlidAndDividerWidget extends StatelessWidget {
  final int? id;
  final int? countryId;
  final int? provinceId;
  final SlidAndDividerController controller;

  const SlidAndDividerWidget({
    super.key,
    this.id,
    this.countryId,
    this.provinceId,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (controller) {
        return MyTexttile.card(
          title: 'Thông tin thiết bị',
          suffixHeader: InkWell(
            child: const Icon(Icons.edit),
            onTap: () async {
              final result = await SlidAndDividerSelectorWidget.openDialog(
                id: id,
                countryId: countryId,
                provinceId: provinceId,
                defaultData: controller.data,
              );
              controller.data = result;
            },
          ),
          items: [
            MyTexttileItem(
              titleText: 'Tên SLID',
              text: controller.data?.slidCode,
            ),
            MyTexttileItem(
              titleText: 'Tên bộ chia',
              text: controller.data?.dividerCode,
            ),
            MyTexttileItem(
              titleText: 'Port',
              text: controller.data?.devicePort,
            ),
            MyTexttileItem(
              titleText: 'Account',
              text: controller.data?.deviceAcc,
            ),
            MyTexttileItem(
              titleText: 'Password',
              text: controller.data?.devicePass,
            ),
          ],
        );
      },
    );
  }
}
