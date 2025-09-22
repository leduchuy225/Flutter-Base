import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/const/constants.dart';
import 'package:flutter_base/models/common/note_viewmodel_response.dart';

import '../../../core/utils/datetime_utils.dart';
import '../../../core/utils/validation.dart';
import '../../../theme/styles.dart';
import '../../../widgets/my_texttile.dart';
import '../../../widgets/text_field/text_field_controller.dart';
import '../../../widgets/text_field/text_field_widget.dart';

class Step2 extends StatelessWidget {
  final void Function() onPressed;
  final List<NoteViewmodelResponse> notes;
  final MyTextFieldController step2NoteTextController;

  const Step2({
    super.key,
    required this.notes,
    required this.onPressed,
    required this.step2NoteTextController,
  });

  NoteViewmodelResponse? get lastestNote {
    final appointmentNote = notes.firstWhereOrNull((element) {
      return (element.note ?? '').contains(MyStrings.appointmentPrefix);
    });
    if (appointmentNote != null) {
      return appointmentNote;
    }
    return notes.lastWhereOrNull((element) {
      return element.currentStep == 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyTexttile.card(
      title: 'Liên hệ với KH',
      child: Column(
        children: [
          Visibility(
            visible: lastestNote != null,
            child: Card(
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                isThreeLine: true,
                title: Text(lastestNote?.note ?? ''),
                subtitleTextStyle: AppTextStyles.body2.copyWith(
                  color: AppColors.textGrey2,
                ),
                subtitle: Text(
                  [
                    '- ${lastestNote?.createdByEmail}',
                    '- ${MyDatetimeUtils.formatDateFromAPI(lastestNote?.createdDate, toFormat: MyDateFormatEnum.DATE_TIME24s)}',
                  ].join('\n'),
                ),
              ),
            ),
          ),
          AppStyles.pdt15,
          MyTextField(
            controller: step2NoteTextController,
            labelText: 'Lịch hẹn với khách',
            validations: const [MyValidation.checkIsNotEmpty],
          ),
          AppStyles.pdt20,
          ElevatedButton(
            onPressed: onPressed,
            child: Text(lastestNote == null ? 'Cập nhật' : 'Hẹn lại KH'),
          ),
          AppStyles.pdt15,
        ],
      ),
    );
  }
}
