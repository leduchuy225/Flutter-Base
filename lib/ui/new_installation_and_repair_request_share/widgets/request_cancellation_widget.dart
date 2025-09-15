import 'package:flutter/material.dart';
import 'package:flutter_base/widgets/text_field/text_field_controller.dart';

import '../../../theme/styles.dart';
import '../../../widgets/my_texttile.dart';
import '../../../widgets/text_field/text_field_widget.dart';

class RequestCancellation extends StatelessWidget {
  final void Function() onPressed;
  final ScrollController? scrollController;
  final MyTextFieldController closeNoteTextController;

  const RequestCancellation({
    super.key,
    this.scrollController,
    required this.onPressed,
    required this.closeNoteTextController,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: MyTexttile.card(
        title: 'Đóng phiếu',
        mainAxisSize: MainAxisSize.min,
        paddingHeader: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            AppStyles.pdt15,
            MyTextField(
              isRequired: true,
              labelText: 'Ghi chú',
              controller: closeNoteTextController,
              validations: const [MyValidation.checkIsNotEmpty],
            ),
            AppStyles.pdt20,
            ElevatedButton(
              onPressed: onPressed,
              child: const Text('Đóng phiếu'),
            ),
            AppStyles.pdt15,
          ],
        ),
      ),
    );
  }
}
