class LoginPayload {
  String? taiKhoan;
  String? password;
  String? deviceId;

  LoginPayload({this.taiKhoan, this.password, this.deviceId});

  factory LoginPayload.fromJson(Map<String, dynamic> json) => LoginPayload(
    taiKhoan: json['TaiKhoan'] as String?,
    password: json['Password'] as String?,
    deviceId: json['DeviceId'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'TaiKhoan': taiKhoan,
    'Password': password,
    'DeviceId': deviceId,
  };
}
