import 'package:flutter/material.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/data/repair_request_api.dart';
import 'package:get/get.dart';

import '../../../models/installation/installation_detail_payload.dart';
import '../../../models/installation/note_viewmodel_response.dart';
import '../../../models/repair_request/repair_request_detail_model_response.dart';
import '../../controller/common_installation_controller.dart';

class RepairRequestDetailController
    extends CommonInstallationController<RepairRequestDetailModelResponse> {
  @override
  Future getDetailData() async {
    final body = InstallationDetailPayload();
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
    final response = await Get.find<RepairRequestApi>()
        .addTechnicalStaffRepairRequest({})
        .callApi();

    if (response.isSuccess) {
      final step = response.data?.currentStep ?? 1;

      currentRxStep.value = step;

      update();
    }
  }

  @override
  Future updateCustomerNote() async {
    final response = await Get.find<RepairRequestApi>()
        .updateCustomerRepairRequestNote({})
        .callApi();

    if (response.isSuccess) {
      final step = response.data?.currentStep ?? 1;

      currentRxStep.value = step;
      noteListRxData.insert(
        0,
        NoteViewmodelResponse(
          currentStep: step,
          createdByEmail: userInfor?.email,
          note: customerNoteTextController.textTrim,
          createdDate: DateTime.now().millisecondsSinceEpoch.toString(),
        ),
      );

      customerNoteTextController.clear();

      update();
    }
  }

  @override
  Future uploadFile() async {
    final response = await Get.find<RepairRequestApi>()
        .uploadRepairRequestFile(
          id: id.toString(),
          note: technicalNoteTextController.textTrim,
          technicalStaffImage: technicalStaffImageControler.firstFile,
          technicalStaffTestImage: technicalStaffTestImageControler.firstFile,
          technicalStaffModuleImage:
              technicalStaffModuleImageControler.firstFile,
        )
        .callApi();

    if (response.isSuccess) {
      final step = response.data?.currentStep ?? 1;

      currentRxStep.value = step;

      update();
    }
  }

  @override
  Future closeRequest(BuildContext context) {
    // TODO: implement closeRequest
    throw UnimplementedError();
  }

  @override
  int? get id => detailData?.id;
}
