import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/my_texttile.dart';
import 'package:get/get.dart';

import '../../../core/utils/datetime_utils.dart';
import '../../../core/utils/utils.dart';
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
                  titleText: 'Gói cước',
                  text: detailData?.serviceIdTitle,
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
                  titleText: 'Người tạo',
                  text: detailData?.createdByUserName,
                ),
                MyTexttileItem(
                  titleText: 'Email người tạo',
                  text: detailData?.createdByEmail,
                ),
                MyTexttileItem(
                  titleText: 'Ngày tạo',
                  text: MyDatetimeUtils.formatDateFromAPI(
                    detailData?.createdDate,
                    toFormat: MyDateFormatEnum.DATE_TIME24s,
                  ),
                ),
                MyTexttileItem(
                  titleText: 'Ngày HT dự kiến',
                  text: MyDatetimeUtils.formatDateFromAPI(
                    detailData?.expectedCompletionDate,
                    toFormat: MyDateFormatEnum.DATE_TIME24s,
                  ),
                ),
              ],
            ),
            AppStyles.pdt15,
            MyTexttile.card(
              title: 'Thông tin KH',
              items: [
                MyTexttileItem(
                  isCopy: true,
                  titleText: 'Mã KH',
                  text: customerData?.code,
                ),
                MyTexttileItem(
                  titleText: 'Tên KH',
                  text: customerData?.fullName,
                ),
                MyTexttileItem(
                  titleText: 'Ngày sinh',
                  text: MyDatetimeUtils.formatDateFromAPI(
                    customerData?.birthDay,
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
              ],
            ),
          ],
        );
      },
    );
  }
}
