import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:get/get.dart';

import '../../../data/installation_api.dart';
import '../../../models/installation/installation_detail_model_response.dart';
import '../../../models/installation/installation_detail_payload.dart';
import '../../controller/common_installation_controller.dart';

class NewInstallationDetailController
    extends CommonInstallationController<InstallationDetailModelResponse> {
  @override
  Future getDetailData() async {
    final body = InstallationDetailPayload();
    final response = await Get.find<InstallationApi>()
        .getNewInstallationDetail(body)
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
    final response = await Get.find<InstallationApi>()
        .updateCustomerNewInstallationNote({})
        .callApi();

    if (response.isSuccess) {
      currentRxStep.value = 4;

      update();
    }
  }

  @override
  Future uploadFile() async {
    final response = await Get.find<InstallationApi>()
        .uploadNewInstallationFile(
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
