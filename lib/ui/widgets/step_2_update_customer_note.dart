import 'package:flutter/material.dart';

import '../../core/utils/datetime_utils.dart';
import '../../models/installation/note_viewmodel_response.dart';
import '../../theme/styles.dart';
import '../../widgets/my_texttile.dart';
import '../../widgets/text_field/text_field_controller.dart';
import '../../widgets/text_field/text_field_widget.dart';
import '../../widgets/title_number_indicator.dart';

class Step2UpdateInstallationFile extends StatelessWidget {
  final bool canAddNote;
  final void Function() onPressed;
  final List<NoteViewmodelResponse> notes;
  final MyTextFieldController customerNoteTextController;

  const Step2UpdateInstallationFile({
    super.key,
    required this.notes,
    required this.onPressed,
    required this.canAddNote,
    required this.customerNoteTextController,
  });

  @override
  Widget build(BuildContext context) {
    return MyTexttile.card(
      title: 'Ghi chú sửa chữa',
      items: [
        MyTexttileItem(
          isHide: !canAddNote,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: MyTextField(
              isRequired: true,
              labelText: 'Ghi chú',
              controller: customerNoteTextController,
              suffixIcon: InkWell(
                onTap: () {
                  WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
                  onPressed();
                },
                child: const Icon(Icons.send, color: AppColors.primary),
              ),
            ),
          ),
        ),
        ...notes.map((element) {
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
        }),
      ],
    );
  }
}
