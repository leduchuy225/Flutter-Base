import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/base_response.dart';
import '../models/customer/customer_search_response.dart';
import '../models/installation/installation_detail_payload.dart';
import '../models/installation/installation_list_payload.dart';
import '../models/repair_request/repair_request_detail_response.dart';
import '../models/repair_request/repair_request_list_response.dart';

part 'repair_request_api.g.dart';

@RestApi()
abstract class RepairRequestApi {
  factory RepairRequestApi(Dio dio) = _RepairRequestApi;

  @POST('/apiv1/data/findcustomers')
  Future<BaseResponse<CustomerSearchResponse>> searchCustomer(
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
  Future<BaseResponse> addTechnicalStaffRepairRequest(
    @Body() Map<String, dynamic> body,
  );

  @POST('/RepairRequest/UpdateCurrentStep_2_1')
  Future<BaseResponse> confirmRepairRequest(@Body() Map<String, dynamic> body);

  @POST('/RepairRequest/UpdateCurrentStep_3')
  Future<BaseResponse> updateCustomerRepairRequestNote(
    @Body() Map<String, dynamic> body,
  );

  @MultiPart()
  @POST('/RepairRequest/UpdateCurrentStep_4')
  Future<BaseResponse> uploadRepairRequestFile({
    @Part(name: 'id') required String id,
    @Part(name: 'note') required String note,
    @Part(name: 'technicalStaffModuleImage[0]') File? technicalStaffModuleImage,
    @Part(name: 'technicalStaffTestImage[0]') File? technicalStaffTestImage,
    @Part(name: 'technicalStaffImage[0]') File? technicalStaffImage,
  });
}
