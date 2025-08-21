import 'package:flutter/material.dart';
import 'package:flutter_base/core/const/constants.dart';
import 'package:flutter_base/widgets/selector/selector_widget.dart';
import 'package:flutter_base/widgets/text_field/text_field_widget.dart';
import 'package:signature/signature.dart';

import '../../../../models/base_selector.dart';
import '../../../../theme/styles.dart';
import '../../../../widgets/datetime_picker/datetime_picker_widget.dart';
import '../../../../widgets/my_tab_bar.dart';
import '../../../../widgets/my_texttile.dart';
import '../../../../widgets/selector/selector_controller.dart';
import 'report_file_item.dart';
import 'sign_report_file_data_controller.dart';

class SignReportFileWidget extends StatelessWidget {
  final int reportSelectedIdToSign;
  final List<SignReportFileItemModel> files;
  final void Function() signReportFile;
  final void Function() previewReportFile;
  final void Function(int?) onReportSelected;
  final SignatureController staffSignatureController;
  final SignatureController customerSignatureController;
  final MySelectorController reportTypeSelectorController;
  final SignReportFileDataController reportDataController;
  final Future<List<MySelectorModel>> Function() getReportTypeList;

  const SignReportFileWidget({
    super.key,
    required this.files,
    required this.signReportFile,
    required this.reportDataController,
    required this.getReportTypeList,
    required this.onReportSelected,
    required this.previewReportFile,
    required this.reportTypeSelectorController,
    required this.staffSignatureController,
    required this.customerSignatureController,
    required this.reportSelectedIdToSign,
  });

  Widget _buildSignatureArea(
    BuildContext context, {
    required String name,
    required SignatureController controller,
  }) {
    return Column(
      children: [
        AppStyles.pdt6,
        Row(
          children: [
            Expanded(child: Text(name, style: AppTextStyles.body1)),
            IconButton(
              onPressed: staffSignatureController.clear,
              icon: const Icon(Icons.cleaning_services, color: AppColors.black),
            ),
          ],
        ),
        AppStyles.pdt6,
        Signature(
          height: 200,
          controller: controller,
          backgroundColor: AppColors.textGrey1,
        ),
        AppStyles.pdt20,
      ],
    );
  }

  Widget _buildBienBanNghiemThu(BuildContext context) {
    return Column(
      children: [
        MyTextField(
          labelText: 'Email của KH',
          controller: reportDataController.bbntEmailTextController,
        ),
        AppStyles.pdt20,
        MyTextField(
          labelText: 'Tài khoản',
          controller: reportDataController.bbntAccountTextController,
        ),
        AppStyles.pdt20,
        MyTextField(
          labelText: 'Mật khẩu',
          controller: reportDataController.bbntPasswordTextController,
        ),
        AppStyles.pdt20,
        MyTextField(
          labelText: 'IP v4',
          controller: reportDataController.bbntIpV4TextController,
        ),
        AppStyles.pdt20,
        MyTextField(
          labelText: 'Chất lượng dịch vụ',
          controller: reportDataController.bbntServiceQualityTextController,
        ),
        AppStyles.pdt20,
        DatetimePicker(
          title: 'Thời gian hoàn thành',
          controller: reportDataController.completeDateController,
        ),
        AppStyles.pdt30,
      ],
    );
  }

  Widget _buildBienBanBanGiao(BuildContext context) {
    return Column(
      children: [
        MyTextField(
          labelText: 'Tên thiết bị',
          controller: reportDataController.bbbgNameTextController,
        ),
        AppStyles.pdt20,
        MyTextField(
          labelText: 'Thông số',
          controller: reportDataController.bbbgStatictisTextController,
        ),
        AppStyles.pdt20,
        MyTextField(
          labelText: 'Số lượng',
          keyboardType: TextInputType.number,
          controller: reportDataController.bbbgAmountTextController,
        ),
        AppStyles.pdt20,
        MyTextField(
          labelText: 'Hiện trạng',
          controller: reportDataController.bbbgStatusTextController,
        ),
        AppStyles.pdt20,
        DatetimePicker(
          title: 'Thời gian hoàn thành',
          controller: reportDataController.completeDateController,
        ),
        AppStyles.pdt30,
      ],
    );
  }

  List<SignReportFileItemModel> get _reportNotSigned {
    return files.where((file) => file.isSigned == false).toList();
  }

  List<SignReportFileItemModel> get _reportSigned {
    return files.where((file) => file.isSigned == true).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MyTexttile.card(
      title: 'Ký biên bản với KH',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Visibility(
            visible: _reportSigned.isNotEmpty,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppStyles.pdt10,
                Text('Biên bản đã ký', style: AppTextStyles.body1),
                AppStyles.pdt10,
                ..._reportSigned.map((file) {
                  return ReportFileItem(item: file);
                }),
              ],
            ),
          ),
          AppStyles.pdt15,
          Text('Xem mẫu biên bản', style: AppTextStyles.body1),
          AppStyles.pdt15,
          MySelector(
            title: 'Loại biên bản',
            controller: reportTypeSelectorController,
            data: MySelectorData(
              getFutureData: getReportTypeList,
              excludeIds: _reportSigned.map((report) {
                return report.id;
              }).toList(),
            ),
          ),
          AppStyles.pdt20,
          ValueListenableBuilder(
            valueListenable: reportTypeSelectorController,
            builder: (context, value, child) {
              switch (reportTypeSelectorController.first?.id) {
                case ReportType.BBNT:
                  return _buildBienBanNghiemThu(context);
                case ReportType.BBBG:
                  return _buildBienBanBanGiao(context);
                default:
                  return const SizedBox();
              }
            },
          ),
          ElevatedButton(
            onPressed: previewReportFile,
            child: const Text('Lấy mẫu biên bản'),
          ),
          Visibility(
            visible: _reportNotSigned.isNotEmpty,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppStyles.pdt20,
                Text('Chọn biên bản để ký', style: AppTextStyles.body1),
                AppStyles.pdt10,
                ..._reportNotSigned.map((file) {
                  return ReportFileItem(
                    item: file,
                    isSelectable: true,
                    onChanged: onReportSelected,
                    reportSelectedIdToSign: reportSelectedIdToSign,
                  );
                }),
              ],
            ),
          ),
          Visibility(
            visible: _reportNotSigned.isNotEmpty && reportSelectedIdToSign != 0,
            child: Column(
              children: [
                MyTabBar(
                  tabs: const [
                    Tab(text: 'Nhân viên'),
                    Tab(text: 'Khách hàng'),
                  ],
                  children: [
                    _buildSignatureArea(
                      context,
                      name: 'Chữ ký nhân viên kỹ thuật',
                      controller: staffSignatureController,
                    ),
                    _buildSignatureArea(
                      context,
                      name: 'Chữ ký khách hàng',
                      controller: customerSignatureController,
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: signReportFile,
                  child: const Text('Xác nhận ký'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
