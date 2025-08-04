import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_base/models/base_response.dart';
import 'package:flutter_base/models/common/installation_detail_payload.dart';
import 'package:flutter_base/models/common/installation_list_payload.dart';
import 'package:flutter_base/models/common/note_list_response.dart';
import 'package:flutter_base/models/common/technical_staff_list_payload.dart';
import 'package:flutter_base/models/common/technical_staff_list_response.dart';
import 'package:flutter_base/models/installation/close_new_installation_response.dart';
import 'package:flutter_base/models/installation/installation_detail_response.dart';
import 'package:flutter_base/models/installation/installation_list_response.dart';
import 'package:flutter_base/models/installation/installation_report_file_list_response.dart';
import 'package:flutter_base/models/installation/sign_installation_report_file_response.dart';
import 'package:flutter_base/models/installation/update_new_installation_step_3_response.dart';
import 'package:flutter_base/models/installation/update_new_installation_step_4_response.dart';
import 'package:flutter_base/models/installation/update_new_installation_technical_staff_response.dart';
import 'package:flutter_base/models/installation/view_installation_report_file_payload.dart';
import 'package:flutter_base/models/installation/view_installation_report_file_response.dart';

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
    if (body.searchDefault?.page == 3) {
      return BaseResponse(code: 1, data: InstallationListResponse(model: []));
    }

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
    print(response);
    return BaseResponse(
      code: 1,
      data: TechnicalStaffListResponse.fromJson(response),
    );
  }

  @override
  Future<BaseResponse<UpdateNewInstallationTechnicalStaffResponse>>
  addTechnicalStaffNewInstallation(Map<String, dynamic> body) async {
    return BaseResponse(
      code: 1,
      data: UpdateNewInstallationTechnicalStaffResponse(currentStep: 2),
    );
  }

  @override
  Future<BaseResponse<UpdateNewInstallationStep3Response>>
  updateNewInstallationStep3(Map<String, dynamic> body) async {
    return BaseResponse(
      code: 1,
      data: UpdateNewInstallationStep3Response(currentStep: 3),
    );
  }

  @override
  Future<BaseResponse<UpdateNewInstallationStep4Response>>
  uploadNewInstallationStep4({
    required String id,
    required String note,
    File? technicalStaffModuleImage,
    File? technicalStaffTestImage,
    File? technicalStaffImage,
  }) {
    // TODO: implement uploadNewInstallationStep4
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<CloseNewInstallationResponse>> closeNewInstallation(
    Map<String, dynamic> body,
  ) async {
    final data = await JsoncReader.readJsoncFile(
      '.json_models/installation_models.jsonc',
    );
    final response = JsoncReader.processJsonc(
      JsoncReader.getInListByKey(
        data,
        value: 'close_new_installation_response',
      ),
    );
    print(response);
    return BaseResponse(
      code: 1,
      data: CloseNewInstallationResponse.fromJson(response),
    );
  }

  @override
  Future<BaseResponse> addNewInstallationNote(Map<String, dynamic> body) async {
    return BaseResponse(code: 1, message: 'Thành công');
  }

  @override
  Future<BaseResponse> addNewInstallationOverdueNote(
    Map<String, dynamic> body,
  ) async {
    return BaseResponse(code: 1, message: 'Thành công');
  }

  @override
  Future<BaseResponse<NoteListResponse>> getNewInstallationNoteList(
    Map<String, dynamic> body,
  ) async {
    final data = await JsoncReader.readJsoncFile(
      '.json_models/installation_models.jsonc',
    );
    final response = JsoncReader.processJsonc(
      JsoncReader.getInListByKey(data, value: 'note_list_response'),
    );
    return BaseResponse(code: 1, data: NoteListResponse.fromJson(response));
  }

  @override
  Future<BaseResponse<NoteListResponse>> getNewInstallationOverdueNoteList(
    Map<String, dynamic> body,
  ) async {
    final data = await JsoncReader.readJsoncFile(
      '.json_models/installation_models.jsonc',
    );
    final response = JsoncReader.processJsonc(
      JsoncReader.getInListByKey(data, value: 'note_list_response'),
    );
    return BaseResponse(code: 1, data: NoteListResponse.fromJson(response));
  }

  @override
  Future<BaseResponse<InstallationReportFileListResponse>>
  getInstallationReportFileList(Map<String, dynamic> body) {
    // TODO: implement getInstallationReportFileList
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<SignInstallationReportFileResponse>>
  signInstallationReportFile({
    required String id,
    required String type,
    File? customersSign,
    File? technicalStaffSign,
  }) {
    // TODO: implement signInstallationReportFile
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<ViewInstallationReportFileResponse>>
  viewInstallationReportFile(ViewInstallationReportFilePayload body) {
    // TODO: implement viewInstallationReportFile
    throw UnimplementedError();
  }
}
