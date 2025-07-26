import 'package:flutter/material.dart';

import '../../core/utils/datetime_utils.dart';
import '../../models/common/note_viewmodel_response.dart';
import '../../theme/styles.dart';
import '../../widgets/my_texttile.dart';
import '../../widgets/text_field/text_field_controller.dart';
import '../../widgets/text_field/text_field_widget.dart';
import '../../widgets/title_number_indicator.dart';

class CommonInstallationNote extends StatelessWidget {
  final bool canAddNote;
  final void Function() onPressed;
  final ScrollController? scrollController;
  final List<NoteViewmodelResponse> notes;
  final MyTextFieldController noteTextController;

  const CommonInstallationNote({
    super.key,
    required this.notes,
    this.scrollController,
    required this.onPressed,
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
        suffixHeader: InkWell(child: const Icon(Icons.refresh), onTap: () {}),
        mainAxisSize: MainAxisSize.min,
        items: [
          MyTexttileItem(
            isHide: !canAddNote,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: MyTextField(
                isRequired: true,
                labelText: 'Ghi chú',
                controller: noteTextController,
                suffixIcon: InkWell(
                  onTap: onPressed,
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
      ),
    );
  }
}
