import 'package:flutter/material.dart';
import 'package:flutter_base/widgets/data_state_widget.dart';

import '../../../core/utils/datetime_utils.dart';
import '../../../core/utils/validation.dart';
import '../../../models/common/note_viewmodel_response.dart';
import '../../../theme/styles.dart';
import '../../../widgets/my_texttile.dart';
import '../../../widgets/text_field/text_field_controller.dart';
import '../../../widgets/text_field/text_field_widget.dart';
import '../../../widgets/title_number_indicator.dart';

class CommonInstallationNote extends StatelessWidget {
  final bool canAddNote;
  final void Function() onPressed;
  final void Function() onRefresh;
  final ScrollController? scrollController;
  final List<NoteViewmodelResponse> notes;
  final MyTextFieldController noteTextController;

  const CommonInstallationNote({
    super.key,
    required this.notes,
    this.scrollController,
    required this.onPressed,
    required this.onRefresh,
    required this.canAddNote,
    required this.noteTextController,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: MyTexttile.card(
        title: 'Danh sách ghi chú',
        paddingHeader: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        suffixHeader: InkWell(
          onTap: onRefresh,
          child: const Icon(Icons.refresh),
        ),
        mainAxisSize: MainAxisSize.min,
        child: Column(
          children: [
            if (canAddNote)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: MyTextField(
                  isRequired: true,
                  labelText: 'Ghi chú',
                  controller: noteTextController,
                  validations: const [MyValidation.checkIsNotEmpty],
                  suffixIcon: InkWell(
                    onTap: onPressed,
                    child: const Icon(Icons.send, color: AppColors.primary),
                  ),
                ),
              ),
            Visibility(visible: notes.isEmpty, child: MyDataState.empty()),
            ...notes.map((element) {
              return ListTile(
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
                      '- ${MyDatetimeUtils.formatDateFromAPI(element.createdDate, toFormat: MyDateFormatEnum.DATE_TIME24s)}',
                    ].join('\n'),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
