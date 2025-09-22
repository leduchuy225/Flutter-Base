import 'package:flutter/material.dart';
import 'package:flutter_base/models/base_selector.dart';
import 'package:flutter_base/widgets/selector/selector_widget.dart';

import '../../../core/utils/validation.dart';
import '../../../theme/styles.dart';
import '../../../widgets/my_texttile.dart';
import '../../../widgets/selector/selector_controller.dart';
import '../../../widgets/text_field/text_field_controller.dart';
import '../../../widgets/text_field/text_field_widget.dart';

enum SurveyStatusEnum {
  Done(
    name: 'DONE',
    id: SurverStatusValue.Done,
    description: 'Tiếp tục thực hiện yêu cầu',
  ),
  Cancel(
    name: 'CANCEL',
    description: 'Hủy yêu cầu',
    id: SurverStatusValue.Cancel,
  ),
  Pending(
    name: 'PENDING',
    id: SurverStatusValue.Pending,
    description: 'Tạm dừng yêu cầu',
  );

  final int id;
  final String name;
  final String description;

  const SurveyStatusEnum({
    required this.id,
    required this.name,
    required this.description,
  });
}

class SurverStatusValue {
  static const int Done = 1;
  static const int Cancel = 2;
  static const int Pending = 3;
}

class TakeSurverWidget extends StatelessWidget {
  final void Function() onPressed;
  final SurveyStatusEnum? currentStatus;
  final MyTextFieldController surveyNoteTextController;
  final MySelectorController surveyStatusSelectorController;

  const TakeSurverWidget({
    super.key,
    this.currentStatus,
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Visibility(
            visible: currentStatus != null,
            child: Padding(
              child: Text(
                'Trạng thái: ${currentStatus?.name}',
                style: AppTextStyles.body1.copyWith(color: AppColors.secondary),
              ),
              padding: const EdgeInsetsGeometry.symmetric(vertical: 10),
            ),
          ),
          AppStyles.pdt15,
          MySelector(
            title: 'Chọn trạng thái khảo sát',
            controller: surveyStatusSelectorController,
            validations: const [MyValidation.checkIsNotEmpty],
            data: MySelectorData(
              getFutureData: () async {
                return [
                  MySelectorModel(
                    id: SurveyStatusEnum.Done.id,
                    name: SurveyStatusEnum.Done.name,
                    description: SurveyStatusEnum.Done.description,
                  ),
                  MySelectorModel(
                    id: SurveyStatusEnum.Cancel.id,
                    name: SurveyStatusEnum.Cancel.name,
                    description: SurveyStatusEnum.Cancel.description,
                  ),
                  MySelectorModel(
                    id: SurveyStatusEnum.Pending.id,
                    name: SurveyStatusEnum.Pending.name,
                    description: SurveyStatusEnum.Pending.description,
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
                    validations: const [MyValidation.checkIsNotEmpty],
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
