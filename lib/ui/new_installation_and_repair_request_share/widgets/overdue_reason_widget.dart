import 'package:flutter/material.dart';

import '../../../core/utils/datetime_utils.dart';
import '../../../core/utils/validation.dart';
import '../../../models/common/note_viewmodel_response.dart';
import '../../../theme/styles.dart';
import '../../../widgets/data_state_widget.dart';
import '../../../widgets/my_texttile.dart';
import '../../../widgets/text_field/text_field_controller.dart';
import '../../../widgets/text_field/text_field_widget.dart';

class OverdueReasonWidget extends StatelessWidget {
  final void Function() onPressed;
  final void Function() onRightIconPressed;
  final MyTextFieldController noteTextController;

  const OverdueReasonWidget({
    super.key,
    required this.onPressed,
    required this.noteTextController,
    required this.onRightIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MyTexttile.card(
      title: 'Giải trình công việc',
      suffixHeader: InkWell(
        onTap: onRightIconPressed,
        child: const Icon(Icons.list),
      ),
      child: Column(
        children: [
          AppStyles.pdt15,
          MyTextField(
            controller: noteTextController,
            labelText: 'Nội dung giải trình',
            validations: const [MyValidation.checkIsNotEmpty],
          ),
          AppStyles.pdt20,
          ElevatedButton(onPressed: onPressed, child: const Text('Cập nhật')),
          AppStyles.pdt15,
        ],
      ),
    );
  }
}

class OverdueReasonListWidget extends StatelessWidget {
  final void Function() onRefresh;
  final List<NoteViewmodelResponse> notes;
  final ScrollController? scrollController;

  const OverdueReasonListWidget({
    super.key,
    required this.notes,
    this.scrollController,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: MyTexttile.card(
        title: 'Giải trình lý do',
        mainAxisSize: MainAxisSize.min,
        paddingHeader: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        suffixHeader: InkWell(
          onTap: onRefresh,
          child: const Icon(Icons.refresh),
        ),
        child: Column(
          children: [
            Visibility(visible: notes.isEmpty, child: MyDataState.empty()),
            ...notes.map((element) {
              return ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                isThreeLine: true,
                title: Text(element.note ?? ''),
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
            }).toList(),
          ],
        ),
      ),
    );
  }
}
