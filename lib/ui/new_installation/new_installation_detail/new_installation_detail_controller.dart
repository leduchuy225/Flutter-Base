import 'package:flutter/widgets.dart';
import 'package:flutter_base/core/const/constants.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:get/get.dart';

import '../../../core/services/cache_service.dart';
import '../../../data/installation_api.dart';
import '../../../models/common/installation_detail_payload.dart';
import '../../../models/common/note_viewmodel_response.dart';
import '../../../models/installation/installation_detail_model_response.dart';
import '../../new_installation_and_repair_request_share/common_installation_detail_controller.dart';

class NewInstallationDetailController
    extends
        CommonInstallationDetailController<InstallationDetailModelResponse> {
  final int newInstallationId;

  NewInstallationDetailController({required this.newInstallationId});

  @override
  Future getDetailData() async {
    final body = InstallationDetailPayload(
      id: id,
      typeData: MBService.NewInstallation,
    );
    final response = await Get.find<InstallationApi>()
        .getNewInstallationDetail(body)
        .callApi(isShowSuccessMessage: false);

    final data = response.data?.model;

    if (data != null) {
      detailRxData.value = data;
      currentRxStep.value = data.currentStep ?? 1;
      noteListRxData.value = data.listMbConnectionRequestNoteViewModel ?? [];
      overdueNoteListRxData.value =
          data.listMbConnectionRequestOverdueViewModel ?? [];

      update();
    }
  }

  @override
  Future assignTechnicalStaff() async {
    final body = {'id': id, 'userId': technicalStaffSelectController.first?.id};
    final response = await Get.find<InstallationApi>()
        .addTechnicalStaffNewInstallation(body)
        .callApi();

    if (response.isSuccess) {
      setIsRefreshValue();

      final step = response.data?.currentStep ?? 1;
      currentRxStep.value = step;

      update();
    }
  }

  @override
  Future updateStep3() async {
    final body = {'id': id, 'note': step2NoteTextController.textTrim};
    final response = await Get.find<InstallationApi>()
        .updateNewInstallationStep3(body)
        .callApi();

    if (response.isSuccess) {
      final step = response.data?.currentStep ?? 1;
      if (currentRxStep.value != step) {
        setIsRefreshValue();
      }

      currentRxStep.value = step;

      step2NoteTextController.clear();

      update();
    }
  }

  @override
  Future uploadStep4() async {
    final response = await Get.find<InstallationApi>()
        .uploadNewInstallationStep4(
          id: id.toString(),
          note: step3NoteTextController.textTrim,
          technicalStaffImage: technicalStaffImageControler.firstFile,
          technicalStaffTestImage: technicalStaffTestImageControler.firstFile,
          technicalStaffModuleImage:
              technicalStaffModuleImageControler.firstFile,
        )
        .callApi();

    if (response.isSuccess) {
      setIsRefreshValue();

      final step = response.data?.currentStep ?? 1;
      currentRxStep.value = step;

      update();
    }
  }

  @override
  Future closeRequest(BuildContext context) async {
    final body = {'id': id, 'note': closeNoteTextController.textTrim};
    final response = await Get.find<InstallationApi>()
        .closeNewInstallation(body)
        .callApi();

    if (response.data?.isClosed == true) {
      setIsRefreshValue();

      Navigator.of(context).popUntil((route) {
        return [
          '/MainScreen',
          '/NewInstallationListScreen',
        ].contains(route.settings.name);
      });
    }
  }

  @override
  int? get id => newInstallationId;

  @override
  void setIsRefreshValue() {
    CacheService().write(
      value: true,
      key: CacheService.isRefreshNewInstallationList,
    );
  }

  @override
  Future addNote() async {
    final body = {'id': id, 'note': noteTextController.textTrim};
    final response = await Get.find<InstallationApi>()
        .addNewInstallationNote(body)
        .callApi();

    if (response.isSuccess) {
      noteListRxData.insert(
        0,
        NoteViewmodelResponse(
          createdByEmail: userInfor?.email,
          currentStep: currentRxStep.value,
          note: noteTextController.textTrim,
          createdDate: DateTime.now().millisecondsSinceEpoch.toString(),
        ),
      );

      noteTextController.clear();

      update();
    }
  }

  @override
  Future addOverdueReason() async {
    final body = {'id': id, 'note': overdueNoteTextController.textTrim};
    final response = await Get.find<InstallationApi>()
        .addNewInstallationOverdueNote(body)
        .callApi();

    if (response.isSuccess) {
      overdueNoteListRxData.insert(
        0,
        NoteViewmodelResponse(
          createdByEmail: userInfor?.email,
          note: overdueNoteTextController.textTrim,
          createdDate: DateTime.now().millisecondsSinceEpoch.toString(),
        ),
      );

      overdueNoteTextController.clear();

      update();
    }
  }

  @override
  Future getNoteList() async {
    final body = {'id': id};
    final response = await Get.find<InstallationApi>()
        .getNewInstallationNoteList(body)
        .callApi();

    final data = response.data?.note;

    if (response.isSuccess) {
      noteListRxData.value = data ?? [];

      update();
    }
  }

  @override
  Future getOverdueReasonList() async {
    final body = {'id': id};
    final response = await Get.find<InstallationApi>()
        .getNewInstallationOverdueNoteList(body)
        .callApi();

    final data = response.data?.note;

    if (response.isSuccess) {
      overdueNoteListRxData.value = data ?? [];

      update();
    }
  }

  @override
  String? get expectedCompletionDate => detailData?.expectedCompletionDate;
}
