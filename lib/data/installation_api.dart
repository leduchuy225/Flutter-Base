import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_base/models/common/note_list_response.dart';
import 'package:flutter_base/models/common/update_survey_payload.dart';
import 'package:flutter_base/models/installation/delete_material_response.dart';
import 'package:flutter_base/models/installation/update_material_response.dart';
import 'package:retrofit/retrofit.dart';

import '../models/base_response.dart';
import '../models/common/installation_detail_payload.dart';
import '../models/common/installation_list_payload.dart';
import '../models/common/technical_staff_list_payload.dart';
import '../models/common/technical_staff_list_response.dart';
import '../models/installation/close_new_installation_response.dart';
import '../models/installation/installation_detail_response.dart';
import '../models/installation/installation_list_response.dart';
import '../models/installation/installation_report_file_list_response.dart';
import '../models/installation/material_list_response.dart';
import '../models/installation/sign_installation_report_file_response.dart';
import '../models/installation/slid_list_and_divider_list_payload.dart';
import '../models/installation/slid_list_and_divider_list_response.dart';
import '../models/installation/update_device_payload.dart';
import '../models/installation/update_device_response.dart';
import '../models/installation/update_material_payload.dart';
import '../models/installation/update_new_installation_step_3_response.dart';
import '../models/installation/update_new_installation_step_4_response.dart';
import '../models/installation/update_new_installation_technical_staff_response.dart';
import '../models/installation/view_installation_report_file_payload.dart';
import '../models/repair_request/repair_request_add_modem_log_payload.dart';
import '../models/repair_request/repair_request_add_modem_log_response.dart';
import '../models/repair_request/repair_request_get_modem_log_response.dart';

part 'installation_api.g.dart';

@RestApi()
abstract class InstallationApi {
  factory InstallationApi(Dio dio) = _InstallationApi;

  @POST('/newconnectionrequest/SetPostClosed')
  Future<BaseResponse<CloseNewInstallationResponse>> closeNewInstallation(
    @Body() Map<String, dynamic> body,
  );

  @POST('/NewConnectionRequest/LoadData')
  Future<BaseResponse<InstallationListResponse>> getNewInstallationList(
    @Body() InstallationListPayload body,
  );

  @POST('/NewConnectionRequest/editjson')
  Future<BaseResponse<InstallationDetailResponse>> getNewInstallationDetail(
    @Body() InstallationDetailPayload body,
  );

  @POST('/apiv1/data/getlisttechnicalstaff')
  Future<BaseResponse<TechnicalStaffListResponse>> getTechnicalStaffList(
    @Body() TechnicalStaffListPayload body,
  );

  @POST('/NewConnectionRequest/addtechnicalstaff')
  Future<BaseResponse<UpdateNewInstallationTechnicalStaffResponse>>
  addTechnicalStaffNewInstallation(@Body() Map<String, dynamic> body);

  @POST('/NewConnectionRequest/UpdateCurrentStep_3')
  Future<BaseResponse<UpdateNewInstallationStep3Response>>
  updateNewInstallationStep3(@Body() Map<String, dynamic> body);

  @MultiPart()
  @POST('/NewConnectionRequest/UpdateCurrentStep_4')
  Future<BaseResponse<UpdateNewInstallationStep4Response>>
  uploadNewInstallationStep4({
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
    @Part(name: 'Report_Distance') String? report_Distance,
  });

  @POST('/newconnectionrequest/addnote')
  Future<BaseResponse> addNewInstallationNote(
    @Body() Map<String, dynamic> body,
  );

  @POST('/newconnectionrequest/getnote')
  Future<BaseResponse<NoteListResponse>> getNewInstallationNoteList(
    @Body() Map<String, dynamic> body,
  );

  @POST('/newconnectionrequest/AddOverdue')
  Future<BaseResponse> addNewInstallationOverdueNote(
    @Body() Map<String, dynamic> body,
  );

  @POST('/newconnectionrequest/GetOverdue')
  Future<BaseResponse<NoteListResponse>> getNewInstallationOverdueNoteList(
    @Body() Map<String, dynamic> body,
  );

  @POST('/newconnectionrequest/GetReport')
  Future<BaseResponse<InstallationReportFileListResponse>>
  getInstallationReportFileList(@Body() Map<String, dynamic> body);

  @POST('/newconnectionrequest/SetReport')
  Future<BaseResponse<SignInstallationReportFileResponse>>
  viewInstallationReportFile(@Body() ViewInstallationReportFilePayload body);

  @MultiPart()
  @POST('/newconnectionrequest/SignReport')
  Future<BaseResponse<SignInstallationReportFileResponse>>
  signInstallationReportFile({
    @Part(name: 'id') required String id,
    @Part(name: 'type') required String type,
    @Part(name: 'customersSign[0]') File? customersSign,
    @Part(name: 'technicalStaffSign[0]') File? technicalStaffSign,
  });

  @POST('/newconnectionrequest/getupdatedevice')
  Future<BaseResponse<SlidListAndDividerListResponse>> getUpdateDevice(
    @Body() SlidListAndDividerListPayload body,
  );

  @POST('/newconnectionrequest/updatedevice')
  Future<BaseResponse<UpdateDeviceResponse>> updateDevice(
    @Body() UpdateDevicePayload body,
  );

  @POST('/newconnectionrequest/GetMaterial')
  Future<BaseResponse<MaterialListResponse>> getMaterial(
    @Body() Map<String, dynamic> body,
  );

  @POST('/newconnectionrequest/UpdateMaterial')
  Future<BaseResponse<UpdateMaterialResponse>> updateMaterial(
    @Body() UpdateMaterialPayload body,
  );

  @POST('/newconnectionrequest/DeleteMaterial')
  Future<BaseResponse<DeleteMaterialResponse>> deleteMaterial(
    @Body() Map<String, dynamic> body,
  );

  @POST('/newconnectionrequest/GetModemLog')
  Future<BaseResponse<RepairRequestGetModemLogResponse>> getModemLog(
    @Body() Map<String, dynamic> body,
  );

  @POST('/newconnectionrequest/AddModemLog')
  Future<BaseResponse<RepairRequestAddModemLogResponse>> addModemLog(
    @Body() RepairRequestAddModemLogPayload body,
  );

  @POST('/newconnectionrequest/CompletedStaff')
  Future<BaseResponse> confirmTaskCompletion(@Body() Map<String, dynamic> body);

  @POST('/newconnectionrequest/UpdateCurrentStep_Survey')
  Future<BaseResponse> updateSurveyStatus(@Body() UpdateSurveyPayload body);
}
