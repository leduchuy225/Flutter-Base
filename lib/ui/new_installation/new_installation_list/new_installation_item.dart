import 'package:flutter/material.dart';
import 'package:flutter_base/core/utils/datetime_utils.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/my_texttile.dart';
import 'package:get/get.dart';

import '../../../models/installation/installation_list_model_response.dart';
import '../new_installation_detail/new_installation_detail_controller.dart';
import '../new_installation_detail/new_installation_detail_screen.dart';

class NewInstallationItem extends StatelessWidget {
  final InstallationListModelResponse item;

  const NewInstallationItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return MyTexttile.card(
      isViewDetail: true,
      tagColor: AppColors.primary,
      tag: 'Bước ${item.currentStep}',
      title: (item.idLong ?? '').toString(),
      onTapViewDetail: () {
        Get.to(
          () {
            return const NewInstallationDetailScreen();
          },
          binding: BindingsBuilder.put(() {
            return NewInstallationDetailController();
          }),
        );
      },
      items: [
        MyTexttileItem(titleText: 'Gói cước', text: item.serviceIdTitle),
        MyTexttileItem(titleText: 'Tên KH', text: item.customersIdFullName),
        MyTexttileItem(titleText: 'CCCD KH', text: item.customersIdCccd),
        MyTexttileItem(titleText: 'Địa chỉ', text: item.address2),
        MyTexttileItem(titleText: 'Người tạo', text: item.createdByUserName),
        MyTexttileItem(
          titleText: 'Ngày tạo',
          text: DatetimeUtils.formatDateFromAPI(item.createdDate),
        ),
      ],
    );
  }
}
