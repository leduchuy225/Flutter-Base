import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/my_appbar.dart';
import 'package:flutter_base/widgets/my_texttile.dart';
import 'package:get/get.dart';

import '../../../core/utils/datetime_utils.dart';
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
    return Scaffold(
      appBar: MyAppbar.appBar('Chi tiết lắp đặt mới'),
      body: SingleChildScrollView(
        padding: AppStyles.horizontalPadding,
        child: GetBuilder(
          init: _controller,
          builder: (controller) {
            final detailData = controller.detailData;
            final customerData = detailData?.mbCustomerViewModel;
            return Column(
              children: [
                AppStyles.pdt15,
                MyTexttile.card(
                  title: 'Thông tin yêu cầu',
                  items: [
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
                      text: DatetimeUtils.formatDateFromAPI(
                        detailData?.createdDate,
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
                      text: customerData?.idLong,
                    ),
                    MyTexttileItem(
                      titleText: 'Tên KH',
                      text: customerData?.fullName,
                    ),
                    MyTexttileItem(
                      titleText: 'Ngày sinh',
                      text: DatetimeUtils.formatDateFromAPI(
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
                AppStyles.pdt15,
                controller.getStepContent(3),
                AppStyles.pdt15,
                if (controller.noteListRxData.isNotEmpty)
                  controller.getStepContent(4),
              ],
            );
          },
        ),
      ),
    );
  }
}
