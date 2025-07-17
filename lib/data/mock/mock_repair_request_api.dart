import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_base/models/base_response.dart';

import 'package:flutter_base/models/customer/customer_search_response.dart';

import 'package:flutter_base/models/installation/installation_detail_payload.dart';

import 'package:flutter_base/models/installation/installation_list_payload.dart';

import 'package:flutter_base/models/repair_request/repair_request_detail_response.dart';

import 'package:flutter_base/models/repair_request/repair_request_list_response.dart';

import '../../core/utils/jsonc_reader.dart';
import '../repair_request_api.dart';

class MockRepairRequestApi implements RepairRequestApi {
  final Dio dio;

  MockRepairRequestApi(this.dio);

  @override
  Future<BaseResponse> confirmRepairRequest(Map<String, dynamic> body) {
    // TODO: implement confirmRepairRequest
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<RepairRequestDetailResponse>> getRepairRequestDetail(
    InstallationDetailPayload body,
  ) async {
    final data = await JsoncReader.readJsoncFile(
      '.json_models/repair_request_models.jsonc',
    );
    final response = JsoncReader.processJsonc(
      JsoncReader.getInListByKey(data, value: 'repair_request_detail_response'),
    );
    return BaseResponse(
      code: 1,
      data: RepairRequestDetailResponse.fromJson(response),
    );
  }

  @override
  Future<BaseResponse<RepairRequestListResponse>> getRepairRequestList(
    InstallationListPayload body,
  ) async {
    final data = await JsoncReader.readJsoncFile(
      '.json_models/repair_request_models.jsonc',
    );
    final response = JsoncReader.processJsonc(
      JsoncReader.getInListByKey(data, value: 'repair_request_list_response'),
    );
    return BaseResponse(
      code: 1,
      data: RepairRequestListResponse.fromJson(response),
    );
  }

  @override
  Future<BaseResponse<CustomerSearchResponse>> searchCustomer(
    Map<String, dynamic> body,
  ) async {
    throw UnimplementedError();

    // final data = await JsoncReader.readJsoncFile('.json_models/customer.jsonc');
    // final response = JsoncReader.processJsonc(
    //   JsoncReader.getInListByKey(data, value: value),
    // );
    // return BaseResponse(
    //   code: 1,
    //   data: CustomerSearchResponse.fromJson(response),
    // );
  }

  @override
  Future<BaseResponse> updateCustomerRepairRequestNote(
    Map<String, dynamic> body,
  ) {
    // TODO: implement updateCustomerRepairRequestNote
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse> uploadRepairRequestFile({
    required String id,
    required String note,
    File? technicalStaffModuleImage,
    File? technicalStaffTestImage,
    File? technicalStaffImage,
  }) {
    // TODO: implement uploadRepairRequestFile
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse> addTechnicalStaffRepairRequest(
    Map<String, dynamic> body,
  ) {
    // TODO: implement addTechnicalStaffRepairRequest
    throw UnimplementedError();
  }
}
