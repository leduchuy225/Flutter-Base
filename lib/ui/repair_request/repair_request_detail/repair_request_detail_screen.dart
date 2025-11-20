import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/my_texttile.dart';
import 'package:get/get.dart';

import '../../../core/utils/datetime_utils.dart';
import '../../../core/utils/utils.dart';
import '../../../widgets/file_collection/file_collection_widget.dart';
import '../../new_installation_and_repair_request_share/common_installation_detail_screen.dart';
import 'repair_request_detail_controller.dart';

class RepairRequestDetailScreen extends StatefulWidget {
  const RepairRequestDetailScreen({super.key});

  @override
  State<RepairRequestDetailScreen> createState() =>
      _NewInstallationDetailScreenState();
}

class _NewInstallationDetailScreenState
    extends State<RepairRequestDetailScreen> {
  final _controller = Get.find<RepairRequestDetailController>();

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
      title: 'Chi tiết yêu cầu sửa chữa',
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
                  titleText: 'Ghi chú KH',
                  text: detailData?.customerNote,
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
