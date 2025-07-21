import 'package:flutter/widgets.dart';
import 'package:flutter_base/core/const/constants.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:get/get.dart';

import '../../../core/services/cache_service.dart';
import '../../../data/installation_api.dart';
import '../../../models/installation/installation_detail_model_response.dart';
import '../../../models/installation/installation_detail_payload.dart';
import '../../../models/installation/note_viewmodel_response.dart';
import '../../new_installation_and_repair_request_share/common_installation_controller.dart';

class NewInstallationDetailController
    extends CommonInstallationController<InstallationDetailModelResponse> {
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
        .callApi();

    final data = response.data?.model;

    if (data != null) {
      detailRxData.value = data;
      currentRxStep.value = data.currentStep ?? 1;
      noteListRxData.value = data.listMbConnectionRequestNoteViewModel ?? [];

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
  Future updateCustomerNote() async {
    final body = {'id': id, 'note': customerNoteTextController.textTrim};
    final response = await Get.find<InstallationApi>()
        .updateCustomerNewInstallationNote(body)
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
}
