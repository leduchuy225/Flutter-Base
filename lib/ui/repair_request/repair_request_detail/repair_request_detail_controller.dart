import 'package:flutter/material.dart';
import 'package:flutter_base/core/const/constants.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/data/repair_request_api.dart';
import 'package:flutter_base/models/base_selector.dart';
import 'package:flutter_base/models/common/technical_staff_list_model_payload.dart';
import 'package:get/get.dart';

import '../../../core/services/cache_service.dart';
import '../../../core/utils/utils.dart';
import '../../../models/common/installation_detail_payload.dart';
import '../../../models/common/note_viewmodel_response.dart';
import '../../../models/file_collection_model.dart';
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
        .callApi(isShowSuccessMessage: false);

    final data = response.data?.model;

    if (data != null) {
      detailRxData.value = data;
      currentRxStep.value = data.currentStep ?? 1;
      noteListRxData.value = data.listMbRepairRequestNoteViewModel ?? [];

      overdueNoteListRxData.value =
          data.listMbRepairRequestOverdueViewModel ?? [];

      if (data.technicalStaffModuleImage != null) {
        technicalStaffModuleImageControler.files.value = [
          FileCollectionModel(
            fileName: data.technicalStaffModuleImage,
            filePath: getFileLink(data.technicalStaffModuleImage)!,
          ),
        ];
      }

      if (data.technicalStaffImage != null) {
        technicalStaffImageControler.files.value = [
          FileCollectionModel(
            fileName: data.technicalStaffImage,
            filePath: getFileLink(data.technicalStaffImage)!,
          ),
        ];
      }

      if (data.technicalStaffTestImage != null) {
        technicalStaffTestImageControler.files.value = [
          FileCollectionModel(
            fileName: data.technicalStaffTestImage,
            filePath: getFileLink(data.technicalStaffTestImage)!,
          ),
        ];
      }

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
  Future addNote() async {
    final body = {'id': id, 'note': noteTextController.textTrim};
    final response = await Get.find<RepairRequestApi>()
        .addRepairRequestNote(body)
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
    final response = await Get.find<RepairRequestApi>()
        .addRepairRequestOverdueNote(body)
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
    final response = await Get.find<RepairRequestApi>()
        .getRepairRequestNoteList(body)
        .callApi(isShowSuccessMessage: false);

    final data = response.data?.note;

    if (response.isSuccess) {
      noteListRxData.value = data ?? [];

      update();
    }
  }

  @override
  Future getOverdueReasonList() async {
    final body = {'id': id};
    final response = await Get.find<RepairRequestApi>()
        .getRepairRequestOverdueNoteList(body)
        .callApi(isShowSuccessMessage: false);

    final data = response.data?.note;

    if (response.isSuccess) {
      overdueNoteListRxData.value = data ?? [];

      update();
    }
  }

  @override
  String? get expectedCompletionDate => detailData?.expectedCompletionDate;

  @override
  TechnicalStaffListModelPayload get technicalStaffListModelPayload {
    return TechnicalStaffListModelPayload(
      phuongXaId: detailData?.wardId,
      countryId: detailData?.countryId,
      thanhPhoId: detailData?.provinceId,
      quanHuyenId: detailData?.districtId,
    );
  }

  @override
  Future<List<MySelectorModel>> getReportTypeList() async {
    // TODO: implement previewReportFile
    throw UnimplementedError();
  }

  @override
  Future previewReportFile() {
    // TODO: implement previewReportFile
    throw UnimplementedError();
  }

  @override
  Future signReportFile() {
    // TODO: implement signReportFile
    throw UnimplementedError();
  }

  @override
  String? get serviceType => MBService.RepairRequest;
}
