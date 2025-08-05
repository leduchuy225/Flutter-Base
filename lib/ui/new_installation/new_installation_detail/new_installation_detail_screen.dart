import 'package:flutter/material.dart';
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
                  titleText: 'Mã HĐ',
                  text: detailData?.contractCode,
                ),
                MyTexttileItem(
                  titleText: 'Gói cước',
                  text: detailData?.serviceIdTitle,
                ),
                MyTexttileItem(
                  titleText: 'Người tạo',
                  text: detailData?.createdByUserName,
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
                MyTexttileItem(titleText: 'CCCD', text: customerData?.cccd),
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
