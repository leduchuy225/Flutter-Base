import 'package:flutter/material.dart';
import 'package:flutter_base/widgets/my_texttile.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../models/installation/update_device_response.dart';
import '../../../../theme/styles.dart';
import 'slid_and_divider_controller.dart';
import 'slid_and_divider_selector_widget.dart';

class SlidAndDividerWidget extends StatelessWidget {
  final int? id;
  final bool isDone;
  final int? countryId;
  final int? provinceId;
  final bool isViewOnly;
  final SlidAndDividerController controller;
  final void Function(UpdateDeviceResponse?)? onSuccess;

  const SlidAndDividerWidget({
    super.key,
    this.id,
    this.countryId,
    this.onSuccess,
    this.provinceId,
    this.isDone = false,
    this.isViewOnly = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (controller) {
        return MyTexttile.card(
          title: 'Thông tin thiết bị',
          tagColor: AppColors.success,
          tag: isDone ? 'Đã thực hiện' : null,
          suffixHeader: Visibility(
            visible: !isViewOnly,
            child: InkWell(
              child: const Icon(Icons.edit),
              onTap: () async {
                final result = await SlidAndDividerSelectorWidget.openDialog(
                  id: id,
                  onSuccess: onSuccess,
                  countryId: countryId,
                  provinceId: provinceId,
                  defaultData: controller.data,
                );
                controller.data = result;
              },
            ),
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
