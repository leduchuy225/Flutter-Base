import 'package:flutter/material.dart';
import 'package:flutter_base/core/utils/utils.dart';
import 'package:flutter_base/widgets/file_collection/file_collection_widget.dart';
import 'package:get/get.dart';

import '../../../core/utils/datetime_utils.dart';
import '../../../theme/styles.dart';
import '../../../widgets/my_texttile.dart';
import '../../new_installation_and_repair_request_share/common_installation_detail_screen.dart';
import 'new_installation_detail_controller.dart';

class NewInstallationDetailScreen extends StatefulWidget {
  const NewInstallationDetailScreen({super.key});

  @override
  State<NewInstallationDetailScreen> createState() =>
      _NewInstallationDetailScreenState();
}

class _NewInstallationDetailScreenState
    extends State<NewInstallationDetailScreen> {
  final _controller = Get.find<NewInstallationDetailController>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _controller.getDetailData();
    });
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonInstallationDetailScreen(
      controller: _controller,
      title: 'Chi tiết lắp đặt mới',
      buildInformationChild: (context, controller) {
        final detailData = controller.detailData;
        final customerData = detailData?.mbCustomerViewModel;
        return Column(
          children: [
            MyTexttile.card(
              title: 'Thông tin yêu cầu',
              items: [
                MyTexttileItem(
                  titleText: 'Dịch vụ',
                  text: detailData?.serviceIdTitle,
                ),
                MyTexttileItem(
                  titleText: 'Hệ số K',
                  text: detailData?.kCoefficient,
                  textStyle: AppTextStyles.body1,
                ),
                MyTexttileItem(
                  titleText: 'Tọa độ',
                  text: detailData?.googleMap,
                  trailing: InkWell(
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(Icons.directions, color: AppColors.primary),
                    ),
                    onTap: () {
                      openLocationInMap(coordinates: detailData?.googleMap);
                    },
                  ),
                ),
                MyTexttileItem(
                  titleText: 'Tên người yêu cầu',
                  text: detailData?.staffFullName,
                ),
                MyTexttileItem(
                  isPhoneNumber: true,
                  titleText: 'SĐT người yêu cầu',
                  text: detailData?.staffPhoneNumber,
                ),
                MyTexttileItem(
                  titleText: 'Ngày đấu nối',
                  text: MyDatetimeUtils.formatDateFromAPI(
                    detailData?.startDate,
                    toFormat: MyDateFormatEnum.DATE_TIME24s,
                  ),
                ),
                MyTexttileItem(
                  titleText: 'Ngày KT gói cước',
                  text: MyDatetimeUtils.formatDateFromAPI(
                    detailData?.endDate,
                    toFormat: MyDateFormatEnum.DATE_TIME24s,
                  ),
                ),
                MyTexttileItem(
                  titleText: 'Đánh giá',
                  textStyle: AppTextStyles.body1,
                  text: detailData?.technicalStaffRating != null
                      ? '${detailData?.technicalStaffRating}/10'
                      : '',
                ),
                MyTexttileItem(
                  titleText: 'Cảnh báo',
                  isHide: (detailData?.listWarning ?? []).isEmpty,
                  text: (detailData?.listWarning ?? []).join('\n• '),
                  textStyle: AppTextStyles.body2.copyWith(
                    color: AppColors.error,
                  ),
                ),
              ],
            ),
            AppStyles.pdt15,
            MyTexttile.card(
              title: 'Thông tin KH',
              items: [
                MyTexttileItem(
                  titleText: 'Tên KH',
                  text: customerData?.fullName,
                ),
                MyTexttileItem(
                  titleText: 'Ngày sinh',
                  text: MyDatetimeUtils.formatDateFromAPI(
                    customerData?.birthDay,
                    toFormat: MyDateFormatEnum.DATE,
                  ),
                ),
                MyTexttileItem(
                  titleText: 'SĐT',
                  isPhoneNumber: true,
                  text: customerData?.phoneNumber,
                ),
                MyTexttileItem(
                  titleText: 'Địa chỉ',
                  text: customerData?.address2,
                ),
                MyTexttileItem(titleText: 'CCCD', text: customerData?.cccd),
                MyTexttileItem(
                  titleText: 'Ngày cấp CCCD',
                  text: MyDatetimeUtils.formatDateFromAPI(
                    customerData?.cccdIssue,
                    toFormat: MyDateFormatEnum.DATE,
                  ),
                ),
                MyTexttileItem(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: FileCollectionWidget(
                      isViewImageOnly: true,
                      title: 'Ảnh CCCD',
                      controller: controller.cccdImageController,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
