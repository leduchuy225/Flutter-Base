class LoginResponse {
  String? deviceId;
  String? accessToken;
  int? accessTokenExpiration;
  String? refreshToken;
  int? refreshTokenExpiration;
  String? returnUrl;

  LoginResponse({
    this.deviceId,
    this.accessToken,
    this.accessTokenExpiration,
    this.refreshToken,
    this.refreshTokenExpiration,
    this.returnUrl,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    deviceId: json['DeviceId'] as String?,
    accessToken: json['accessToken'] as String?,
    accessTokenExpiration: json['accessTokenExpiration'] as int?,
    refreshToken: json['refreshToken'] as String?,
    refreshTokenExpiration: json['refreshTokenExpiration'] as int?,
    returnUrl: json['returnUrl'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'DeviceId': deviceId,
    'accessToken': accessToken,
    'accessTokenExpiration': accessTokenExpiration,
    'refreshToken': refreshToken,
    'refreshTokenExpiration': refreshTokenExpiration,
    'returnUrl': returnUrl,
  };
}
