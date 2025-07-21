import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/base_response.dart';
import '../models/installation/close_new_installation_response.dart';
import '../models/installation/installation_detail_payload.dart';
import '../models/installation/installation_detail_response.dart';
import '../models/installation/installation_list_payload.dart';
import '../models/installation/installation_list_response.dart';
import '../models/installation/technical_staff_list_payload.dart';
import '../models/installation/technical_staff_list_response.dart';
import '../models/installation/update_new_installation_note_response.dart';
import '../models/installation/update_new_installation_report_response.dart';
import '../models/installation/update_new_installation_technical_staff_response.dart';

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
  Future<BaseResponse<UpdateNewInstallationNoteResponse>>
  updateCustomerNewInstallationNote(@Body() Map<String, dynamic> body);

  @MultiPart()
  @POST('/NewConnectionRequest/UpdateCurrentStep_4')
  Future<BaseResponse<UpdateNewInstallationReportResponse>>
  uploadNewInstallationFile({
    @Part(name: 'id') required String id,
    @Part(name: 'note') required String note,
    @Part(name: 'technicalStaffModuleImage[0]') File? technicalStaffModuleImage,
    @Part(name: 'technicalStaffTestImage[0]') File? technicalStaffTestImage,
    @Part(name: 'technicalStaffImage[0]') File? technicalStaffImage,
  });
}
