import 'package:flutter/material.dart';
import 'package:flutter_base/core/const/constants.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/data/repair_request_api.dart';
import 'package:get/get.dart';

import '../../../core/services/cache_service.dart';
import '../../../models/common/installation_detail_payload.dart';
import '../../../models/common/note_viewmodel_response.dart';
import '../../../models/repair_request/repair_request_detail_model_response.dart';
import '../../new_installation_and_repair_request_share/common_installation_detail_controller.dart';

class RepairRequestDetailController
    extends
        CommonInstallationDetailController<RepairRequestDetailModelResponse> {
  final int repairRequestId;

  RepairRequestDetailController({required this.repairRequestId});

  @override
  Future getDetailData() async {
    final body = InstallationDetailPayload(
      id: id,
      typeData: MBService.RepairRequest,
    );
    final response = await Get.find<RepairRequestApi>()
        .getRepairRequestDetail(body)
        .callApi();

    final data = response.data?.model;

    if (data != null) {
      detailRxData.value = data;
      currentRxStep.value = data.currentStep ?? 1;
      noteListRxData.value = data.listMbRepairRequestNoteViewModel ?? [];

      update();
    }
  }

  @override
  Future assignTechnicalStaff() async {
    final body = {'id': id, 'userId': technicalStaffSelectController.first?.id};
    final response = await Get.find<RepairRequestApi>()
        .addTechnicalStaffRepairRequest(body)
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
    final response = await Get.find<RepairRequestApi>()
        .updateRepairRequestStep3(body)
        .callApi();

    if (response.isSuccess) {
      final step = response.data?.currentStep ?? 1;
      if (currentRxStep.value != step) {
        setIsRefreshValue();
      }
      currentRxStep.value = step;

      noteListRxData.insert(
        0,
        NoteViewmodelResponse(
          currentStep: step,
          createdByEmail: userInfor?.email,
          note: step2NoteTextController.textTrim,
          createdDate: DateTime.now().millisecondsSinceEpoch.toString(),
        ),
      );

      step2NoteTextController.clear();

      update();
    }
  }

  @override
  Future uploadStep4() async {
    final response = await Get.find<RepairRequestApi>()
        .uploadRepairRequestStep4(
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
    final response = await Get.find<RepairRequestApi>()
        .closeRepairRequest(body)
        .callApi();

    if (response.data?.isClosed == true) {
      setIsRefreshValue();

      Navigator.of(context).popUntil((route) {
        return [
          '/MainScreen',
          '/RepairRequestDetailScreen',
        ].contains(route.settings.name);
      });
    }
  }

  @override
  int? get id => repairRequestId;

  @override
  void setIsRefreshValue() {
    CacheService().write(
      value: true,
      key: CacheService.isRefreshRepairRequestList,
    );
  }

  @override
  Future addNote() {
    // TODO: implement addNote
    throw UnimplementedError();
  }

  @override
  Future addOverdueReason() {
    // TODO: implement addOverdueReason
    throw UnimplementedError();
  }

  @override
  Future getNoteList() {
    // TODO: implement getNoteList
    throw UnimplementedError();
  }

  @override
  Future getOverdueReasonList() {
    // TODO: implement getOverdueReasonList
    throw UnimplementedError();
  }
}
