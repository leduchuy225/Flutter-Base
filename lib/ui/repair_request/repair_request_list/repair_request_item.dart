import 'package:flutter/material.dart';
import 'package:flutter_base/core/utils/datetime_utils.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/my_texttile.dart';

import '../../../models/repair_request/repair_request_list_model_response.dart';

class RepairRequestItem extends StatelessWidget {
  final void Function() onTapViewDetail;
  final RepairRequestListModelResponse item;

  const RepairRequestItem({
    super.key,
    required this.item,
    required this.onTapViewDetail,
  });

  @override
  Widget build(BuildContext context) {
    return MyTexttile.card(
      isViewDetail: true,
      tagColor: AppColors.primary,
      tag: 'Bước ${item.currentStep}',
      onTapViewDetail: onTapViewDetail,
      title: (item.idLong ?? '').toString(),
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
