class UpdateDeviceResponse {
  num? deviceStatus;
  num? slidId;
  num? slidIdLong;
  String? slidCode;
  dynamic dividerId;
  dynamic dividerIdLong;
  dynamic dividerCode;
  num? devicePort;
  String? deviceAcc;
  String? devicePass;
  num? oltId;
  num? ponidId;

  UpdateDeviceResponse({
    this.deviceStatus,
    this.slidId,
    this.slidIdLong,
    this.slidCode,
    this.dividerId,
    this.dividerIdLong,
    this.dividerCode,
    this.devicePort,
    this.deviceAcc,
    this.devicePass,
    this.oltId,
    this.ponidId,
  });

  factory UpdateDeviceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDeviceResponse(
      deviceStatus: json['Device_Status'] as num?,
      slidId: json['SLID_ID'] as num?,
      slidIdLong: json['SLID_IDLong'] as num?,
      slidCode: json['SLID_Code'] as String?,
      dividerId: json['Divider_ID'] as dynamic,
      dividerIdLong: json['Divider_IDLong'] as dynamic,
      dividerCode: json['Divider_Code'] as dynamic,
      devicePort: json['Device_Port'] as num?,
      deviceAcc: json['Device_ACC'] as String?,
      devicePass: json['Device_Pass'] as String?,
      oltId: json['OLT_ID'] as num?,
      ponidId: json['PONID_ID'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {
    'Device_Status': deviceStatus,
    'SLID_ID': slidId,
    'SLID_IDLong': slidIdLong,
    'SLID_Code': slidCode,
    'Divider_ID': dividerId,
    'Divider_IDLong': dividerIdLong,
    'Divider_Code': dividerCode,
    'Device_Port': devicePort,
    'Device_ACC': deviceAcc,
    'Device_Pass': devicePass,
    'OLT_ID': oltId,
    'PONID_ID': ponidId,
  };
}
