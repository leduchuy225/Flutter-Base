import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_base/core/const/constants.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/core/utils/utils.dart';
import 'package:flutter_base/models/base_response.dart';
import 'package:flutter_base/models/base_selector.dart';
import 'package:flutter_base/models/common/technical_staff_list_model_payload.dart';
import 'package:flutter_base/models/installation/update_material_payload.dart';
import 'package:get/get.dart';

import '../../../core/services/cache_service.dart';
import '../../../data/installation_api.dart';
import '../../../models/common/installation_detail_payload.dart';
import '../../../models/common/note_viewmodel_response.dart';
import '../../../models/file_collection_model.dart';
import '../../../models/installation/installation_detail_model_response.dart';
import '../../../models/installation/update_material_response.dart';
import '../../../models/installation/view_installation_report_file_model_payload.dart';
import '../../../models/installation/view_installation_report_file_payload.dart';
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

      if (data.reportAcceptance != null) {
        previewReportFileLink.value = getFileLink(data.reportAcceptance)!;
        isReportFileSigned.value = data.reportAcceptanceIsSign ?? false;
        reportTypeListController.selectors = [
          MySelectorModel(
            id: ReportType.BBNT,
            name: 'Biên bản nghiệm thu FTTx với khách hàng',
          ),
        ];
      } else if (data.reportHandoverDevice != null) {
        previewReportFileLink.value = getFileLink(data.reportAcceptance)!;
        isReportFileSigned.value = data.reportHandoverDeviceIsSign ?? false;
        reportTypeListController.selectors = [
          MySelectorModel(
            id: ReportType.BBBG,
            name: 'Biên bản bàn giao thiết bị',
          ),
        ];
      }

      if (data.technicalStaffModuleImage != null) {
        technicalStaffModuleImageControler.files.value = [
          FileCollectionModel(
            fileName: data.technicalStaffModuleImage!,
            filePath: getFileLink(data.technicalStaffModuleImage)!,
          ),
        ];
      }

      if (data.technicalStaffImage != null) {
        technicalStaffImageControler.files.value = [
          FileCollectionModel(
            fileName: data.technicalStaffImage!,
            filePath: getFileLink(data.technicalStaffImage)!,
          ),
        ];
      }

      if (data.technicalStaffTestImage != null) {
        technicalStaffTestImageControler.files.value = [
          FileCollectionModel(
            fileName: data.technicalStaffTestImage!,
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
    final response = await Get.find<InstallationApi>()
        .getNewInstallationOverdueNoteList(body)
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
    final body = {'id': id};
    final response = await Get.find<InstallationApi>()
        .getInstallationReportFileList(body)
        .callApi(isShowLoading: false, isShowSuccessMessage: false);

    return (response.data?.model ?? []).map((element) {
      return MySelectorModel(id: element.id, name: element.title ?? '');
    }).toList();
  }

  @override
  Future previewReportFile() async {
    final body = ViewInstallationReportFilePayload(
      id: id,
      type: currentReportId,
      model: ViewInstallationReportFileModelPayload(
        duLieuHoanThanh: reportController.completeDateController.dateTime,
        // Biên bản nghiệm thu
        duLieuAcc: currentReportId == ReportType.BBNT
            ? reportController.bbntAccountTextController.textTrim
            : null,
        duLieuChatLuongDichVu: currentReportId == ReportType.BBNT
            ? reportController.bbntServiceQualityTextController.textTrim
            : null,
        duLieuIpV4: currentReportId == ReportType.BBNT
            ? reportController.bbntIpV4TextController.textTrim
            : null,
        duLieuPass: currentReportId == ReportType.BBNT
            ? reportController.bbntPasswordTextController.textTrim
            : null,
        // Biên bản bàn giao
        tb1Ten: currentReportId == ReportType.BBBG
            ? reportController.bbbgNameTextController.textTrim
            : null,
        tb1SLuong: currentReportId == ReportType.BBBG
            ? reportController.bbbgAmountTextController.textTrim
            : null,
        tb1HTrang: currentReportId == ReportType.BBBG
            ? reportController.bbbgStatusTextController.textTrim
            : null,
        tb1ThongSo: currentReportId == ReportType.BBBG
            ? reportController.bbbgStatictisTextController.textTrim
            : null,
      ),
    );

    final response = await Get.find<InstallationApi>()
        .viewInstallationReportFile(body)
        .callApi();

    final urlFile = getFileLink(response.data?.urlFile);

    if (urlFile != null) {
      previewReportFileLink.value = urlFile;
      update();
    }
  }

  @override
  Future signReportFile() async {
    final staffSignFile = await writeToImageFile(
      fileName: 'staff_sign',
      data: await staffSignatureController.toPngBytes(),
    );
    final customersSignFile = await writeToImageFile(
      fileName: 'customer_sign',
      data: await customerSignatureController.toPngBytes(),
    );

    final response = await Get.find<InstallationApi>()
        .signInstallationReportFile(
          id: id.toString(),
          type: currentReportId.toString(),
          customersSign: customersSignFile,
          technicalStaffSign: staffSignFile,
        )
        .callApi();

    final urlFile = getFileLink(response.data?.urlFile);

    if (urlFile != null) {
      isReportFileSigned.value = true;
      previewReportFileLink.value = urlFile;
      update();
    }
  }

  @override
  String? get serviceType => MBService.NewInstallation;

  @override
  int? get countryId => detailData?.countryId;

  @override
  int? get provinceId => detailData?.provinceId;

  @override
  Future<BaseResponse> deleteMaterialApi(Map<String, dynamic> body) {
    return Get.find<InstallationApi>().deleteMaterial(body).callApi();
  }

  @override
  Future<BaseResponse<UpdateMaterialResponse>> updateMaterialApi(
    UpdateMaterialPayload body,
  ) {
    return Get.find<InstallationApi>().updateMaterial(body).callApi();
  }
}
