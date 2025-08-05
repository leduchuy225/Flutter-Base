import 'package:flutter/material.dart';
import 'package:flutter_base/widgets/file_collection/file_collection_widget.dart';
import 'package:flutter_base/widgets/my_texttile.dart';
import 'package:flutter_base/widgets/text_field/text_field_controller.dart';
import 'package:flutter_base/widgets/text_field/text_field_widget.dart';

import '../../../theme/styles.dart';
import '../../../widgets/file_collection/file_collection_controller.dart';

class Step3 extends StatelessWidget {
  final bool isViewOnly;
  final FileCollectionController technicalStaffModuleImageControler;
  final FileCollectionController technicalStaffTestImageControler;
  final FileCollectionController technicalStaffImageControler;
  final MyTextFieldController step3NoteTextController;
  final void Function() onPressed;

  const Step3({
    super.key,
    required this.technicalStaffModuleImageControler,
    required this.technicalStaffTestImageControler,
    required this.technicalStaffImageControler,
    required this.step3NoteTextController,
    required this.onPressed,
    this.isViewOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return MyTexttile.card(
      title: 'Thực hiện công việc',
      child: Column(
        children: [
          FileCollectionWidget(
            limit: 1,
            title: 'Ảnh module',
            isViewImageOnly: isViewOnly,
            controller: technicalStaffModuleImageControler,
          ),
          AppStyles.pdt10,
          FileCollectionWidget(
            limit: 1,
            title: 'Ảnh test tốc độ',
            isViewImageOnly: isViewOnly,
            controller: technicalStaffTestImageControler,
          ),
          AppStyles.pdt10,
          FileCollectionWidget(
            limit: 1,
            title: 'Ảnh tổng thể',
            isViewImageOnly: isViewOnly,
            controller: technicalStaffImageControler,
          ),
          Visibility(
            visible: !isViewOnly,
            child: Column(
              children: [
                AppStyles.pdt30,
                MyTextField(
                  isRequired: true,
                  labelText: 'Báo cáo công việc',
                  controller: step3NoteTextController,
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
      ),
    );
  }
}
