import 'package:flutter/material.dart';
import 'package:flutter_base/core/utils/datetime_utils.dart';

import '../../../models/repair_request/repair_request_get_modem_log_model_response.dart';
import '../../../theme/styles.dart';
import '../../../widgets/data_state_widget.dart';
import '../../../widgets/my_texttile.dart';
import '../../../widgets/text_field/text_field_controller.dart';
import '../../../widgets/text_field/text_field_widget.dart';

class ModemReplaceLogWidget extends StatelessWidget {
  final bool isReplace;
  final bool isViewOnly;
  final void Function(bool) onPressed;
  final void Function() onRightIconPressed;
  final MyTextFieldController oldModemTextController;
  final MyTextFieldController newModemTextController;

  const ModemReplaceLogWidget({
    super.key,
    this.isReplace = true,
    this.isViewOnly = false,
    required this.onPressed,
    required this.onRightIconPressed,
    required this.oldModemTextController,
    required this.newModemTextController,
  });

  @override
  Widget build(BuildContext context) {
    return MyTexttile.card(
      title: '${isReplace ? 'Thay thế' : 'Lắp mới'} modem',
      suffixHeader: InkWell(
        onTap: onRightIconPressed,
        child: const Icon(Icons.list),
      ),
      child: Visibility(
        visible: !isViewOnly,
        child: Column(
          children: [
            AppStyles.pdt15,
            Visibility(
              visible: isReplace,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: MyTextField(
                  isRequired: true,
                  labelText: 'Modem cũ',
                  controller: oldModemTextController,
                  validations: const [MyValidation.checkIsNotEmpty],
                ),
              ),
            ),
            MyTextField(
              isRequired: true,
              labelText: 'Modem mới',
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
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: MyTexttile.list(
                    items: [
                      MyTexttileItem(titleText: 'Mới', text: element.modemNew),
                      MyTexttileItem(titleText: 'Cũ', text: element.modemOld),
                      MyTexttileItem(
                        titleText: 'Người TH',
                        text: element.userIdEmail,
                      ),
                      MyTexttileItem(
                        titleText: 'Ngày TH',
                        text: MyDatetimeUtils.formatDateFromAPI(
                          element.setDate,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
