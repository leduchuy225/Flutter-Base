import 'package:flutter_base/core/const/config.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/core/services/cache_service.dart';
import 'package:flutter_base/models/authentication/account_infor_response.dart';
import 'package:flutter_base/models/authentication/login_payload.dart';
import 'package:flutter_base/ui/authentication/otp_screen.dart';
import 'package:flutter_base/ui/main_screen.dart';
import 'package:flutter_base/ui/splash_screen.dart';
import 'package:get/get.dart';

import '../../data/authentication_api.dart';
import '../../models/authentication/new_token_payload.dart';
import '../../widgets/dialog/dialog_widget.dart';
import 'shared_preference_service.dart';

class UserService extends GetxController {
  final _userInfor = Rx<AccountInforResponse?>(null);

  void updateUserInfor(AccountInforResponse? value) {
    _userInfor.value = value;
  }

  AccountInforResponse? get userInfor {
    return _userInfor.value;
  }

  Future<bool> updateUserInforFromAPI({
    bool isNavigateToMain = false,
    bool isShowErrorMessage = false,
  }) async {
    final data = await Get.find<AuthenticationApi>().getAccountInfor().callApi(
      isShowSuccessMessage: false,
      isShowErrorMessage: isShowErrorMessage,
    );
    if (data.data == null) {
      return false;
    }
    updateUserInfor(data.data);
    if (isNavigateToMain) {
      Get.offAll(() => MainScreen());
    }
    return true;
  }

  static Future<String> get accessToken async {
    return SharedPreference.getStringValuesSF(SharedPreference.accessToken);
  }

  static Future<String> get refreshToken async {
    return SharedPreference.getStringValuesSF(SharedPreference.refreshToken);
  }

  static Future<void> login(LoginPayload payload) async {
    final data = await Get.find<AuthenticationApi>()
        .login(payload)
        .callApi(isShowSuccessMessage: false);

    if (data.isError) {
      return;
    }

    await UserService.saveTokens(
      accessToken: data.data?.accessToken,
      refreshToken: data.data?.refreshToken,
    );

    Get.to(() => const OtpScreen());
  }

  static Future<void> saveTokens({
    String? accessToken,
    String? refreshToken,
  }) async {
    if (accessToken != null) {
      await SharedPreference.addStringToSF(
        SharedPreference.accessToken,
        accessToken,
      );
    }
    if (refreshToken != null) {
      await SharedPreference.addStringToSF(
        SharedPreference.refreshToken,
        refreshToken,
      );
    }
  }

  static Future<bool> getNewTokens() async {
    final deviceToken = await Config().deviceToken;
    final refreshToken = await UserService.refreshToken;

    if (refreshToken.isEmpty) {
      return false;
    }

    final data = await Get.find<AuthenticationApi>()
        .getNewToken(
          NewTokenPayload(deviceId: deviceToken, refreshToken: refreshToken),
        )
        .callApi();

    if (data.isError) {
      return false;
    }

    await UserService.saveTokens(
      accessToken: data.data?.accessToken,
      refreshToken: data.data?.refreshToken,
    );

    return true;
  }

  void logOut() {
    MyDialog.alertDialog(
      title: 'Xác nhận',
      message: 'Bạn muốn đăng xuất ứng dụng ?',
      okHandler: () async {
        updateUserInfor(null);
        CacheService().clear();
        await SharedPreference.removePrefs();

        Get.offAll(() => const SplashScreen());
      },
    );
  }
}
