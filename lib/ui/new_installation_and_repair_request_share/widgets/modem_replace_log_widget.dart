import 'package:flutter/material.dart';
import 'package:flutter_base/core/utils/datetime_utils.dart';

import '../../../core/utils/validation.dart';
import '../../../models/repair_request/repair_request_get_modem_log_model_response.dart';
import '../../../theme/styles.dart';
import '../../../widgets/data_state_widget.dart';
import '../../../widgets/my_texttile.dart';
import '../../../widgets/text_field/text_field_controller.dart';
import '../../../widgets/text_field/text_field_widget.dart';

class ModemReplaceLogWidget extends StatelessWidget {
  final bool isDone;
  final bool isReplace;
  final bool isViewOnly;
  final void Function(bool) onPressed;
  final void Function() onRightIconPressed;
  final MyTextFieldController oldModemTextController;
  final MyTextFieldController newModemTextController;
  final List<RepairRequestGetModemLogModelResponse> modemLogs;

  const ModemReplaceLogWidget({
    super.key,
    this.isDone = false,
    this.isReplace = true,
    this.isViewOnly = false,
    required this.modemLogs,
    required this.onPressed,
    required this.onRightIconPressed,
    required this.oldModemTextController,
    required this.newModemTextController,
  });

  RepairRequestGetModemLogModelResponse? get firstModemLog {
    return modemLogs.firstOrNull;
  }

  @override
  Widget build(BuildContext context) {
    return MyTexttile.card(
      title: '${isReplace ? 'Thay thế' : 'Lắp mới'} modem',
      suffixHeader: InkWell(
        onTap: onRightIconPressed,
        child: const Icon(Icons.list),
      ),
      tagColor: AppColors.success,
      tag: isDone ? 'Đã thực hiện' : null,
      child: Visibility(
        visible: !isViewOnly,
        child: Column(
          children: [
            if (firstModemLog != null)
              ModemReplacementLogListWidget.buildModemLogChild(firstModemLog!),
            AppStyles.pdt15,
            Visibility(
              visible: isReplace,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: MyTextField(
                  isRequired: true,
                  labelText: 'Modem cũ',
                  hintText: 'Nhập mã seri modem cũ',
                  controller: oldModemTextController,
                  validations: const [MyValidation.checkIsNotEmpty],
                ),
              ),
            ),
            MyTextField(
              isRequired: true,
              labelText: 'Modem mới',
              hintText: 'Nhập mã seri modem mới',
              controller: newModemTextController,
              validations: const [MyValidation.checkIsNotEmpty],
            ),
            AppStyles.pdt20,
            ElevatedButton(
              onPressed: () => onPressed(isReplace),
              child: const Text('Cập nhật'),
            ),
            AppStyles.pdt15,
          ],
        ),
      ),
    );
  }
}

class ModemReplacementLogListWidget extends StatelessWidget {
  final ScrollController? scrollController;
  final List<RepairRequestGetModemLogModelResponse> modemLogs;

  const ModemReplacementLogListWidget({
    super.key,
    this.scrollController,
    required this.modemLogs,
  });

  static Widget buildModemLogChild(
    RepairRequestGetModemLogModelResponse element,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: MyTexttile.list(
          items: [
            MyTexttileItem(titleText: 'Mới', text: element.modemNew),
            MyTexttileItem(titleText: 'Cũ', text: element.modemOld),
            MyTexttileItem(titleText: 'Người TH', text: element.userIdEmail),
            MyTexttileItem(
              titleText: 'Ngày TH',
              text: MyDatetimeUtils.formatDateFromAPI(element.setDate),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: MyTexttile.card(
        title: 'Lịch sử lắp đặt modem',
        mainAxisSize: MainAxisSize.min,
        paddingHeader: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            Visibility(visible: modemLogs.isEmpty, child: MyDataState.empty()),
            ...modemLogs.map((element) {
              return buildModemLogChild(element);
            }).toList(),
          ],
        ),
      ),
    );
  }
}
