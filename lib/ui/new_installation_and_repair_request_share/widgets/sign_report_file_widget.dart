import 'package:flutter/material.dart';
import 'package:flutter_base/core/const/constants.dart';
import 'package:flutter_base/widgets/selector/selector_widget.dart';
import 'package:flutter_base/widgets/text_field/text_field_widget.dart';

import '../../../models/base_selector.dart';
import '../../../theme/styles.dart';
import '../../../widgets/datetime_picker/datetime_picker_widget.dart';
import '../../../widgets/my_texttile.dart';
import '../../../widgets/selector/selector_controller.dart';
import 'sign_report_file_data_controller.dart';

class SignReportFileWidget extends StatelessWidget {
  final String filePath;
  final void Function() previewReportFile;
  final MySelectorController reportTypeListController;
  final SignReportFileDataController reportController;
  final Future<List<MySelectorModel>> Function() getReportTypeList;

  const SignReportFileWidget({
    super.key,
    required this.filePath,
    required this.reportController,
    required this.getReportTypeList,
    required this.previewReportFile,
    required this.reportTypeListController,
  });

  Widget _buildBienBanNghiemThu(BuildContext context) {
    return Column(
      children: [
        MyTextField(
          labelText: 'Email của KH',
          controller: reportController.bbntEmailTextController,
        ),
        AppStyles.pdt20,
        MyTextField(
          labelText: 'Tài khoản',
          controller: reportController.bbntAccountTextController,
        ),
        AppStyles.pdt20,
        MyTextField(
          labelText: 'Mật khẩu',
          controller: reportController.bbntPasswordTextController,
        ),
        AppStyles.pdt20,
        MyTextField(
          labelText: 'IP v4',
          controller: reportController.bbntIpV4TextController,
        ),
        AppStyles.pdt20,
        MyTextField(
          labelText: 'Chất lượng dịch vụ',
          controller: reportController.bbntServiceQualityTextController,
        ),
        AppStyles.pdt20,
        DatetimePicker(
          title: 'Thời gian hoàn thành',
          controller: reportController.completeDateController,
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
          controller: reportController.bbbgNameTextController,
        ),
        AppStyles.pdt20,
        MyTextField(
          labelText: 'Thông số',
          controller: reportController.bbbgStatictisTextController,
        ),
        AppStyles.pdt20,
        MyTextField(
          labelText: 'Số lượng',
          keyboardType: TextInputType.number,
          controller: reportController.bbbgAmountTextController,
        ),
        AppStyles.pdt20,
        MyTextField(
          labelText: 'Hiện trạng',
          controller: reportController.bbbgStatusTextController,
        ),
        AppStyles.pdt20,
        DatetimePicker(
          title: 'Thời gian hoàn thành',
          controller: reportController.completeDateController,
        ),
        AppStyles.pdt30,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MyTexttile.card(
      title: 'Ký biên bản với KH',
      child: Column(
        children: [
          AppStyles.pdt15,
          MySelector(
            title: 'Loại biên bản',
            controller: reportTypeListController,
            data: MySelectorData(getFutureData: getReportTypeList),
          ),
          AppStyles.pdt20,
          ValueListenableBuilder(
            valueListenable: reportTypeListController,
            builder: (context, value, child) {
              switch (reportTypeListController.first?.id) {
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
            child: const Text('Lấy biên bản'),
          ),
          AppStyles.pdt20,
        ],
      ),
    );
  }
}
