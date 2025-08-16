import 'package:firebase_messaging/firebase_messaging.dart';

class MyStrings {
  MyStrings._();

  static const String systemError = 'Hệ thống đang gặp lỗi';
  static const String connectionOff =
      'Mất kết nối internet. Vui lòng kiểm tra lại mạng';
  static const String noData = 'Không có dữ liệu hiển thị';

  static const String noInput = 'Thông tin không được để trống';

  static const String baseURL =
      'https://mbf.hig.asia'; // 'https://jsonplaceholder.typicode.com';
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
}

class Config {
  static const pageSizeDefault = 20;

  static final Config _singleton = Config._internal();

  factory Config() {
    return _singleton;
  }

  Config._internal();

  String? _deviceToken;

  Future<String?> get deviceToken async {
    if (_deviceToken != null) {
      return _deviceToken;
    }
    final token = await FirebaseMessaging.instance.getToken();
    _deviceToken = token;

    return _deviceToken;
  }
}
