import 'package:flutter/material.dart';
import 'package:flutter_base/core/services/user_service.dart';
import 'package:flutter_base/widgets/data_state_widget.dart';
import 'package:flutter_base/widgets/dialog/dialog_widget.dart';
import 'package:flutter_base/widgets/file_collection/file_collection_controller.dart';
import 'package:flutter_base/widgets/selector/selector_controller.dart';
import 'package:flutter_base/widgets/text_field/text_field_controller.dart';
import 'package:get/get.dart';

import '../../models/installation/note_viewmodel_response.dart';
import '../widgets/step_1_update_technical_staff.dart';
import '../widgets/step_2_update_customer_note.dart';
import '../widgets/step_3_update_installation_file.dart';

abstract class CommonInstallationController<T> extends GetxController {
  final int totalSteps = 5;

  final userInfor = Get.find<UserService>().userInfor;

  final currentRxStep = RxInt(1);
  final detailRxData = Rx<T?>(null);
  final noteListRxData = RxList<NoteViewmodelResponse>([]);

  final customerNoteTextController = MyTextFieldController();

  final technicalNoteTextController = MyTextFieldController();
  final technicalStaffImageControler = FileCollectionController();
  final technicalStaffTestImageControler = FileCollectionController();
  final technicalStaffModuleImageControler = FileCollectionController();

  final technicalStaffSelectController = MySelectorController();

  int? get id;

  Future getDetailData();

  Future assignTechnicalStaff();

  Future updateCustomerNote();

  Future uploadFile();

  T? get detailData => detailRxData.value;

  Widget buildSteps(BuildContext context) {
    switch (currentRxStep.value) {
      case 3:
        return Column(children: [_getStepContent(2), _getStepContent(3)]);
      default:
        return _getStepContent(currentRxStep.value);
    }
  }

  Widget _getStepContent(int step) {
    switch (step) {
      case 1:
        return Step1UpdateTechnicalStaff(
          onPressed: () {},
          technicalStaffSelectController: technicalStaffSelectController,
        );
      case 2:
        return Step2UpdateInstallationFile(
          notes: noteListRxData,
          canAddNote: currentRxStep.value >= 2,
          customerNoteTextController: customerNoteTextController,
          onPressed: () {
            if (id == null) {
              return;
            }
            if (!customerNoteTextController.checkIsNotEmpty()) {
              return;
            }
            MyDialog.alertDialog(
              okHandler: updateCustomerNote,
              message: 'Xác nhận thêm ghi chú mới ?',
            );
          },
        );
      case 3:
        return Step3UpdateInstallationFile(
          technicalStaffImageControler: technicalStaffImageControler,
          technicalStaffTestImageControler: technicalStaffTestImageControler,
          technicalStaffModuleImageControler:
              technicalStaffModuleImageControler,
          technicalNoteTextController: technicalNoteTextController,
          onPressed: () {
            if (id == null) {
              return;
            }
            if (technicalStaffImageControler.files.isEmpty ||
                technicalStaffModuleImageControler.files.isEmpty ||
                technicalStaffTestImageControler.files.isEmpty) {
              MyDialog.snackbar(
                'Chưa chọn đủ loại ảnh',
                type: SnackbarType.WARNING,
              );
              return;
            }
            if (!technicalNoteTextController.checkIsNotEmpty()) {
              return;
            }
            MyDialog.alertDialog(
              okHandler: uploadFile,
              message: 'Xác nhận báo cáo công việc ?',
            );
          },
        );
      case 4:
      case 5:
        return const MyDataState(
          icon: Icons.help_outline,
          message: 'Liên hệ admin hỗ trợ',
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
