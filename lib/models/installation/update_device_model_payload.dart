class UpdateDeviceModelPayload {
  num? deviceStatus;
  num? oltId;
  dynamic oltIdLong;
  num? ponidId;
  dynamic ponidIdLong;
  num? slidIdLong;
  dynamic dividerIdLong;
  num? devicePort;
  String? deviceAcc;
  String? devicePass;
  num? countryId;
  num? provinceId;

  UpdateDeviceModelPayload({
    this.deviceStatus,
    this.oltId,
    this.oltIdLong,
    this.ponidId,
    this.ponidIdLong,
    this.slidIdLong,
    this.dividerIdLong,
    this.devicePort,
    this.deviceAcc,
    this.devicePass,
    this.countryId,
    this.provinceId,
  });

  factory UpdateDeviceModelPayload.fromJson(Map<String, dynamic> json) {
    return UpdateDeviceModelPayload(
      deviceStatus: json['Device_Status'] as num?,
      oltId: json['OLT_ID'] as num?,
      oltIdLong: json['OLT_IDLong'] as dynamic,
      ponidId: json['PONID_ID'] as num?,
      ponidIdLong: json['PONID_IDLong'] as dynamic,
      slidIdLong: json['SLID_IDLong'] as num?,
      dividerIdLong: json['Divider_IDLong'] as dynamic,
      devicePort: json['Device_Port'] as num?,
      deviceAcc: json['Device_ACC'] as String?,
      devicePass: json['Device_Pass'] as String?,
      countryId: json['CountryID'] as num?,
      provinceId: json['ProvinceID'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {
    'Device_Status': deviceStatus,
    'OLT_ID': oltId,
    'OLT_IDLong': oltIdLong,
    'PONID_ID': ponidId,
    'PONID_IDLong': ponidIdLong,
    'SLID_IDLong': slidIdLong,
    'Divider_IDLong': dividerIdLong,
    'Device_Port': devicePort,
    'Device_ACC': deviceAcc,
    'Device_Pass': devicePass,
    'CountryID': countryId,
    'ProvinceID': provinceId,
  };
}
