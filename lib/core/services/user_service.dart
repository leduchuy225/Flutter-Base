import 'package:flutter_base/core/const/config.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/core/services/cache_service.dart';
import 'package:flutter_base/models/authentication/account_infor_response.dart';
import 'package:flutter_base/models/authentication/login_payload.dart';
import 'package:flutter_base/ui/authentication/otp_screen.dart';
import 'package:get/get.dart';

import '../../data/authentication_api.dart';
import '../../models/authentication/new_token_payload.dart';
import 'shared_preference_service.dart';

class UserService extends GetxController {
  final _userInformation = Rx<AccountInforResponse?>(null);

  void updateUserInformation(AccountInforResponse value) {
    _userInformation.value = value;
  }

  AccountInforResponse? get userInformation {
    return _userInformation.value;
  }

  static Future<String> get accessToken async {
    return SharedPreference.getStringValuesSF(SharedPreference.accessToken);
  }

  static Future<String> get refreshToken async {
    return SharedPreference.getStringValuesSF(SharedPreference.refreshToken);
  }

  static Future<void> login(LoginPayload payload) async {
    final data = await Get.find<AuthenticationApi>().login(payload).callApi();
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

  static Future<void> logOut() async {
    CacheService().clear();
    SharedPreference.removePrefs();
  }
}
