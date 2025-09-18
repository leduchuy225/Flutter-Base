import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_base/core/const/constants.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/core/utils/utils.dart';
import 'package:flutter_base/models/base_response.dart';
import 'package:flutter_base/models/base_selector.dart';
import 'package:flutter_base/models/common/technical_staff_list_model_payload.dart';
import 'package:flutter_base/models/installation/update_material_payload.dart';
import 'package:flutter_base/models/repair_request/repair_request_get_modem_log_model_response.dart';
import 'package:flutter_base/ui/new_installation_and_repair_request_share/widgets/take_surver_widget.dart';
import 'package:get/get.dart';

import '../../../core/services/cache_service.dart';
import '../../../data/installation_api.dart';
import '../../../models/common/installation_detail_payload.dart';
import '../../../models/common/note_viewmodel_response.dart';
import '../../../models/common/update_survey_payload.dart';
import '../../../models/file_collection_model.dart';
import '../../../models/installation/installation_detail_model_response.dart';
import '../../../models/installation/update_device_response.dart';
import '../../../models/installation/update_material_response.dart';
import '../../../models/installation/view_installation_report_file_model_payload.dart';
import '../../../models/installation/view_installation_report_file_payload.dart';
import '../../../models/repair_request/repair_request_add_modem_log_model_payload.dart';
import '../../../models/repair_request/repair_request_add_modem_log_payload.dart';
import '../../new_installation_and_repair_request_share/common_installation_detail_controller.dart';
import '../../new_installation_and_repair_request_share/widgets/sign_report_file/report_file_item.dart';

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
      currentRxStep.value = data.currentStep?.toInt() ?? 1;
      noteListRxData.value = data.listMbConnectionRequestNoteViewModel ?? [];
      overdueNoteListRxData.value =
          data.listMbConnectionRequestOverdueViewModel ?? [];

      reportFiles.addAll([
        if ((data.reportAcceptance ?? '').isNotEmpty)
          SignReportFileItemModel(
            id: ReportType.BBNT,
            pathName: data.reportAcceptance!,
            url: getFileLink(data.reportAcceptance)!,
            name: 'Biên bản nghiệm thu FTTx với khách hàng',
            isSigned: data.reportAcceptanceIsSign ?? false,
          ),
        if ((data.reportHandoverDevice ?? '').isNotEmpty)
          SignReportFileItemModel(
            id: ReportType.BBBG,
            name: 'Biên bản bàn giao thiết bị',
            pathName: data.reportHandoverDevice!,
            url: getFileLink(data.reportHandoverDevice)!,
            isSigned: data.reportHandoverDeviceIsSign ?? false,
          ),
        if ((data.reportNew ?? '').isNotEmpty)
          SignReportFileItemModel(
            id: ReportType.BBKM,
            name: 'Biên bản kéo mới',
            pathName: data.reportNew!,
            url: getFileLink(data.reportNew)!,
            isSigned: data.reportNewIsSet ?? false,
          ),
      ]);

      if ((data.technicalStaffModuleImage ?? '').isNotEmpty) {
        technicalStaffModuleImageControler.files.value = [
          FileCollectionModel(
            fileName: data.technicalStaffModuleImage!,
            filePath: getFileLink(data.technicalStaffModuleImage)!,
          ),
        ];
      }

      if ((data.technicalStaffImage ?? '').isNotEmpty) {
        technicalStaffImageControler.files.value = [
          FileCollectionModel(
            fileName: data.technicalStaffImage!,
            filePath: getFileLink(data.technicalStaffImage)!,
          ),
        ];
      }

      if ((data.technicalStaffTestImage ?? '').isNotEmpty) {
        technicalStaffTestImageControler.files.value = [
          FileCollectionModel(
            fileName: data.technicalStaffTestImage!,
            filePath: getFileLink(data.technicalStaffTestImage)!,
          ),
        ];
      }

      if ((data.reportImageDivider ?? '').isNotEmpty) {
        reportDividerImageControler.files.value = [
          FileCollectionModel(
            fileName: data.reportImageDivider!,
            filePath: getFileLink(data.reportImageDivider)!,
          ),
        ];
      }

      if ((data.reportCableLengthStart ?? '').isNotEmpty) {
        reportCableStartImageControler.files.value = [
          FileCollectionModel(
            fileName: data.reportCableLengthStart!,
            filePath: getFileLink(data.reportCableLengthStart)!,
          ),
        ];
      }

      if ((data.reportCableLengthEnd ?? '').isNotEmpty) {
        reportCableEndImageControler.files.value = [
          FileCollectionModel(
            fileName: data.reportCableLengthEnd!,
            filePath: getFileLink(data.reportCableLengthEnd)!,
          ),
        ];
      }

      cableEndTextController.text = (data.cableLengthEnd ?? '').toString();
      cableStartTextController.text = (data.cableLengthStart ?? '').toString();

      materialSelectorController.replace(
        data.listMbConnectionRequestMaterialViewModel ?? [],
      );

      modemReplacementLogs.value = data.listMbModemLogViewModel ?? [];

      slidAndDividerController.data = UpdateDeviceResponse(
        slidCode: data.slidCode,
        deviceAcc: data.deviceAcc,
        devicePort: data.devicePort,
        devicePass: data.devicePass,
        dividerCode: data.dividerCode,
      );

      isViewOnlyModeRxData.value =
          isRequestClosed || technicalStaffReportCompletedDate != null;

      update();
    }
  }

  @override
  Future assignTechnicalStaff() async {
    final body = {
      'id': id,
      'userId': technicalStaffSelectorController.first?.id,
    };
    final response = await Get.find<InstallationApi>()
        .addTechnicalStaffNewInstallation(body)
        .callApi();

    if (response.isSuccess) {
      setIsRefreshValue();

      final step = response.data?.currentStep ?? 1;
      currentRxStep.value = step.toInt();

      update();
    }
  }

  @override
  Future updateStep3() async {
    final body = {
      'id': id,
      'note':
          '${MyStrings.appointmentPrefix} ${step2NoteTextController.textTrim}',
    };
    final response = await Get.find<InstallationApi>()
        .updateNewInstallationStep3(body)
        .callApi();

    if (response.isSuccess) {
      final step = response.data?.currentStep ?? 1;
      if (currentRxStep.value != step) {
        setIsRefreshValue();
      }

      currentRxStep.value = step.toInt();

      step2NoteTextController.clear();

      await getNoteList();

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
          cableLengthEnd: cableEndTextController.textTrim,
          cableLengthStart: cableStartTextController.textTrim,
          report_CableLengthEnd: reportCableEndImageControler.firstFile,
          report_CableLengthStart: reportCableStartImageControler.firstFile,
          report_ImageDivider: reportDividerImageControler.firstFile,
        )
        .callApi();

    if (response.isSuccess) {
      setIsRefreshValue();

      if (isReportTaskAgain && reportFiles.isNotEmpty) {
        reportFiles.clear();
      }

      currentRxStep.value = (response.data?.currentStep ?? 1).toInt();
      detailRxData.value?.isCompletedStaffOn =
          response.data?.isCompletedStaffOn;

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
      phuongXaId: detailData?.wardId?.toInt(),
      countryId: detailData?.countryId?.toInt(),
      thanhPhoId: detailData?.provinceId?.toInt(),
      quanHuyenId: detailData?.districtId?.toInt(),
    );
  }

  @override
  Future<List<MySelectorModel>> getReportTypeList() async {
    final body = {'id': id};
    final response = await Get.find<InstallationApi>()
        .getInstallationReportFileList(body)
        .callApi(isShowLoading: false, isShowSuccessMessage: false);

    return (response.data?.model ?? []).map((element) {
      return MySelectorModel(
        id: element.id,
        name: element.title ?? '',
        extraData: {'isSigned': element.isSign == false},
      );
    }).toList();
  }

  @override
  Future previewReportFile() async {
    final body = ViewInstallationReportFilePayload(
      id: id,
      type: currentReportIdToPreview,
      model: ViewInstallationReportFileModelPayload(
        duLieuHoanThanh: reportDataController.completeDateController.dateTime,
        // Biên bản nghiệm thu
        duLieuAcc: currentReportIdToPreview == ReportType.BBNT
            ? reportDataController.bbntAccountTextController.textTrim
            : null,
        duLieuChatLuongDichVu: currentReportIdToPreview == ReportType.BBNT
            ? reportDataController.bbntServiceQualityTextController.textTrim
            : null,
        duLieuIpV4: currentReportIdToPreview == ReportType.BBNT
            ? reportDataController.bbntIpV4TextController.textTrim
            : null,
        duLieuPass: currentReportIdToPreview == ReportType.BBNT
            ? reportDataController.bbntPasswordTextController.textTrim
            : null,
        // Biên bản bàn giao
        tb1Ten: currentReportIdToPreview == ReportType.BBBG
            ? reportDataController.bbbgNameTextController.textTrim
            : null,
        tb1SLuong: currentReportIdToPreview == ReportType.BBBG
            ? reportDataController.bbbgAmountTextController.textTrim
            : null,
        tb1HTrang: currentReportIdToPreview == ReportType.BBBG
            ? reportDataController.bbbgStatusTextController.textTrim
            : null,
        tb1ThongSo: currentReportIdToPreview == ReportType.BBBG
            ? reportDataController.bbbgStatictisTextController.textTrim
            : null,
      ),
    );

    final response = await Get.find<InstallationApi>()
        .viewInstallationReportFile(body)
        .callApi();

    final urlFile = getFileLink(response.data?.urlFile);

    if (urlFile != null) {
      final firstReportType = reportTypeSelectorController.first;
      final isSignStatus = firstReportType?.extraData?['isSigned'] ?? false;

      if (reportFiles.every((report) {
        return report.id != currentReportIdToPreview;
      })) {
        reportFiles.add(
          SignReportFileItemModel(
            url: urlFile,
            isSigned: isSignStatus,
            id: firstReportType?.id,
            name: firstReportType?.name ?? '',
            pathName: response.data?.urlFile ?? '',
          ),
        );
      } else {
        reportFiles.forEach((report) {
          if (report.id == currentReportIdToPreview) {
            report.url = urlFile;
            report.isSigned = isSignStatus;
          }
        });
      }
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
          customersSign: customersSignFile,
          technicalStaffSign: staffSignFile,
          type: currentReportIdToSign.toString(),
        )
        .callApi();

    final urlFile = getFileLink(response.data?.urlFile);

    if (urlFile != null) {
      detailRxData.value?.isCompletedStaffOn =
          response.data?.isCompletedStaffOn;
      reportFiles.forEach((report) {
        if (report.id == currentReportIdToSign) {
          report.url = urlFile;
          report.isSigned = true;
        }
      });
      update();
    }
  }

  @override
  String? get serviceType => MBService.NewInstallation;

  @override
  int? get countryId => detailData?.countryId?.toInt();

  @override
  int? get provinceId => detailData?.provinceId?.toInt();

  @override
  Future<BaseResponse> deleteMaterialApi(Map<String, dynamic> body) async {
    final response = await Get.find<InstallationApi>()
        .deleteMaterial(body)
        .callApi();

    if (response.isSuccess) {
      setIsRefreshValue();
    }

    return response;
  }

  @override
  Future<BaseResponse<UpdateMaterialResponse>> updateMaterialApi(
    UpdateMaterialPayload body,
  ) async {
    final response = await Get.find<InstallationApi>()
        .updateMaterial(body)
        .callApi();

    if (response.data?.currentStep != null) {
      currentRxStep.value = response.data!.currentStep!.toInt();
      setIsRefreshValue();

      update();
    }

    return response;
  }

  @override
  bool get isRefreshValue {
    return CacheService().read<bool>(
          key: CacheService.isRefreshNewInstallationList,
        ) ??
        false;
  }

  @override
  Future addModemReplacementLog() async {
    final body = RepairRequestAddModemLogPayload(
      id: id,
      model: RepairRequestAddModemLogModelPayload(
        modemNew: newModemTextController.textTrim,
      ),
    );

    final response = await Get.find<InstallationApi>()
        .addModemLog(body)
        .callApi();

    final data = response.data?.model;

    if (data != null) {
      newModemTextController.clear();

      modemReplacementLogs.value = data;

      setIsRefreshValue();

      update();
    }
  }

  @override
  Future completeRquest(BuildContext context) async {
    final body = {'id': id};
    final response = await Get.find<InstallationApi>()
        .confirmTaskCompletion(body)
        .callApi();

    if (response.isSuccess) {
      setIsRefreshValue();
      Navigator.of(context).pop();
    }
  }

  @override
  bool get isRequestClosed => detailData?.isClosed ?? false;

  @override
  bool get isRequestReadyToClose => detailData?.isCompletedStaffOn ?? false;

  @override
  Future updateSurveyStatus() async {
    final statusId = surveyStatusSelectorController.first?.id;
    final body = UpdateSurveyPayload(
      id: id,
      status: statusId,
      note: surveyNoteTextController.textTrim,
    );

    final response = await Get.find<InstallationApi>()
        .updateSurveyStatus(body)
        .callApi();

    if (response.isSuccess) {
      surveyNoteTextController.clear();
      surveyStatusSelectorController.clear();

      detailRxData.value?.technicalStaffSurveyStatus = statusId;

      setIsRefreshValue();

      update();
    }
  }

  @override
  SurveyStatusEnum? get surveyStatus {
    switch (detailData?.technicalStaffSurveyStatus) {
      case SurverStatusValue.Done:
        return SurveyStatusEnum.Done;
      case SurverStatusValue.Cancel:
        return SurveyStatusEnum.Cancel;
      case SurverStatusValue.Pending:
        return SurveyStatusEnum.Pending;
      default:
        return null;
    }
  }

  @override
  Future getModemReplacementLog() async {
    final body = {'id': id};

    final response = await Get.find<InstallationApi>()
        .getModemLog(body)
        .callApi(isShowSuccessMessage: false);

    final data = response.data?.model ?? [];

    if (data.isNotEmpty) {
      modemReplacementLogs.value = data;
    }
  }

  @override
  String? get technicalStaffReportCompletedDate =>
      detailData?.technicalStaffReportCompletedDate;

  @override
  List<RepairRequestGetModemLogModelResponse> get modemLogs =>
      detailData?.listMbModemLogViewModel ?? [];
}
