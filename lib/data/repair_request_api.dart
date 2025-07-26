import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/base_response.dart';
import '../models/common/installation_detail_payload.dart';
import '../models/common/installation_list_payload.dart';
import '../models/repair_request/close_repair_request_response.dart';
import '../models/repair_request/repair_request_detail_response.dart';
import '../models/repair_request/repair_request_list_response.dart';
import '../models/repair_request/update_repair_request_note_response.dart';
import '../models/repair_request/update_repair_request_report_response.dart';
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

  // @POST('/RepairRequest/UpdateCurrentStep_2_1')
  // Future<BaseResponse> confirmRepairRequest(@Body() Map<String, dynamic> body);

  @POST('/RepairRequest/UpdateCurrentStep_3')
  Future<BaseResponse<UpdateRepairRequestNoteResponse>>
  updateCustomerRepairRequestNote(@Body() Map<String, dynamic> body);

  @MultiPart()
  @POST('/RepairRequest/UpdateCurrentStep_4')
  Future<BaseResponse<UpdateRepairRequestReportResponse>>
  uploadRepairRequestFile({
    @Part(name: 'id') required String id,
    @Part(name: 'note') required String note,
    @Part(name: 'technicalStaffModuleImage[0]') File? technicalStaffModuleImage,
    @Part(name: 'technicalStaffTestImage[0]') File? technicalStaffTestImage,
    @Part(name: 'technicalStaffImage[0]') File? technicalStaffImage,
  });
}
