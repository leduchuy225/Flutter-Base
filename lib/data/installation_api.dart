import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_base/models/common/note_list_response.dart';
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
import '../models/installation/sign_installation_report_file_response.dart';
import '../models/installation/update_new_installation_step_3_response.dart';
import '../models/installation/update_new_installation_step_4_response.dart';
import '../models/installation/update_new_installation_technical_staff_response.dart';
import '../models/installation/view_installation_report_file_payload.dart';
import '../models/installation/view_installation_report_file_response.dart';

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

  // @POST('/NewConnectionRequest/UpdateCurrentStep_2_1')
  // Future<BaseResponse> confirmNewInstallation(
  //   @Body() Map<String, dynamic> body,
  // );

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
  Future<BaseResponse<ViewInstallationReportFileResponse>>
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
}
