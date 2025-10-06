import 'package:flutter/material.dart';
import 'package:flutter_base/core/const/constants.dart';
import 'package:flutter_base/core/services/user_service.dart';
import 'package:flutter_base/models/base_response.dart';
import 'package:flutter_base/models/base_selector.dart';
import 'package:flutter_base/ui/new_installation_and_repair_request_share/widgets/modem_replace_log_widget.dart';
import 'package:flutter_base/ui/new_installation_and_repair_request_share/widgets/sign_report_file/sign_report_file_widget.dart';
import 'package:flutter_base/ui/new_installation_and_repair_request_share/widgets/take_surver_widget.dart';
import 'package:flutter_base/widgets/data_state_widget.dart';
import 'package:flutter_base/widgets/dialog/dialog_widget.dart';
import 'package:flutter_base/widgets/file_collection/file_collection_controller.dart';
import 'package:flutter_base/widgets/selector/selector_controller.dart';
import 'package:flutter_base/widgets/text_field/text_field_controller.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';

import '../../core/utils/datetime_utils.dart';
import '../../models/common/note_viewmodel_response.dart';
import '../../models/common/technical_staff_list_model_payload.dart';
import '../../models/installation/update_material_payload.dart';
import '../../models/installation/update_material_response.dart';
import '../../models/repair_request/repair_request_get_modem_log_model_response.dart';
import '../../widgets/dialog/bottom_sheet_widget.dart';
import 'common_installation_step_enum.dart';
import 'widgets/material_selector/material_selector_controller.dart';
import 'widgets/material_selector/material_selector_widget.dart';
import 'widgets/sign_report_file/report_file_item.dart';
import 'widgets/sign_report_file/sign_report_file_data_controller.dart';
import 'widgets/slid_and_divider/slid_and_divider_controller.dart';
import 'widgets/slid_and_divider/slid_and_divider_widget.dart';
import 'widgets/step_1_widget.dart';
import 'widgets/step_2_widget.dart';
import 'widgets/step_3_widget.dart';

abstract class CommonInstallationDetailController<T> extends GetxController {
  final userInfor = Get.find<UserService>().userInfor;

  final currentRxStep = RxInt(1);
  final detailRxData = Rx<T?>(null);

  final reportSelectedIdToSign = RxInt(0);
  final reportFiles = RxList<SignReportFileItemModel>([]);
  final modemReplacementLogs = RxList<RepairRequestGetModemLogModelResponse>(
    [],
  );

  final noteListRxData = RxList<NoteViewmodelResponse>([]);
  final overdueNoteListRxData = RxList<NoteViewmodelResponse>([]);

  final isViewOnlyModeRxData = RxBool(false);

  final noteTextController = MyTextFieldController();
  final overdueNoteTextController = MyTextFieldController();

  final closeNoteTextController = MyTextFieldController();
  final step2NoteTextController = MyTextFieldController();
  final step3NoteTextController = MyTextFieldController();

  final accidentSolutionTextController = MyTextFieldController();
  final accidentDescriptionTextController = MyTextFieldController();

  final cableStartTextController = MyTextFieldController();
  final cableEndTextController = MyTextFieldController();
  final cableDistanceTextController = MyTextFieldController();

  final technicalStaffImageControler = FileCollectionController();
  final technicalStaffTestImageControler = FileCollectionController();
  final technicalStaffModuleImageControler = FileCollectionController();

  final cccdImageController = FileCollectionController();

  final accidentsSelectorController = MySelectorController();

  final reportDividerImageControler = FileCollectionController();
  final reportCableStartImageControler = FileCollectionController();
  final reportCableEndImageControler = FileCollectionController();

  final technicalStaffSelectorController = MySelectorController(
    isNameWithDescription: true,
  );

  final reportTypeSelectorController = MySelectorController();
  final reportDataController = SignReportFileDataController();

  final staffSignatureController = SignatureController();
  final customerSignatureController = SignatureController();

  final materialSelectorController = MaterialSelectorController();

  final slidAndDividerController = SlidAndDividerController();

  final oldModemTextController = MyTextFieldController();
  final newModemTextController = MyTextFieldController();

  final surveyNoteTextController = MyTextFieldController();
  final surveyStatusSelectorController = MySelectorController(
    isNameWithDescription: true,
  );

  T? get detailData => detailRxData.value;

  int? get id;

  int? get countryId;

  int? get provinceId;

  String? get serviceType;

  String? get expectedCompletionDate;

  String? get technicalStaffReportCompletedDate;

  TechnicalStaffListModelPayload get technicalStaffListModelPayload;

  SurveyStatusEnum? get surveyStatus;

  bool get isRefreshValue;

  bool get isRequestClosed;

  bool get isRequestReadyToClose;

  List<RepairRequestGetModemLogModelResponse> get modemLogs;

  void setIsRefreshValue();

  Future getDetailData();

  Future closeRequest(BuildContext context);

  Future assignTechnicalStaff();

  Future updateStep3();

  Future uploadStep4();

  Future addNote();

  Future getNoteList();

  Future addOverdueReason();

  Future getOverdueReasonList();

  Future previewReportFile();

  Future signReportFile();

  Future<List<MySelectorModel>> getReportTypeList();

  Future addModemReplacementLog();

  Future getModemReplacementLog();

  Future completeRquest(BuildContext context);

  Future updateSurveyStatus();

  Future<BaseResponse> deleteMaterialApi(Map<String, dynamic> body);
  Future<BaseResponse<UpdateMaterialResponse>> updateMaterialApi(
    UpdateMaterialPayload body,
  );

  int get currentReportIdToSign => reportSelectedIdToSign.value;

  bool get isReportTaskAgain => currentRxStep.value >= 4;

  dynamic get currentReportIdToPreview =>
      reportTypeSelectorController.first?.id;

  @override
  void onInit() {
    super.onInit();
    reportDataController.completeDateController.dateTime = DateTime.now();
  }

  String getOverdueTime() {
    final result = MyDatetimeUtils.compareDateFromAPI(
      firstDateTime: DateTime.now(),
      secondDateString: expectedCompletionDate,
    );
    if (result > 0) {
      return MyDatetimeUtils.formatDateFromAPI(
            expectedCompletionDate,
            toFormat: MyDateFormatEnum.DATE_TIME24s,
          ) ??
          '';
    }
    return '';
  }

  Widget buildSteps(BuildContext context, {int? step}) {
    switch (step ?? currentRxStep.value) {
      case 1:
        return Column(
          children: [
            getStepContent(
              context,
              isVisible: !isViewOnlyModeRxData.value,
              step: InstallationStepEnum.AssignForStaff,
            ),
          ],
        );
      case 2:
        return Column(
          children: [
            getStepContent(
              context,
              isVisible: !isViewOnlyModeRxData.value,
              step: InstallationStepEnum.MakeAppointment,
            ),
          ],
        );
      case 3:
        return Column(
          children: [
            getStepContent(
              context,
              isVisible:
                  !isViewOnlyModeRxData.value &&
                  surveyStatus != SurveyStatusEnum.Done,
              step: InstallationStepEnum.MakeAppointment,
            ),
            getStepContent(
              context,
              step: InstallationStepEnum.UpdateSurveyStatus,
              isVisible:
                  !isViewOnlyModeRxData.value &&
                  surveyStatus != SurveyStatusEnum.Done,
            ),
            Visibility(
              child: buildSteps(context, step: 4),
              visible: surveyStatus == SurveyStatusEnum.Done,
            ),
          ],
        );
      case 4:
      case 5:
        return Column(
          children: [
            getStepContent(
              context,
              isViewOnly: isViewOnlyModeRxData.value,
              step: InstallationStepEnum.UpdateSlidAndDivider,
              isVisible: serviceType == MBService.NewInstallation,
            ),
            getStepContent(
              context,
              isViewOnly: isViewOnlyModeRxData.value,
              step: InstallationStepEnum.ReplaceModem,
            ),
            getStepContent(
              context,
              isViewOnly: isViewOnlyModeRxData.value,
              step: InstallationStepEnum.UpdateMaterial,
            ),
            getStepContent(
              context,
              isViewOnly: isViewOnlyModeRxData.value,
              step: InstallationStepEnum.InstallAtCustomerHouse,
              isVisible:
                  serviceType == MBService.RepairRequest ||
                  (serviceType == MBService.NewInstallation &&
                      slidAndDividerController.data?.slidCode != null),
            ),
            getStepContent(
              context,
              isViewOnly: isViewOnlyModeRxData.value,
              step: InstallationStepEnum.SignReport,
              isVisible:
                  serviceType == MBService.RepairRequest ||
                  (serviceType == MBService.NewInstallation &&
                      slidAndDividerController.data?.slidCode != null),
            ),
          ],
        );
      default:
        return const SizedBox();
    }
  }

  Widget getStepContent(
    BuildContext context, {
    bool isVisible = true,
    bool isViewOnly = false,
    required InstallationStepEnum step,
  }) {
    if (!isVisible) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsetsGeometry.only(bottom: 15),
      child: _getStepWidget(context, step: step, isViewOnly: isViewOnly),
    );
  }

  Widget _getStepWidget(
    BuildContext context, {
    bool isViewOnly = false,
    required InstallationStepEnum step,
  }) {
    switch (step) {
      case InstallationStepEnum.AssignForStaff:
        return Step1(
          payload: technicalStaffListModelPayload,
          technicalStaffSelectorController: technicalStaffSelectorController,
          onPressed: () {
            if (id == null) {
              return;
            }
            if (!technicalStaffSelectorController.checkValidation()) {
              return;
            }
            MyDialog.alertDialog(
              okHandler: assignTechnicalStaff,
              message: 'Xác nhận chọn nhân viên kỹ thuật ?',
            );
          },
        );
      case InstallationStepEnum.MakeAppointment:
        return Step2(
          notes: noteListRxData,
          step2NoteTextController: step2NoteTextController,
          onPressed: () {
            if (id == null) {
              return;
            }
            if (!step2NoteTextController.checkValidation()) {
              return;
            }
            MyDialog.alertDialog(
              okHandler: updateStep3,
              message: 'Xác nhận đã hẹn khách hàng ?',
            );
          },
        );
      case InstallationStepEnum.InstallAtCustomerHouse:
        return Step3(
          isViewOnly: isViewOnly,
          cableEndTextController: cableEndTextController,
          cableStartTextController: cableStartTextController,
          cableDistanceTextController: cableDistanceTextController,
          isRepairRequest: serviceType == MBService.RepairRequest,
          accidentsSelectorController: accidentsSelectorController,
          reportDividerImageControler: reportDividerImageControler,
          reportCableEndImageControler: reportCableEndImageControler,
          technicalStaffImageControler: technicalStaffImageControler,
          reportCableStartImageControler: reportCableStartImageControler,
          technicalStaffTestImageControler: technicalStaffTestImageControler,
          technicalStaffModuleImageControler:
              technicalStaffModuleImageControler,
          step3NoteTextController: step3NoteTextController,
          accidentSolutionTextController: accidentSolutionTextController,
          accidentDescriptionTextController: accidentDescriptionTextController,
          buttonLabel: isReportTaskAgain ? 'Báo cáo lại CV' : 'Báo cáo CV',
          onPressed: () {
            if (id == null) {
              return;
            }
            if (!accidentsSelectorController.checkValidation() ||
                !accidentDescriptionTextController.checkValidation() ||
                !accidentSolutionTextController.checkValidation() ||
                !step3NoteTextController.checkValidation()) {
              return;
            }
            MyDialog.alertDialog(
              okHandler: uploadStep4,
              message:
                  'Xác nhận báo cáo công việc ? ${isReportTaskAgain ? '\n\nKhi báo cáo lại các biên bản sẽ bị xóa.' : ''}',
            );
          },
        );
      case InstallationStepEnum.SignReport:
        return SignReportFileWidget(
          files: reportFiles,
          isViewOnly: isViewOnly,
          reportDataController: reportDataController,
          getReportTypeList: getReportTypeList,
          staffSignatureController: staffSignatureController,
          reportTypeSelectorController: reportTypeSelectorController,
          reportSelectedIdToSign: reportSelectedIdToSign.value,
          customerSignatureController: customerSignatureController,
          onReportSelected: (value) {
            if (value == null) {
              return;
            }
            reportSelectedIdToSign.value = value;

            staffSignatureController.clear();
            customerSignatureController.clear();

            update();
          },
          previewReportFile: () async {
            if (currentReportIdToPreview == ReportType.BBNT) {
              if (!reportDataController.checkBbntIsValid()) {
                return;
              }
            } else if (currentReportIdToPreview == ReportType.BBBG) {
              if (!reportDataController.checkBbbgIsValid()) {
                return;
              }
            }
            staffSignatureController.clear();
            customerSignatureController.clear();

            reportSelectedIdToSign.value = 0;
            update();

            await previewReportFile();
          },
          signReportFile: () {
            if (staffSignatureController.isEmpty) {
              MyDialog.snackbar(
                'Nhân viên chưa thực hiện ký',
                type: SnackbarType.WARNING,
              );
              return;
            }
            if (customerSignatureController.isEmpty) {
              MyDialog.snackbar(
                'Khách hàng chưa thực hiện ký',
                type: SnackbarType.WARNING,
              );
              return;
            }
            MyDialog.alertDialog(
              okHandler: signReportFile,
              message: 'Xác nhận ký biên bản ?',
            );
          },
        );
      case InstallationStepEnum.AskForHelp:
        return const MyDataState(
          icon: Icons.help_outline,
          message: 'Liên hệ admin hỗ trợ',
        );
      case InstallationStepEnum.UpdateMaterial:
        return MaterialSelectorWidget(
          id: id!,
          isViewOnly: isViewOnly,
          deleteMaterialApi: deleteMaterialApi,
          updateMaterialApi: updateMaterialApi,
          controller: materialSelectorController,
        );
      case InstallationStepEnum.UpdateSlidAndDivider:
        return SlidAndDividerWidget(
          id: id,
          countryId: countryId,
          isViewOnly: isViewOnly,
          provinceId: provinceId,
          controller: slidAndDividerController,
          onSuccess: (response) {
            setIsRefreshValue();
          },
        );
      case InstallationStepEnum.ReplaceModem:
        return ModemReplaceLogWidget(
          modemLogs: modemLogs,
          isViewOnly: isViewOnly,
          oldModemTextController: oldModemTextController,
          newModemTextController: newModemTextController,
          isReplace: serviceType == MBService.RepairRequest,
          onPressed: (isReplace) {
            if (!newModemTextController.checkValidation()) {
              return;
            }
            if (isReplace && !oldModemTextController.checkValidation()) {
              return;
            }
            MyDialog.alertDialog(
              okHandler: addModemReplacementLog,
              message: 'Xác nhận ${isReplace ? 'thay thế' : 'lắp mới'} modem ?',
            );
          },
          onRightIconPressed: () async {
            await getModemReplacementLog();
            MyBottomSheet.showDraggableScrollableSheet(
              context,
              builder: (context, scrollController) {
                return GetBuilder(
                  init: this,
                  builder: (controller) {
                    return ModemReplacementLogListWidget(
                      scrollController: scrollController,
                      modemLogs: controller.modemReplacementLogs,
                    );
                  },
                );
              },
            );
          },
        );
      case InstallationStepEnum.UpdateSurveyStatus:
        return TakeSurverWidget(
          currentStatus: surveyStatus,
          surveyNoteTextController: surveyNoteTextController,
          surveyStatusSelectorController: surveyStatusSelectorController,
          onPressed: () {
            if (!surveyStatusSelectorController.checkValidation()) {
              return;
            }
            if (TakeSurverWidget.getIsNoteRequired(
                  surveyStatusSelectorController.first?.id,
                ) &&
                !surveyNoteTextController.checkValidation()) {
              return;
            }
            MyDialog.alertDialog(
              okHandler: updateSurveyStatus,
              message: 'Xác nhận cập nhật thông tin khảo sát ?',
            );
          },
        );
    }
  }
}
