import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/data/repair_request_api.dart';
import 'package:get/get.dart';

import '../../../models/installation/installation_detail_payload.dart';
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

      update();
    }
  }

  @override
  Future updateCustomerNote() async {
    final response = await Get.find<RepairRequestApi>()
        .updateCustomerRepairRequestNote({})
        .callApi();

    if (response.isSuccess) {
      currentRxStep.value = 4;

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
      currentRxStep.value = 5;

      update();
    }
  }

  @override
  int? get id => detailData?.id;
}
