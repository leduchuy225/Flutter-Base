import 'package:flutter/material.dart';
import 'package:flutter_base/core/const/constants.dart';
import 'package:flutter_base/core/services/user_service.dart';
import 'package:flutter_base/models/base_response.dart';
import 'package:flutter_base/models/base_selector.dart';
import 'package:flutter_base/theme/styles.dart';
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
  // final isReportFileSigned = RxBool(false);
  // final previewReportFileLink = RxString('');
  final reportSelectedIdToSign = RxInt(0);
  final reportFiles = RxList<SignReportFileItemModel>([]);

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

  T? get detailData => detailRxData.value;

  int? get id;

  int? get countryId;

  int? get provinceId;

  String? get serviceType;

  String? get expectedCompletionDate;

  TechnicalStaffListModelPayload get technicalStaffListModelPayload;

  bool get isRefreshValue;

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

  Widget buildSteps(BuildContext context) {
    switch (currentRxStep.value) {
      case 3:
        return Column(
          children: [
            getStepContent(context, step: 2),
            AppStyles.pdt15,
            getStepContent(context, step: 7),
            AppStyles.pdt15,
            getStepContent(context, step: 6),
            Visibility(
              visible: slidAndDividerController.data?.slidCode != null,
              child: Padding(
                padding: const EdgeInsetsGeometry.only(top: 15),
                child: getStepContent(context, step: 3),
              ),
            ),
            Visibility(
              visible: slidAndDividerController.data?.slidCode != null,
              child: Padding(
                padding: const EdgeInsetsGeometry.only(top: 15),
                child: getStepContent(context, step: 4),
              ),
            ),
          ],
        );
      case 4:
        if (serviceType == MBService.NewInstallation) {
          return Column(
            children: [
              getStepContent(context, step: 7),
              AppStyles.pdt15,
              getStepContent(context, step: 6),
              Visibility(
                visible: slidAndDividerController.data?.slidCode != null,
                child: Padding(
                  padding: const EdgeInsetsGeometry.only(top: 15),
                  child: getStepContent(context, step: 3),
                ),
              ),
              Visibility(
                visible: slidAndDividerController.data?.slidCode != null,
                child: Padding(
                  padding: const EdgeInsetsGeometry.only(top: 15),
                  child: getStepContent(context, step: 4),
                ),
              ),
            ],
          );
        } else if (serviceType == MBService.RepairRequest) {
          return getStepContent(context, step: 3);
        }
        return const SizedBox();
      default:
        return getStepContent(context, step: currentRxStep.value);
    }
  }

  Widget getStepContent(BuildContext context, {required int step}) {
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
          // isViewOnly: currentRxStep.value > 3,
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
            // if (technicalStaffImageControler.files.isEmpty ||
            //     technicalStaffModuleImageControler.files.isEmpty ||
            //     technicalStaffTestImageControler.files.isEmpty) {
            //   MyDialog.snackbar(
            //     'Chưa chọn đủ loại ảnh',
            //     type: SnackbarType.WARNING,
            //   );
            //   return;
            // }
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
      default:
        return const SizedBox.shrink();
    }
  }
}
