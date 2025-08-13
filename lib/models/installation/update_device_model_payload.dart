class UpdateDeviceModelPayload {
  int? deviceStatus;
  int? oltId;
  dynamic oltIdLong;
  int? ponidId;
  dynamic ponidIdLong;
  int? slidIdLong;
  dynamic dividerIdLong;
  int? devicePort;
  String? deviceAcc;
  String? devicePass;
  int? countryId;
  int? provinceId;

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
      deviceStatus: json['Device_Status'] as int?,
      oltId: json['OLT_ID'] as int?,
      oltIdLong: json['OLT_IDLong'] as dynamic,
      ponidId: json['PONID_ID'] as int?,
      ponidIdLong: json['PONID_IDLong'] as dynamic,
      slidIdLong: json['SLID_IDLong'] as int?,
      dividerIdLong: json['Divider_IDLong'] as dynamic,
      devicePort: json['Device_Port'] as int?,
      deviceAcc: json['Device_ACC'] as String?,
      devicePass: json['Device_Pass'] as String?,
      countryId: json['CountryID'] as int?,
      provinceId: json['ProvinceID'] as int?,
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
