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
      tag: item.isClosed == true ? 'Đã đóng' : 'Bước ${item.currentStep}',
      onTapViewDetail: onTapViewDetail,
      title: (item.idLong ?? '').toString(),
      items: [
        MyTexttileItem(titleText: 'Gói cước', text: item.serviceIdTitle),
        MyTexttileItem(titleText: 'Tên KH', text: item.customersIdFullName),
        MyTexttileItem(titleText: 'Địa chỉ', text: item.address2),
        MyTexttileItem(titleText: 'Tên người tạo', text: item.staffFullName),
        MyTexttileItem(
          isPhoneNumber: true,
          titleText: 'SĐT người tạo',
          text: item.staffPhoneNumber,
        ),
        MyTexttileItem(titleText: 'Email người tạo', text: item.createdByEmail),
        MyTexttileItem(
          titleText: 'Ngày tạo',
          text: MyDatetimeUtils.formatDateFromAPI(item.createdDate),
        ),
      ],
    );
  }
}
