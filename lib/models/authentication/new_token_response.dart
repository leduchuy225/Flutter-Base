class NewTokenResponse {
  String? deviceId;
  String? accessToken;
  int? accessTokenExpiration;
  String? refreshToken;
  int? refreshTokenExpiration;

  NewTokenResponse({
    this.deviceId,
    this.accessToken,
    this.accessTokenExpiration,
    this.refreshToken,
    this.refreshTokenExpiration,
  });

  factory NewTokenResponse.fromJson(Map<String, dynamic> json) {
    return NewTokenResponse(
      deviceId: json['DeviceId'] as String?,
      accessToken: json['accessToken'] as String?,
      accessTokenExpiration: json['accessTokenExpiration'] as int?,
      refreshToken: json['refreshToken'] as String?,
      refreshTokenExpiration: json['refreshTokenExpiration'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'DeviceId': deviceId,
    'accessToken': accessToken,
    'accessTokenExpiration': accessTokenExpiration,
    'refreshToken': refreshToken,
    'refreshTokenExpiration': refreshTokenExpiration,
  };
}
