import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/accident/get_accident_list_response.dart';
import '../models/base_response.dart';
import '../models/common/installation_detail_payload.dart';
import '../models/common/installation_list_payload.dart';
import '../models/common/note_list_response.dart';
import '../models/common/update_survey_payload.dart';
import '../models/installation/delete_material_response.dart';
import '../models/installation/installation_report_file_list_response.dart';
import '../models/installation/material_list_response.dart';
import '../models/installation/update_material_payload.dart';
import '../models/installation/update_material_response.dart';
import '../models/installation/view_installation_report_file_payload.dart';
import '../models/installation/view_installation_report_file_response.dart';
import '../models/repair_request/close_repair_request_response.dart';
import '../models/repair_request/repair_request_add_modem_log_payload.dart';
import '../models/repair_request/repair_request_add_modem_log_response.dart';
import '../models/repair_request/repair_request_detail_response.dart';
import '../models/repair_request/repair_request_get_modem_log_response.dart';
import '../models/repair_request/repair_request_list_response.dart';
import '../models/repair_request/update_repair_request_step_3_response.dart';
import '../models/repair_request/update_repair_request_step_4_response.dart';
import '../models/repair_request/update_repair_request_technical_staff_response.dart';

part 'repair_request_api.g.dart';

@RestApi()
abstract class RepairRequestApi {
  factory RepairRequestApi(Dio dio) = _RepairRequestApi;

  @POST('/apiv1/data/findcustomers')
  Future<BaseResponse> searchCustomer(@Body() Map<String, dynamic> body);

  @POST('/RepairRequest/SetPostClosed')
  Future<BaseResponse<CloseRepairRequestResponse>> closeRepairRequest(
    @Body() Map<String, dynamic> body,
  );

  @POST('/repairrequest/loaddata')
  Future<BaseResponse<RepairRequestListResponse>> getRepairRequestList(
    @Body() InstallationListPayload body,
  );

  @POST('/repairrequest/editjson')
  Future<BaseResponse<RepairRequestDetailResponse>> getRepairRequestDetail(
    @Body() InstallationDetailPayload body,
  );

  @POST('/repairrequest/addtechnicalstaff')
  Future<BaseResponse<UpdateRepairRequestTechnicalStaffResponse>>
  addTechnicalStaffRepairRequest(@Body() Map<String, dynamic> body);

  @POST('/RepairRequest/UpdateCurrentStep_3')
  Future<BaseResponse<UpdateRepairRequestStep3Response>>
  updateRepairRequestStep3(@Body() Map<String, dynamic> body);

  @MultiPart()
  @POST('/RepairRequest/UpdateCurrentStep_4')
  Future<BaseResponse<UpdateRepairRequestStep4Response>>
  uploadRepairRequestStep4({
    @Part(name: 'id') required String id,
    @Part(name: 'note') required String note,
    @Part(name: 'technicalStaffModuleImage[0]') File? technicalStaffModuleImage,
    @Part(name: 'technicalStaffTestImage[0]') File? technicalStaffTestImage,
    @Part(name: 'technicalStaffImage[0]') File? technicalStaffImage,
    @Part(name: 'CableLengthStart') String? cableLengthStart,
    @Part(name: 'CableLengthEnd') String? cableLengthEnd,
    @Part(name: 'report_ImageDivider[0]') File? report_ImageDivider,
    @Part(name: 'report_CableLengthStart[0]') File? report_CableLengthStart,
    @Part(name: 'report_CableLengthEnd[0]') File? report_CableLengthEnd,
    @Part(name: 'ListError') String? accidentListString,
    @Part(name: 'TechnicalStaffNote') String? technicalStaffNote,
    @Part(name: 'Report_CorrectionMethod') String? reportCorrectionMethod,
    @Part(name: 'Report_Distance') String? report_Distance,
  });

  @POST('/repairrequest/addnote')
  Future<BaseResponse> addRepairRequestNote(@Body() Map<String, dynamic> body);

  @POST('/repairrequest/getnote')
  Future<BaseResponse<NoteListResponse>> getRepairRequestNoteList(
    @Body() Map<String, dynamic> body,
  );

  @POST('/repairrequest/AddOverdue')
  Future<BaseResponse> addRepairRequestOverdueNote(
    @Body() Map<String, dynamic> body,
  );

  @POST('/repairrequest/GetOverdue')
  Future<BaseResponse<NoteListResponse>> getRepairRequestOverdueNoteList(
    @Body() Map<String, dynamic> body,
  );

  @POST('/RepairRequest/GetReport')
  Future<BaseResponse<InstallationReportFileListResponse>>
  getRepairReportFileList(@Body() Map<String, dynamic> body);

  @POST('/RepairRequest/SetReport')
  Future<BaseResponse<ViewInstallationReportFileResponse>> viewRepairReportFile(
    @Body() ViewInstallationReportFilePayload body,
  );

  @POST('/RepairRequest/DeleteReport')
  Future<BaseResponse> deleteRepairReportFile(
    @Body() ViewInstallationReportFilePayload body,
  );

  @POST('/RepairRequest/GetMaterial')
  Future<BaseResponse<MaterialListResponse>> getMaterial(
    @Body() Map<String, dynamic> body,
  );

  @POST('/RepairRequest/UpdateMaterial')
  Future<BaseResponse<UpdateMaterialResponse>> updateMaterial(
    @Body() UpdateMaterialPayload body,
  );

  @POST('/RepairRequest/DeleteMaterial')
  Future<BaseResponse<DeleteMaterialResponse>> deleteMaterial(
    @Body() Map<String, dynamic> body,
  );

  @POST('/RepairRequest/GetModemLog')
  Future<BaseResponse<RepairRequestGetModemLogResponse>> getModemLog(
    @Body() Map<String, dynamic> body,
  );

  @POST('/RepairRequest/AddModemLog')
  Future<BaseResponse<RepairRequestAddModemLogResponse>> addModemLog(
    @Body() RepairRequestAddModemLogPayload body,
  );

  @POST('/RepairRequest/CompletedStaff')
  Future<BaseResponse> confirmTaskCompletion(@Body() Map<String, dynamic> body);

  @POST('/ListError/GetAll')
  Future<BaseResponse<GetAccidentListResponse>> getListAllAccident();

  @POST('/RepairRequest/UpdateCurrentStep_Survey')
  Future<BaseResponse> updateSurveyStatus(@Body() UpdateSurveyPayload body);
}
