class Config {
  static final Config _singleton = Config._internal();

  factory Config() {
    return _singleton;
  }

  Config._internal();

  String? _deviceToken;

  Future<String?> get deviceToken async {
    return _deviceToken ?? '1';

    // if (_deviceToken != null) {
    //   return _deviceToken;
    // }
    // final token = await FirebaseMessaging.instance.getToken();
    // _deviceToken = token;

    // return _deviceToken;
  }
}
