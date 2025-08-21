import 'package:flutter/material.dart';
import 'package:flutter_base/models/base_selector.dart';
import 'package:flutter_base/widgets/selector/selector_widget.dart';

import '../../../theme/styles.dart';
import '../../../widgets/my_texttile.dart';
import '../../../widgets/selector/selector_controller.dart';
import '../../../widgets/text_field/text_field_controller.dart';
import '../../../widgets/text_field/text_field_widget.dart';

enum SurveyStatusEnum {
  Done(id: 1, name: 'DONE'),
  Cancel(id: 2, name: 'CANCEL'),
  Pending(id: 3, name: 'PENDING');

  final int id;
  final String name;

  const SurveyStatusEnum({required this.id, required this.name});
}

class TakeSurverWidget extends StatelessWidget {
  final void Function() onPressed;
  final MyTextFieldController surveyNoteTextController;
  final MySelectorController surveyStatusSelectorController;

  const TakeSurverWidget({
    super.key,
    required this.onPressed,
    required this.surveyNoteTextController,
    required this.surveyStatusSelectorController,
  });

  static bool getIsNoteRequired(int? id) {
    return [
      SurveyStatusEnum.Cancel.id,
      SurveyStatusEnum.Pending.id,
    ].contains(id);
  }

  @override
  Widget build(BuildContext context) {
    return MyTexttile.card(
      title: 'Khảo sát công việc',
      child: Column(
        children: [
          AppStyles.pdt15,
          MySelector(
            title: 'Trạng thái khảo sát',
            controller: surveyStatusSelectorController,
            data: MySelectorData(
              getFutureData: () async {
                return [
                  MySelectorModel(
                    id: SurveyStatusEnum.Done.id,
                    name: SurveyStatusEnum.Done.name,
                    description: 'Tiếp tục thực hiện yêu cầu',
                  ),
                  MySelectorModel(
                    description: 'Hủy yêu cầu',
                    id: SurveyStatusEnum.Cancel.id,
                    name: SurveyStatusEnum.Cancel.name,
                  ),
                  MySelectorModel(
                    description: 'Tạm dừng yêu cầu',
                    id: SurveyStatusEnum.Pending.id,
                    name: SurveyStatusEnum.Pending.name,
                  ),
                ];
              },
            ),
          ),
          ValueListenableBuilder(
            valueListenable: surveyStatusSelectorController,
            builder: (context, value, child) {
              if (TakeSurverWidget.getIsNoteRequired(
                surveyStatusSelectorController.first?.id,
              )) {
                return Padding(
                  padding: const EdgeInsetsGeometry.only(top: 20),
                  child: MyTextField(
                    isRequired: true,
                    labelText: 'Ghi chú khảo sát',
                    controller: surveyNoteTextController,
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          AppStyles.pdt20,
          ElevatedButton(onPressed: onPressed, child: const Text('Cập nhật')),
          AppStyles.pdt15,
        ],
      ),
    );
  }
}
