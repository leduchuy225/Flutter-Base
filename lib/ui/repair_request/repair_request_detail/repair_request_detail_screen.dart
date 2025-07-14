import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/my_appbar.dart';
import 'package:flutter_base/widgets/my_texttile.dart';
import 'package:get/get.dart';

import '../../../core/utils/datetime_utils.dart';
import '../../../widgets/title_number_indicator.dart';
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
    return Scaffold(
      appBar: MyAppbar.appBar('Chi tiết yêu cầu sửa chữa'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppStyles.pdt15,
            GetBuilder(
              init: _controller,
              builder: (controller) {
                final detailData = controller.detailData;
                final customerData = detailData?.mbCustomerViewModel;
                final noteListData =
                    detailData?.listMbRepairRequestNoteViewModel ?? [];

                return Column(
                  children: [
                    Padding(
                      padding: AppStyles.horizontalPadding,
                      child: MyTexttile.card(
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
                    ),
                    AppStyles.pdt15,
                    Padding(
                      padding: AppStyles.horizontalPadding,
                      child: MyTexttile.card(
                        title: 'Thông tin KH',
                        items: [
                          MyTexttileItem(
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
                          MyTexttileItem(
                            titleText: 'CCCD',
                            text: customerData?.cccd,
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
                    ),
                    AppStyles.pdt15,
                    Padding(
                      padding: AppStyles.horizontalPadding,
                      child: MyTexttile.card(
                        title: 'Ghi chú sửa chữa',
                        items: noteListData.map((element) {
                          return MyTexttileItem(
                            child: ListTile(
                              titleAlignment: ListTileTitleAlignment.center,
                              isThreeLine: true,
                              title: Text(element.note ?? ''),
                              leading: TitleNumberIndicator.getnumber(
                                element.currentStep,
                                radius: 50,
                                color: AppColors.primary,
                                padding: const EdgeInsets.all(8),
                              ),
                              subtitleTextStyle: AppTextStyles.body2.copyWith(
                                color: AppColors.textGrey2,
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsetsGeometry.only(top: 6),
                                child: Text(
                                  [
                                    '- ${element.createdByEmail}',
                                    '- ${DatetimeUtils.formatDateFromAPI(element.createdDate, toFormat: MyDateFormatEnum.DATE_TIME24s)}',
                                  ].join('\n'),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                );
              },
            ),
            GetBuilder(
              init: _controller,
              builder: (controller) {
                return Stepper(
                  margin: EdgeInsets.zero,
                  stepIconMargin: EdgeInsets.zero,
                  currentStep: controller.currentRxStep.value - 1,
                  physics: const NeverScrollableScrollPhysics(),
                  controlsBuilder: (context, details) {
                    return const Row(children: [SizedBox()]);
                  },
                  onStepTapped: (value) {
                    // FOR TESING ONLY
                    controller.currentRxStep.value = value + 1;
                    controller.update();
                  },
                  steps: _controller.getSteps(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
