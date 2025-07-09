import 'package:dio/dio.dart';
import 'package:flutter_base/models/base_response.dart';

import 'package:flutter_base/models/installation/installation_detail_payload.dart';

import 'package:flutter_base/models/installation/installation_detail_response.dart';

import 'package:flutter_base/models/installation/installation_list_payload.dart';

import 'package:flutter_base/models/installation/installation_list_response.dart';

import '../../core/utils/jsonc_reader.dart';
import '../../models/installation/installation_list_model_response.dart';
import '../../models/installation/role_response.dart';
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
      data: InstallationDetailResponse.fromJson(data),
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
    return BaseResponse(code: 1, data: InstallationListResponse.fromJson(data));
  }
}
