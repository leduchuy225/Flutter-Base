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
        : 'Bước ${item.currentStep}${item.technicalStaffReportCompletedDate == null ? '' : ' - HT'}';
  }

  @override
  Widget build(BuildContext context) {
    return MyTexttile.card(
      tag: tagText,
      isViewDetail: true,
      tagColor: tagColor,
      onTapViewDetail: onTapViewDetail,
      title: '${item.customersIdFullName ?? ''}\n${item.serviceIdTitle ?? ''}',
      items: [
        MyTexttileItem(titleText: 'Tên KH', text: item.customersIdFullName),
        MyTexttileItem(titleText: 'Dịch vụ', text: item.serviceIdTitle),
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
        MyTexttileItem(
          titleText: 'Ngày đấu nối',
          text: MyDatetimeUtils.formatDateFromAPI(
            item.startDate,
            toFormat: MyDateFormatEnum.DATE_TIME24s,
          ),
        ),
        MyTexttileItem(
          titleText: 'Ngày KT gói cước',
          text: MyDatetimeUtils.formatDateFromAPI(
            item.endDate,
            toFormat: MyDateFormatEnum.DATE_TIME24s,
          ),
        ),
        MyTexttileItem(
          text: surveyStatusText,
          titleText: 'Tình trạng khảo sát',
          textStyle: AppTextStyles.body2.copyWith(color: surveyStatusColor),
        ),
        MyTexttileItem(
          titleText: 'Thời gian HT',
          text: MyDatetimeUtils.formatDateFromAPI(
            item.technicalStaffReportCompletedDate,
          ),
        ),
        MyTexttileItem(
          titleText: 'Thời gian đóng',
          text: MyDatetimeUtils.formatDateFromAPI(item.closedDate),
        ),
        MyTexttileItem(titleText: 'Lý do đóng', text: item.closedNote),
        MyTexttileItem(
          titleText: 'Hệ số K',
          text: item.kCoefficient,
          textStyle: AppTextStyles.body1,
        ),
        MyTexttileItem(
          titleText: 'Đánh giá',
          textStyle: AppTextStyles.body1,
          text: item.technicalStaffRating != null
              ? '${item.technicalStaffRating}/10'
              : '',
        ),
        MyTexttileItem(
          titleText: 'Cảnh báo',
          isHide: (item.listWarning ?? []).isEmpty,
          text: (item.listWarning ?? []).join('\n• '),
          textStyle: AppTextStyles.body2.copyWith(color: AppColors.error),
        ),
      ],
    );
  }
}
