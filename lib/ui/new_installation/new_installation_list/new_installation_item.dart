import 'package:flutter/material.dart';
import 'package:flutter_base/core/utils/datetime_utils.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/my_texttile.dart';

import '../../../models/installation/installation_list_model_response.dart';
import '../../new_installation_and_repair_request_share/widgets/take_surver_widget.dart';

class NewInstallationItem extends StatelessWidget {
  final void Function() onTapViewDetail;
  final InstallationListModelResponse item;

  const NewInstallationItem({
    super.key,
    required this.item,
    required this.onTapViewDetail,
  });

  String? get surveyStatusText {
    switch (item.technicalStaffSurveyStatus) {
      case SurverStatusValue.Done:
        return SurveyStatusEnum.Done.description;
      case SurverStatusValue.Cancel:
        return SurveyStatusEnum.Cancel.description;
      case SurverStatusValue.Pending:
        return SurveyStatusEnum.Pending.description;
      default:
        return null;
    }
  }

  Color? get surveyStatusColor {
    switch (item.technicalStaffSurveyStatus) {
      case SurverStatusValue.Done:
        return AppColors.success;
      case SurverStatusValue.Cancel:
        return AppColors.error;
      case SurverStatusValue.Pending:
        return AppColors.warning;
      default:
        return null;
    }
  }

  Color get tagColor {
    if (item.isClosed == true) {
      return AppColors.error;
    }
    if (item.technicalStaffReportCompletedDate != null) {
      return AppColors.success;
    }
    return AppColors.primary;
  }

  String get tagText {
    return item.isClosed == true
        ? 'Đã đóng'
        : 'Bước ${item.currentStep}${item.technicalStaffReportCompletedDate == null ? '' : ' - DONE'}';
  }

  @override
  Widget build(BuildContext context) {
    return MyTexttile.card(
      tag: tagText,
      isViewDetail: true,
      tagColor: tagColor,
      onTapViewDetail: onTapViewDetail,
      title: (item.idLong ?? '').toString(),
      items: [
        MyTexttileItem(titleText: 'Tên KH', text: item.customersIdFullName),
        MyTexttileItem(titleText: 'Địa chỉ', text: item.address2),
        MyTexttileItem(
          titleText: 'Tên người yêu cầu',
          text: item.staffFullName,
        ),
        MyTexttileItem(
          isPhoneNumber: true,
          titleText: 'SĐT người yêu cầu',
          text: item.staffPhoneNumber,
        ),
        MyTexttileItem(titleText: 'Email người tạo', text: item.createdByEmail),
        MyTexttileItem(
          titleText: 'Ngày tạo',
          text: MyDatetimeUtils.formatDateFromAPI(item.createdDate),
        ),
        MyTexttileItem(
          text: surveyStatusText,
          titleText: 'Tình trạng khảo sát',
          textStyle: AppTextStyles.body2.copyWith(color: surveyStatusColor),
        ),
      ],
    );
  }
}
