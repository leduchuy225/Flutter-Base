import 'package:dio/dio.dart';
import 'package:flutter_base/models/authentication/account_infor_response.dart';

import 'package:flutter_base/models/authentication/change_account_infor_payload.dart';

import 'package:flutter_base/models/authentication/change_password_payload.dart';

import 'package:flutter_base/models/authentication/forgot_password_payload.dart';

import 'package:flutter_base/models/authentication/login_payload.dart';

import 'package:flutter_base/models/authentication/login_response.dart';

import 'package:flutter_base/models/authentication/new_token_payload.dart';

import 'package:flutter_base/models/authentication/new_token_response.dart';

import 'package:flutter_base/models/authentication/second_fa_status_response.dart';

import 'package:flutter_base/models/authentication/sms_vertification_payload.dart';

import 'package:flutter_base/models/base_response.dart';

import '../authentication_api.dart';

class MockAuthenticationApi extends AuthenticationApi {
  factory MockAuthenticationApi(Dio dio) {
    return MockAuthenticationApi(dio);
  }

  @override
  Future<BaseResponse> changeAccountInfor(
    ChangeAccountInforPayload body,
  ) async {
    return BaseResponse();
  }

  @override
  Future<BaseResponse> changePassword(ChangePasswordPayload body) async {
    return BaseResponse();
  }

  @override
  Future<BaseResponse> checkSmsVertification(
    SmsVertificationPayload body,
  ) async {
    return BaseResponse();
  }

  @override
  Future<BaseResponse> forgotPassword(ForgotPasswordPayload body) async {
    return BaseResponse();
  }

  @override
  Future<BaseResponse<SecondFaStatusResponse>> get2FaStatus() async {
    return BaseResponse();
  }

  @override
  Future<BaseResponse<AccountInforResponse>> getAccountInfor() async {
    return BaseResponse();
  }

  @override
  Future<BaseResponse<NewTokenResponse>> getNewToken(
    NewTokenPayload body,
  ) async {
    return BaseResponse();
  }

  @override
  Future<BaseResponse<LoginResponse>> login(LoginPayload body) async {
    return BaseResponse();
  }

  @override
  Future<BaseResponse<SecondFaStatusResponse>> switch2FaStatus(
    SmsVertificationPayload body,
  ) async {
    return BaseResponse();
  }
}
