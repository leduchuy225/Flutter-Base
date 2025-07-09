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
import 'package:flutter_base/models/base_response.dart';
import 'package:retrofit/retrofit.dart';

import '../models/authentication/sms_vertification_payload.dart';

part 'authentication_api.g.dart';

@RestApi()
abstract class AuthenticationApi {
  factory AuthenticationApi(Dio dio) = _AuthenticationApi;

  @POST('/GAuthAuthenticator')
  Future<BaseResponse<SecondFaStatusResponse>> switch2FaStatus(
    @Body() SmsVertificationPayload body,
  );

  @POST('/login')
  Future<BaseResponse<LoginResponse>> login(@Body() LoginPayload body);

  @POST('/Login/_LogOff')
  Future<BaseResponse> logout();

  @POST('/Setting/APIChangePassword')
  Future<BaseResponse> changePassword(@Body() ChangePasswordPayload body);

  @POST('/login/GetAccessToken')
  Future<BaseResponse<NewTokenResponse>> getNewToken(
    @Body() NewTokenPayload body,
  );

  @POST('/GAuthAuthenticator/LoadData')
  Future<BaseResponse<SecondFaStatusResponse>> get2FaStatus();

  @POST('/login/ForgotPassword')
  Future<BaseResponse> forgotPassword(@Body() ForgotPasswordPayload body);

  @POST('/Setting/UpdateUserInfo')
  Future<BaseResponse> changeAccountInfor(
    @Body() ChangeAccountInforPayload body,
  );

  @POST('/Setting/GetUserInfo')
  Future<BaseResponse<AccountInforResponse>> getAccountInfor();

  @POST('/gauthauthenticator/check')
  Future<BaseResponse> checkSmsVertification(
    @Body() SmsVertificationPayload body,
  );
}
