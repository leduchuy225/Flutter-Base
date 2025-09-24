import 'package:flutter/material.dart';
import 'package:flutter_base/core/const/constants.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/data/repair_request_api.dart';
import 'package:flutter_base/models/base_response.dart';
import 'package:flutter_base/models/base_selector.dart';
import 'package:flutter_base/models/common/technical_staff_list_model_payload.dart';
import 'package:flutter_base/models/installation/update_material_payload.dart';
import 'package:flutter_base/models/repair_request/repair_request_get_modem_log_model_response.dart';
import 'package:flutter_base/ui/new_installation_and_repair_request_share/widgets/take_surver_widget.dart';
import 'package:get/get.dart';

import '../../../core/services/cache_service.dart';
import '../../../core/utils/utils.dart';
import '../../../models/common/installation_detail_payload.dart';
import '../../../models/common/note_viewmodel_response.dart';
import '../../../models/common/update_survey_payload.dart';
import '../../../models/file_collection_model.dart';
import '../../../models/installation/update_material_response.dart';
import '../../../models/installation/view_installation_report_file_model_payload.dart';
import '../../../models/installation/view_installation_report_file_payload.dart';
import '../../../models/repair_request/repair_request_add_modem_log_model_payload.dart';
import '../../../models/repair_request/repair_request_add_modem_log_payload.dart';
import '../../../models/repair_request/repair_request_detail_model_response.dart';
import '../../new_installation_and_repair_request_share/common_installation_detail_controller.dart';
import '../../new_installation_and_repair_request_share/widgets/sign_report_file/report_file_item.dart';

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
      currentRxStep.value = data.currentStep?.toInt() ?? 1;
      noteListRxData.value = data.listMbRepairRequestNoteViewModel ?? [];

      overdueNoteListRxData.value =
          data.listMbRepairRequestOverdueViewModel ?? [];

      reportFiles.addAll([
        if ((data.reportProblem ?? '').isNotEmpty)
          SignReportFileItemModel(
            id: ReportType.BBNT,
            name: 'Biên bản mẫu sự cố',
            pathName: data.reportProblem!,
            url: getFileLink(data.reportProblem)!,
            isSigned: data.reportProblemIsSet ?? false,
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

      cccdImageController.files.value = [
        if ((data.mbCustomerViewModel?.cccdFront ?? '').isNotEmpty)
          FileCollectionModel(
            fileName: data.mbCustomerViewModel?.cccdFront,
            filePath: getFileLink(data.mbCustomerViewModel?.cccdFront)!,
          ),
        if ((data.mbCustomerViewModel?.cccdBack ?? '').isNotEmpty)
          FileCollectionModel(
            fileName: data.mbCustomerViewModel?.cccdBack,
            filePath: getFileLink(data.mbCustomerViewModel?.cccdBack)!,
          ),
      ];

      cableEndTextController.text = (data.cableLengthEnd ?? '').toString();
      cableStartTextController.text = (data.cableLengthStart ?? '').toString();

      materialSelectorController.replace(
        data.listMbRepairRequestMaterialViewModel ?? [],
      );

      modemReplacementLogs.value = data.listMbModemLogViewModel ?? [];

      accidentsSelectorController.selectors = (data.listListError ?? []).map((
        element,
      ) {
        return MySelectorModel(id: element.id, name: element.text ?? '');
      }).toList();

      accidentDescriptionTextController.text = data.technicalStaffNote ?? '';
      accidentSolutionTextController.text = data.reportCorrectionMethod ?? '';

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
    final response = await Get.find<RepairRequestApi>()
        .addTechnicalStaffRepairRequest(body)
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
    final response = await Get.find<RepairRequestApi>()
        .updateRepairRequestStep3(body)
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
    final response = await Get.find<RepairRequestApi>()
        .uploadRepairRequestStep4(
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
          technicalStaffNote: accidentDescriptionTextController.textTrim,
          reportCorrectionMethod: accidentSolutionTextController.textTrim,
          accidentListString: accidentsSelectorController.selectors
              .map((element) => element.id)
              .join(','),
          report_Distance:
              ((getNullOrNumber(cableEndTextController.textTrim) ?? 0) -
                      (getNullOrNumber(cableStartTextController.textTrim) ?? 0))
                  .toString(),
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
      phuongXaId: detailData?.wardId?.toInt(),
      countryId: detailData?.countryId?.toInt(),
      thanhPhoId: detailData?.provinceId?.toInt(),
      quanHuyenId: detailData?.districtId?.toInt(),
    );
  }

  @override
  Future<List<MySelectorModel>> getReportTypeList() async {
    final body = {'id': id};
    final response = await Get.find<RepairRequestApi>()
        .getRepairReportFileList(body)
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
      model: ViewInstallationReportFileModelPayload(),
    );

    final response = await Get.find<RepairRequestApi>()
        .viewRepairReportFile(body)
        .callApi();

    final urlFile = getFileLink(response.data?.urlFile);

    if (urlFile != null) {
      final firstReportType = reportTypeSelectorController.first;
      if (reportFiles.every((report) {
        return report.id != currentReportIdToPreview;
      })) {
        reportFiles.add(
          SignReportFileItemModel(
            url: urlFile,
            id: firstReportType?.id,
            name: firstReportType?.name ?? '',
            pathName: response.data?.urlFile ?? '',
            isSigned: firstReportType?.extraData?['isSigned'] ?? false,
          ),
        );
      } else {
        reportFiles.forEach((report) {
          if (report.id == currentReportIdToPreview) {
            report.url = urlFile;
            report.isSigned = firstReportType?.extraData?['isSigned'] ?? false;
          }
        });
      }
      update();
    }
  }

  @override
  Future signReportFile() {
    // TODO: implement signReportFile
    throw UnimplementedError();
  }

  @override
  String? get serviceType => MBService.RepairRequest;

  @override
  int? get countryId => detailData?.countryId?.toInt();

  @override
  int? get provinceId => detailData?.provinceId?.toInt();

  @override
  Future<BaseResponse> deleteMaterialApi(Map<String, dynamic> body) async {
    final response = await Get.find<RepairRequestApi>()
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
    final response = await Get.find<RepairRequestApi>()
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
          key: CacheService.isRefreshRepairRequestList,
        ) ??
        false;
  }

  @override
  Future addModemReplacementLog() async {
    final body = RepairRequestAddModemLogPayload(
      id: id,
      model: RepairRequestAddModemLogModelPayload(
        modemNew: newModemTextController.textTrim,
        modemOld: oldModemTextController.textTrim,
      ),
    );

    final response = await Get.find<RepairRequestApi>()
        .addModemLog(body)
        .callApi();

    final data = response.data?.model;

    if (data != null) {
      newModemTextController.clear();
      oldModemTextController.clear();

      modemReplacementLogs.value = data;

      setIsRefreshValue();

      update();
    }
  }

  @override
  Future completeRquest(BuildContext context) async {
    final body = {'id': id};
    final response = await Get.find<RepairRequestApi>()
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

    final response = await Get.find<RepairRequestApi>()
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

    final response = await Get.find<RepairRequestApi>()
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
