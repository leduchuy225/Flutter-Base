import 'package:flutter/material.dart';

import '../../theme/styles.dart';
import '../../widgets/my_texttile.dart';
import '../../widgets/text_field/text_field_controller.dart';
import '../../widgets/text_field/text_field_widget.dart';

class Step2 extends StatelessWidget {
  final void Function() onPressed;
  final MyTextFieldController step2NoteTextController;

  const Step2({
    super.key,
    required this.onPressed,
    required this.step2NoteTextController,
  });

  @override
  Widget build(BuildContext context) {
    return MyTexttile.card(
      title: 'Liên hệ với KH',
      items: [
        MyTexttileItem(
          child: Column(
            children: [
              AppStyles.pdt15,
              MyTextField(
                controller: step2NoteTextController,
                labelText: 'Lịch hẹn với khách',
              ),
              AppStyles.pdt20,
              ElevatedButton(
                onPressed: onPressed,
                child: const Text('Cập nhật'),
              ),
              AppStyles.pdt15,
            ],
          ),
        ),
      ],
    );
  }
}
