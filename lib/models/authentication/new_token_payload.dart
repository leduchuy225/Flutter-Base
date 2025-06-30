class NewTokenPayload {
  String? refreshToken;
  String? deviceId;

  NewTokenPayload({this.refreshToken, this.deviceId});

  factory NewTokenPayload.fromJson(Map<String, dynamic> json) {
    return NewTokenPayload(
      refreshToken: json['RefreshToken'] as String?,
      deviceId: json['DeviceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'RefreshToken': refreshToken,
    'DeviceId': deviceId,
  };
}
