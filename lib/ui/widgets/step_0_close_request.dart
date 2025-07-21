import 'package:flutter/material.dart';
import 'package:flutter_base/widgets/text_field/text_field_controller.dart';

import '../../theme/styles.dart';
import '../../widgets/my_texttile.dart';
import '../../widgets/text_field/text_field_widget.dart';

class Step0CloseRequest extends StatelessWidget {
  final void Function() onPressed;
  final MyTextFieldController closeNoteTextController;

  const Step0CloseRequest({
    super.key,
    required this.onPressed,
    required this.closeNoteTextController,
  });

  @override
  Widget build(BuildContext context) {
    return MyTexttile.card(
      title: 'Đóng phiếu',
      mainAxisSize: MainAxisSize.min,
      items: [
        MyTexttileItem(
          child: Column(
            children: [
              AppStyles.pdt15,
              MyTextField(
                isRequired: true,
                labelText: 'Ghi chú',
                controller: closeNoteTextController,
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
      ],
    );
  }
}
