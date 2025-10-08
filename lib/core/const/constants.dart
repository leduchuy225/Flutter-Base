import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:get/get.dart';

import '../../data/common_api.dart';

class MyStrings {
  MyStrings._();

  static const String systemError = 'Hệ thống đang gặp lỗi';
  static const String connectionOff =
      'Mất kết nối internet. Vui lòng kiểm tra lại mạng';
  static const String noData = 'Không có dữ liệu hiển thị';

  static const String noInput = 'Thông tin không được để trống';

  static const String baseURL = 'https://ktmobifiber.mobifone5.vn';
  // 'https://mbf.hig.asia'; // 'https://jsonplaceholder.typicode.com';

  static const String appointmentPrefix = 'ĐẶT HẸN:';
}

class MyStatus {
  MyStatus._();

  static const int error = 0;
  static const int success = 1;
  static const int tokenTimeOut = 3;
  static const int notAuthenticate2Fa = 8;
}

class MBService {
  MBService._();

  static const RepairRequest = 'MB_RepairRequest';
  static const NewInstallation = 'MB_NewConnectionRequest';
}

class ReportType {
  ReportType._();

  static const BBNT = 1;
  static const BBBG = 2;
  static const BBKM = 3;
  static const BBSC = 4;
  static const BBReplaceModem = 5;
}

class Config {
  static const pageSizeDefault = 20;

  static final Config _singleton = Config._internal();

  factory Config() {
    return _singleton;
  }

  Config._internal();

  String? _deviceToken;
  String? _googleMapURL;

  bool get isProductionMode {
    return const String.fromEnvironment('ENV') == 'PROD';
  }

  bool get isDevMode {
    return !isProductionMode;
  }

  Future<String?> get deviceToken async {
    if (_deviceToken != null) {
      return _deviceToken;
    }
    try {
      final token = await FirebaseMessaging.instance.getToken();
      _deviceToken = token;
    } catch (_) {
      _deviceToken = '';
    }

    return _deviceToken;
  }

  Future<String?> get googleMapURL async {
    if (_googleMapURL != null) {
      return _googleMapURL;
    }

    final response = await Get.find<CommonApi>()
        .getGeneralInformation()
        .callApi(isShowSuccessMessage: false);

    _googleMapURL = response.data?.model?.firstOrNull?.mbLinkGoogleMapFiber;

    return _googleMapURL;
  }
}
