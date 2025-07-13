import 'package:flutter/material.dart';

import '../../theme/styles.dart';
import '../../widgets/text_field/text_field_controller.dart';
import '../../widgets/text_field/text_field_widget.dart';

class Step3UpdateCustomerNote extends StatelessWidget {
  final void Function() onPressed;
  final MyTextFieldController customerNoteTextController;

  const Step3UpdateCustomerNote({
    super.key,
    required this.onPressed,
    required this.customerNoteTextController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppStyles.pdt15,
        MyTextField(
          isRequired: true,
          labelText: 'Ghi chú',
          controller: customerNoteTextController,
        ),
        AppStyles.pdt15,
        ElevatedButton(onPressed: onPressed, child: const Text('Cập nhật')),
      ],
    );
  }
}
