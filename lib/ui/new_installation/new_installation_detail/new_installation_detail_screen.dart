import 'package:flutter/material.dart';
import 'package:flutter_base/core/utils/utils.dart';
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
