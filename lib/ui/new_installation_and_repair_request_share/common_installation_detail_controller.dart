import 'package:flutter/material.dart';
import 'package:flutter_base/core/const/constants.dart';
import 'package:flutter_base/core/services/user_service.dart';
import 'package:flutter_base/models/base_response.dart';
import 'package:flutter_base/models/base_selector.dart';
import 'package:flutter_base/ui/new_installation_and_repair_request_share/widgets/modem_replace_log_widget.dart';
import 'package:flutter_base/ui/new_installation_and_repair_request_share/widgets/sign_report_file/sign_report_file_widget.dart';
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
  final int totalSteps = 5;

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

  final noteTextController = MyTextFieldController();
  final overdueNoteTextController = MyTextFieldController();

  final closeNoteTextController = MyTextFieldController();
  final step2NoteTextController = MyTextFieldController();
  final step3NoteTextController = MyTextFieldController();

  final cableStartTextController = MyTextFieldController();
  final cableEndTextController = MyTextFieldController();

  final technicalStaffImageControler = FileCollectionController();
  final technicalStaffTestImageControler = FileCollectionController();
  final technicalStaffModuleImageControler = FileCollectionController();

  final reportDividerImageControler = FileCollectionController();
  final reportCableStartImageControler = FileCollectionController();
  final reportCableEndImageControler = FileCollectionController();

  final technicalStaffSelectController = MySelectorController();

  final reportTypeListController = MySelectorController();
  final reportController = SignReportFileDataController();

  final staffSignatureController = SignatureController();
  final customerSignatureController = SignatureController();

  final materialSelectorController = MaterialSelectorController();

  final slidAndDividerController = SlidAndDividerController();

  final oldModemTextController = MyTextFieldController();
  final newModemTextController = MyTextFieldController();

  T? get detailData => detailRxData.value;

  int? get id;

  int? get countryId;

  int? get provinceId;

  String? get serviceType;

  String? get expectedCompletionDate;

  TechnicalStaffListModelPayload get technicalStaffListModelPayload;

  bool get isRefreshValue;

  bool get isRequestClosed;

  bool get isRequestReadyToClose;

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

  Future completeRquest(BuildContext context);

  Future<BaseResponse> deleteMaterialApi(Map<String, dynamic> body);
  Future<BaseResponse<UpdateMaterialResponse>> updateMaterialApi(
    UpdateMaterialPayload body,
  );

  int get currentReportIdToSign => reportSelectedIdToSign.value;
  dynamic get currentReportIdToPreview => reportTypeListController.first?.id;

  @override
  void onInit() {
    super.onInit();
    reportController.completeDateController.dateTime = DateTime.now();
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
          children: [getStepContent(context, step: 1, isVisible: !isClosed)],
        );
      case 2:
        return Column(
          children: [getStepContent(context, step: 2, isVisible: !isClosed)],
        );
      case 3:
        return Column(
          children: [
            getStepContent(context, step: 2, isVisible: !isClosed),
            buildSteps(context, step: 4),
          ],
        );
      case 4:
        return Column(
          children: [
            getStepContent(
              context,
              step: 7,
              isVisible: serviceType == MBService.NewInstallation,
            ),
            getStepContent(
              context,
              step: 8,
              isVisible: serviceType == MBService.RepairRequest,
            ),
            getStepContent(context, step: 6),
            getStepContent(
              context,
              step: 3,
              isVisible:
                  serviceType == MBService.RepairRequest ||
                  (serviceType == MBService.NewInstallation &&
                      slidAndDividerController.data?.slidCode != null),
            ),
            getStepContent(
              context,
              step: 4,
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
    required int step,
    bool isVisible = true,
  }) {
    if (!isVisible) {
      return const SizedBox.shrink();
    }
    return Padding(
      child: _getStepWidget(context, step: step),
      padding: const EdgeInsetsGeometry.only(bottom: 15),
    );
  }

  Widget _getStepWidget(BuildContext context, {required int step}) {
    switch (step) {
      case 1:
        return Step1(
          payload: technicalStaffListModelPayload,
          technicalStaffSelectController: technicalStaffSelectController,
          onPressed: () {
            if (id == null) {
              return;
            }
            if (!technicalStaffSelectController.checkIsNotEmpty()) {
              return;
            }
            MyDialog.alertDialog(
              okHandler: assignTechnicalStaff,
              message: 'Xác nhận chọn nhân viên kỹ thuật ?',
            );
          },
        );
      case 2:
        return Step2(
          step2NoteTextController: step2NoteTextController,
          onPressed: () {
            if (id == null) {
              return;
            }
            if (!step2NoteTextController.checkIsNotEmpty()) {
              return;
            }
            MyDialog.alertDialog(
              okHandler: updateStep3,
              message: 'Xác nhận đã hẹn khách hàng ?',
            );
          },
        );
      case 3:
        return Step3(
          // isViewOnly: isClosed,
          cableEndTextController: cableEndTextController,
          cableStartTextController: cableStartTextController,
          reportDividerImageControler: reportDividerImageControler,
          reportCableEndImageControler: reportCableEndImageControler,
          technicalStaffImageControler: technicalStaffImageControler,
          reportCableStartImageControler: reportCableStartImageControler,
          technicalStaffTestImageControler: technicalStaffTestImageControler,
          technicalStaffModuleImageControler:
              technicalStaffModuleImageControler,
          step3NoteTextController: step3NoteTextController,
          onPressed: () {
            if (id == null) {
              return;
            }
            if (!step3NoteTextController.checkIsNotEmpty()) {
              return;
            }
            MyDialog.alertDialog(
              okHandler: uploadStep4,
              message: 'Xác nhận báo cáo công việc ?',
            );
          },
        );
      case 4:
        return SignReportFileWidget(
          files: reportFiles,
          reportController: reportController,
          getReportTypeList: getReportTypeList,
          staffSignatureController: staffSignatureController,
          reportTypeListController: reportTypeListController,
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
              if (!reportController.checkBbntIsValid()) {
                return;
              }
            } else if (currentReportIdToPreview == ReportType.BBBG) {
              if (!reportController.checkBbbgIsValid()) {
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
      case 5:
        return const MyDataState(
          icon: Icons.help_outline,
          message: 'Liên hệ admin hỗ trợ',
        );
      case 6:
        return MaterialSelectorWidget(
          id: id!,
          deleteMaterialApi: deleteMaterialApi,
          updateMaterialApi: updateMaterialApi,
          controller: materialSelectorController,
        );
      case 7:
        return SlidAndDividerWidget(
          id: id,
          countryId: countryId,
          provinceId: provinceId,
          controller: slidAndDividerController,
          onSuccess: (response) {
            setIsRefreshValue();
          },
        );
      case 8:
        return ModemReplaceLogWidget(
          oldModemTextController: oldModemTextController,
          newModemTextController: newModemTextController,
          onPressed: () {
            if (!oldModemTextController.checkIsNotEmpty() ||
                !newModemTextController.checkIsNotEmpty()) {
              return;
            }
            MyDialog.alertDialog(
              okHandler: addModemReplacementLog,
              message: 'Xác nhận thay thế modem ?',
            );
          },
          onRightIconPressed: () {
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
      default:
        return const SizedBox.shrink();
    }
  }
}
