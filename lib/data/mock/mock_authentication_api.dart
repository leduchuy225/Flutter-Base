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

class MockAuthenticationApi implements AuthenticationApi {
  final Dio dio;

  MockAuthenticationApi(this.dio);

  @override
  Future<BaseResponse> changeAccountInfor(
    ChangeAccountInforPayload body,
  ) async {
    return BaseResponse();
  }

  @override
  Future<BaseResponse> changePassword(ChangePasswordPayload body) async {
    return BaseResponse(code: 1, message: 'Thành công');
  }

  @override
  Future<BaseResponse> checkSmsVertification(
    SmsVertificationPayload body,
  ) async {
    return BaseResponse(code: 1, message: 'Mã OTP đúng');
  }

  @override
  Future<BaseResponse> forgotPassword(ForgotPasswordPayload body) async {
    return BaseResponse(code: 1, message: 'Cấp mật khẩu mới thành công');
  }

  @override
  Future<BaseResponse<SecondFaStatusResponse>> get2FaStatus() async {
    return BaseResponse(
      data: SecondFaStatusResponse(
        status: true,
        barcodeImageUrl:
            'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAKsAAACrAQAAAAAxk1G0AAACw0lEQVR4nOWXMa6kMAyGjVKkgwsgcY10uRJcAIYLDFdKl2tEygVCRxHF+/vNjN4rtljT7EqLpkAfCLB/+7eH+HdHov8bF6Ll4kaGL+qiOQN1enxynd30dJljPkLqIogeh3H1NMTp4Fwc75GWm7iuLnUh4SXHbezMERPZtF34zFuY68aV7LjFcaW0fQevwJLvOH7/fsjw5xhHI+odbbGuNnXfBaHAzVcIxXEkSkSmeN71+Lymp6+El4S02nG2+dTjRqkn5Ns0J/H1dtr1GKVXrCi/Ut0u87Tm1OPmoNU4XGkLdYk08LjoMQfzsGbniUPtfcazWY+LFeVnyo2m4qcjvKLU4WbN0yW01B7q7EfyqbuBHb0UG2IaAs7Tosd8QS4oX4cLWUe+06bHUL5jEsUCruAWPm9gC3fBlbG78kOK2hx6XL6q+Ly4uNzgfFQXPW4eZWiaTQOnmUaxCj2GYZOn2aIp+Uk000t5HW52OqHYBa+CY+HrPsFrcHGwKMSaloiEmT2+WkqH4RBw34HhVQTRdsa5GsOwu5AL4evQCnCsj0NocEGGvEi3XKjl3DCabmAxudrT2Ft0NpF7TRIlJoOOHGLtLlqdlOENzIzIpBWWMM4w7/DqBh0uND0sbZjPcguenQ89hmvOED9MheC+0x7v4JOxqqA1IR3KGcNt7PQYjovCWTFjpZzFRG9hzCKUMz8wYz1qx+x6fKJyRTEob+Q8vOtbhYtDlGKWMN0erol1TI+bT6tPJIU8wTIfn6GrwyTxIUkYKdKg4T1JVBjzWXwXG4flA0OS3lGqMA405UxwiPz0SLZhPS7ilLSKV6GtzWcz1WHsg1gDV4uuyg/5WHPcwEE2jt4iyjqIV70LQo3dl09cJF0eX8rrsSTMYOM4sOHavN/AjL0Jk9mckWaf22dNVGHke7VSfcxffhPv4L/wP+0fx78Aa0wGQKjhbOoAAAAASUVORK5CYII=',
        setupCode: 'GYYTKNJWGM4DQNRYHAYTOMRZGAYDAMBQGAYA',
      ),
    );
  }

  @override
  Future<BaseResponse<AccountInforResponse>> getAccountInfor() async {
    return BaseResponse(
      data: AccountInforResponse(
        email: 'aphonghp7@gmail.com',
        phoneNumber: '',
        address:
            'Thôn 1, Xã Tri Phương, Huyện Trà Lĩnh, Tỉnh Cao Bằng, Việt Nam',
        userName: 'demo4@gmail.com',
        fullName: 'Nguyễn Văn A',
        avatar:
            'http://localhost:44399/Data/images/user/member/6155/avatar/2.webp',
        status: true,
        createdBy: 'emaildemo3@gmail.com',
        createdDate: '/Date(1750483054770)/',
        modifiedDate: '/Date(1750650652267)/',
        modifiedBy: 'emaildemo3@gmail.com',
        gioiTinh: 'khac',
        ngaySinh: null,
        gaStatus: true,
        countryId: 237,
        thanhPhoId: 4,
        quanHuyenId: 46,
        phuongXaId: 1453,
        lastLogin: '/Date(1751253199460)/',
        hasPassword: true,
        shareCode: 'qr6155',
      ),
    );
  }

  @override
  Future<BaseResponse<NewTokenResponse>> getNewToken(
    NewTokenPayload body,
  ) async {
    return BaseResponse(
      data: NewTokenResponse(accessToken: '1', refreshToken: '1'),
    );
  }

  @override
  Future<BaseResponse<LoginResponse>> login(LoginPayload body) async {
    return BaseResponse(
      code: 1,
      data: LoginResponse(accessToken: '1', refreshToken: '1'),
    );
  }

  @override
  Future<BaseResponse<SecondFaStatusResponse>> switch2FaStatus(
    SmsVertificationPayload body,
  ) async {
    return BaseResponse(
      data: SecondFaStatusResponse(
        status: true,
        barcodeImageUrl:
            'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAKsAAACrAQAAAAAxk1G0AAACw0lEQVR4nOWXMa6kMAyGjVKkgwsgcY10uRJcAIYLDFdKl2tEygVCRxHF+/vNjN4rtljT7EqLpkAfCLB/+7eH+HdHov8bF6Ll4kaGL+qiOQN1enxynd30dJljPkLqIogeh3H1NMTp4Fwc75GWm7iuLnUh4SXHbezMERPZtF34zFuY68aV7LjFcaW0fQevwJLvOH7/fsjw5xhHI+odbbGuNnXfBaHAzVcIxXEkSkSmeN71+Lymp6+El4S02nG2+dTjRqkn5Ns0J/H1dtr1GKVXrCi/Ut0u87Tm1OPmoNU4XGkLdYk08LjoMQfzsGbniUPtfcazWY+LFeVnyo2m4qcjvKLU4WbN0yW01B7q7EfyqbuBHb0UG2IaAs7Tosd8QS4oX4cLWUe+06bHUL5jEsUCruAWPm9gC3fBlbG78kOK2hx6XL6q+Ly4uNzgfFQXPW4eZWiaTQOnmUaxCj2GYZOn2aIp+Uk000t5HW52OqHYBa+CY+HrPsFrcHGwKMSaloiEmT2+WkqH4RBw34HhVQTRdsa5GsOwu5AL4evQCnCsj0NocEGGvEi3XKjl3DCabmAxudrT2Ft0NpF7TRIlJoOOHGLtLlqdlOENzIzIpBWWMM4w7/DqBh0uND0sbZjPcguenQ89hmvOED9MheC+0x7v4JOxqqA1IR3KGcNt7PQYjovCWTFjpZzFRG9hzCKUMz8wYz1qx+x6fKJyRTEob+Q8vOtbhYtDlGKWMN0erol1TI+bT6tPJIU8wTIfn6GrwyTxIUkYKdKg4T1JVBjzWXwXG4flA0OS3lGqMA405UxwiPz0SLZhPS7ilLSKV6GtzWcz1WHsg1gDV4uuyg/5WHPcwEE2jt4iyjqIV70LQo3dl09cJF0eX8rrsSTMYOM4sOHavN/AjL0Jk9mckWaf22dNVGHke7VSfcxffhPv4L/wP+0fx78Aa0wGQKjhbOoAAAAASUVORK5CYII=',
        setupCode: 'GYYTKNJWGM4DQNRYHAYTOMRZGAYDAMBQGAYA',
      ),
    );
  }
}
