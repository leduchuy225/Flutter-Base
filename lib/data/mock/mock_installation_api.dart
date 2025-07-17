import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_base/models/base_response.dart';

import 'package:flutter_base/models/installation/installation_detail_payload.dart';

import 'package:flutter_base/models/installation/installation_detail_response.dart';

import 'package:flutter_base/models/installation/installation_list_payload.dart';

import 'package:flutter_base/models/installation/installation_list_response.dart';
import 'package:flutter_base/models/installation/technical_staff_list_payload.dart';
import 'package:flutter_base/models/installation/technical_staff_list_response.dart';
import 'package:flutter_base/models/installation/update_new_installation_note_response.dart';
import 'package:flutter_base/models/installation/update_new_installation_report_response.dart';
import 'package:flutter_base/models/installation/update_new_installation_technical_staff_response.dart';

import '../../core/utils/jsonc_reader.dart';
import '../installation_api.dart';

class MockInstallationApi implements InstallationApi {
  final Dio dio;

  MockInstallationApi(this.dio);

  @override
  Future<BaseResponse<InstallationDetailResponse>> getNewInstallationDetail(
    InstallationDetailPayload body,
  ) async {
    final data = await JsoncReader.readJsoncFile(
      '.json_models/installation_models.jsonc',
    );
    final response = JsoncReader.processJsonc(
      JsoncReader.getInListByKey(data, value: 'installation_detail_response'),
    );
    return BaseResponse(
      code: 1,
      data: InstallationDetailResponse.fromJson(response),
    );
  }

  @override
  Future<BaseResponse<InstallationListResponse>> getNewInstallationList(
    InstallationListPayload body,
  ) async {
    final data = await JsoncReader.readJsoncFile(
      '.json_models/installation_models.jsonc',
    );
    final response = JsoncReader.processJsonc(
      JsoncReader.getInListByKey(data, value: 'installation_list_response'),
    );
    return BaseResponse(
      code: 1,
      data: InstallationListResponse.fromJson(response),
    );
  }

  @override
  Future<BaseResponse<TechnicalStaffListResponse>> getTechnicalStaffList(
    TechnicalStaffListPayload body,
  ) async {
    final data = await JsoncReader.readJsoncFile(
      '.json_models/installation_models.jsonc',
    );
    final response = JsoncReader.processJsonc(
      JsoncReader.getInListByKey(data, value: 'technical_staff_list_response'),
    );
    return BaseResponse(
      code: 1,
      data: TechnicalStaffListResponse.fromJson(response),
    );
  }

  @override
  Future<BaseResponse<UpdateNewInstallationTechnicalStaffResponse>>
  addTechnicalStaffNewInstallation(Map<String, dynamic> body) {
    // TODO: implement addTechnicalStaffNewInstallation
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<UpdateNewInstallationNoteResponse>>
  updateCustomerNewInstallationNote(Map<String, dynamic> body) {
    // TODO: implement updateCustomerNewInstallationNote
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<UpdateNewInstallationReportResponse>>
  uploadNewInstallationFile({
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
