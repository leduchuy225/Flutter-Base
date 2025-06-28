import 'package:flutter_base/core/services/cache_service.dart';

import 'shared_preference_service.dart';

class UserService {
  UserService._();

  static Future<String> get accessToken async {
    return SharedPreference.getStringValuesSF(SharedPreference.accessToken);
  }

  static Future<String> get refreshToken async {
    return SharedPreference.getStringValuesSF(SharedPreference.refreshToken);
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

  static Future<void> getNewTokens() async {}

  static Future<void> logOut() async {
    CacheService().clear();
    SharedPreference.removePrefs();
  }
}
