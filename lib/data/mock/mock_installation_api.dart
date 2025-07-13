import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_base/models/base_response.dart';

import 'package:flutter_base/models/installation/installation_detail_payload.dart';

import 'package:flutter_base/models/installation/installation_detail_response.dart';

import 'package:flutter_base/models/installation/installation_list_payload.dart';

import 'package:flutter_base/models/installation/installation_list_response.dart';

import '../../core/utils/jsonc_reader.dart';
import '../installation_api.dart';

class MockInstallationApi implements InstallationApi {
  final Dio dio;

  MockInstallationApi(this.dio);

  @override
  Future<BaseResponse<InstallationDetailResponse>> getNewInstallationDetail(
    InstallationDetailPayload body,
  ) async {
    final data = await readJsoncFile('.json_models/installation_models.jsonc');
    final response = processJsonc(data[3]);
    return BaseResponse(
      code: 1,
      data: InstallationDetailResponse.fromJson(response),
    );
  }

  @override
  Future<BaseResponse<InstallationListResponse>> getNewInstallationList(
    InstallationListPayload body,
  ) async {
    final data = await readJsoncFile('.json_models/installation_models.jsonc');
    final response = processJsonc(data[2]);
    return BaseResponse(
      code: 1,
      data: InstallationListResponse.fromJson(response),
    );
  }

  @override
  Future<BaseResponse> confirmNewInstallation(Map<String, dynamic> body) {
    // TODO: implement confirmNewInstallation
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse> updateCustomerNewInstallationNote(
    Map<String, dynamic> body,
  ) async {
    return BaseResponse(code: 1);
  }

  @override
  Future<BaseResponse> uploadNewInstallationFile({
    required String id,
    required String note,
    File? technicalStaffModuleImage,
    File? technicalStaffTestImage,
    File? technicalStaffImage,
  }) {
    // TODO: implement uploadNewInstallationFile
    throw UnimplementedError();
  }
}
