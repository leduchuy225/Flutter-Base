import 'package:flutter/material.dart';
import 'package:flutter_base/core/services/user_service.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/data_state_widget.dart';
import 'package:flutter_base/widgets/dialog/dialog_widget.dart';
import 'package:flutter_base/widgets/file_collection/file_collection_controller.dart';
import 'package:flutter_base/widgets/selector/selector_controller.dart';
import 'package:flutter_base/widgets/text_field/text_field_controller.dart';
import 'package:get/get.dart';

import '../../models/common/note_viewmodel_response.dart';
import '../widgets/step_1_widget.dart';
import '../widgets/step_2_widget.dart';
import '../widgets/step_3_widget.dart';

abstract class CommonInstallationDetailController<T> extends GetxController {
  final int totalSteps = 5;

  final userInfor = Get.find<UserService>().userInfor;

  final currentRxStep = RxInt(1);
  final detailRxData = Rx<T?>(null);

  final noteTextController = MyTextFieldController();
  final noteListRxData = RxList<NoteViewmodelResponse>([]);

  final closeNoteTextController = MyTextFieldController();
  final step2NoteTextController = MyTextFieldController();
  final step3NoteTextController = MyTextFieldController();

  final technicalStaffImageControler = FileCollectionController();
  final technicalStaffTestImageControler = FileCollectionController();
  final technicalStaffModuleImageControler = FileCollectionController();

  final technicalStaffSelectController = MySelectorController();

  int? get id;

  Future getDetailData();

  Future closeRequest(BuildContext context);

  Future assignTechnicalStaff();

  Future updateStep3();

  Future uploadStep4();

  Future addNote();

  Future getNoteList();

  Future addOverdueReason();

  Future getOverdueReasonList();

  void setIsRefreshValue();

  T? get detailData => detailRxData.value;

  Widget buildSteps(BuildContext context) {
    switch (currentRxStep.value) {
      case 3:
        return Column(
          children: [
            getStepContent(context, step: 2),
            AppStyles.pdt15,
            getStepContent(context, step: 3),
          ],
        );
      default:
        return getStepContent(context, step: currentRxStep.value);
    }
  }

  Widget getStepContent(BuildContext context, {required int step}) {
    switch (step) {
      case 1:
        return Step1(
          technicalStaffSelectController: technicalStaffSelectController,
          onPressed: () {
            if (id == null) {
              return;
            }
            if (!technicalStaffSelectController.checkIsNotEmpty()) {
              return;
            }
            MyDialog.alertDialog(
              okHandler: assignTechnicalStaff,
              message: 'Xác nhận chọn nhân viên kỹ thuật ?',
            );
          },
        );
      case 2:
        return Step2(
          step2NoteTextController: step2NoteTextController,
          onPressed: () {
            if (id == null) {
              return;
            }
            if (!step2NoteTextController.checkIsNotEmpty()) {
              return;
            }
            MyDialog.alertDialog(
              okHandler: updateStep3,
              message: 'Xác nhận thêm ghi chú mới ?',
            );
          },
        );
      case 3:
        return Step3(
          technicalStaffImageControler: technicalStaffImageControler,
          technicalStaffTestImageControler: technicalStaffTestImageControler,
          technicalStaffModuleImageControler:
              technicalStaffModuleImageControler,
          step3NoteTextController: step3NoteTextController,
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
            if (!step3NoteTextController.checkIsNotEmpty()) {
              return;
            }
            MyDialog.alertDialog(
              okHandler: uploadStep4,
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
