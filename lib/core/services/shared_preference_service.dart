// class SharedPreferenceService {
//   SharedPreferenceService._();
// }

// import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  SharedPreference._();

  static SharedPreferences? prefs;

  static String username = 'username';
  static String accessToken = 'accessToken';
  static String refreshToken = 'refreshToken';
  // static String userInformation = 'userInformation';

  // static String dataListKey = 'dataListKey';

  // static Future<void> addData(Map<String, String> data) async {
  //   prefs = await SharedPreferences.getInstance();
  //   final List<String> dataList = prefs?.getStringList(dataListKey) ?? [];
  //   dataList.add(jsonEncode(data));
  //   await prefs!.setStringList(dataListKey, dataList);
  // }

  // static Future<List<Map<String, String>>> getDataList() async {
  //   prefs = await SharedPreferences.getInstance();
  //   final List<String> dataList = prefs?.getStringList(dataListKey) ?? [];
  //   return dataList
  //       .map((data) => Map<String, String>.from(jsonDecode(data)))
  //       .toList();
  // }

  // static Future<void> clearDataList() async {
  //   prefs = await SharedPreferences.getInstance();
  //   await prefs!.remove(dataListKey);
  // }

  static Future<void> addStringToSF(String key, String value) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString(key, value);
  }

  static Future<void> addIntToSF(String key, int value) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setInt(key, value);
  }

  static Future<void> addBoolToSF(String key, bool value) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setBool(key, value);
  }

  static Future<String> getStringValuesSF(String key) async {
    prefs = await SharedPreferences.getInstance();
    final String? getString = prefs!.getString(key);
    return (getString != null) ? getString : '';
  }

  static Future<int> getIntValuesSF(String key) async {
    prefs = await SharedPreferences.getInstance();
    final int? getString = prefs!.getInt(key);
    return (getString != null) ? getString : 0;
  }

  static Future<bool> getBoolValuesSF(String key) async {
    prefs = await SharedPreferences.getInstance();
    final bool? getbool = prefs!.getBool(key);
    return (getbool != null) ? getbool : false;
  }

  static Future<bool> removeValues(String key) async {
    prefs = await SharedPreferences.getInstance();
    return await prefs!.remove(key);
  }

  static dynamic containsKey(String key) async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.get(key);
  }

  static Future<bool> removePrefs() async {
    prefs = await SharedPreferences.getInstance();
    return await prefs!.clear();
  }
}
