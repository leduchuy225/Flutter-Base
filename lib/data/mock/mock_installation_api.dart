import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_base/models/base_response.dart';

import 'package:flutter_base/models/installation/installation_detail_payload.dart';

import 'package:flutter_base/models/installation/installation_detail_response.dart';

import 'package:flutter_base/models/installation/installation_list_payload.dart';

import 'package:flutter_base/models/installation/installation_list_response.dart';
import 'package:retrofit/dio.dart';

import '../../core/utils/jsonc_reader.dart';
import '../../models/installation/installation_detail_model_response.dart';
import '../../models/installation/installation_list_model_response.dart';
import '../installation_api.dart';

class MockInstallationApi implements InstallationApi {
  final Dio dio;

  MockInstallationApi(this.dio);

  @override
  Future<BaseResponse<InstallationDetailResponse>> getNewInstallationDetail(
    InstallationDetailPayload body,
  ) async {
    final data = await readJsoncFile(
      '.json_models/installation_models.jsonc',
      index: 3,
    );
    print(data);
    return BaseResponse(
      code: 1,
      data: InstallationDetailResponse(
        model: InstallationDetailModelResponse.fromJson(
          data['model.installation_detail_model_response'],
        ),
      ),
    );
  }

  @override
  Future<BaseResponse<InstallationListResponse>> getNewInstallationList(
    InstallationListPayload body,
  ) async {
    final data = await readJsoncFile(
      '.json_models/installation_models.jsonc',
      index: 2,
    );
    print(data);
    return BaseResponse(
      code: 1,
      data: InstallationListResponse(
        model: (data['model.installation_list_model_response'] as List).map((
          element,
        ) {
          return InstallationListModelResponse.fromJson(element);
        }).toList(),
      ),
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
  ) {
    // TODO: implement updateCustomerNewInstallationNote
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse> uploadNewInstallationFile({
    required String id,
    required String note,
    required File technicalStaffModuleImage,
    required File technicalStaffTestImage,
    required File technicalStaffImage,
  }) {
    // TODO: implement uploadNewInstallationFile
    throw UnimplementedError();
  }
}
