class SlidListModelResponse {
  num? id;
  num? idLong;
  String? code;
  num? oltId;
  num? oltIdLong;
  dynamic oltCode;
  num? ponidId;
  num? ponidIdLong;
  dynamic ponidCode;
  String? createdBy;
  String? createdDate;
  dynamic modifiedBy;
  dynamic modifiedDate;
  bool? deleteStatus;
  dynamic deleteBy;
  dynamic deleteDate;
  bool? status;
  dynamic setDefault;
  dynamic googleMap;
  dynamic title;
  bool? isOnline;
  num? provinceId;

  SlidListModelResponse({
    this.id,
    this.idLong,
    this.code,
    this.oltId,
    this.oltIdLong,
    this.oltCode,
    this.ponidId,
    this.ponidIdLong,
    this.ponidCode,
    this.createdBy,
    this.createdDate,
    this.modifiedBy,
    this.modifiedDate,
    this.deleteStatus,
    this.deleteBy,
    this.deleteDate,
    this.status,
    this.setDefault,
    this.googleMap,
    this.title,
    this.isOnline,
    this.provinceId,
  });

  factory SlidListModelResponse.fromJson(Map<String, dynamic> json) {
    return SlidListModelResponse(
      id: json['ID'] as num?,
      idLong: json['IDLong'] as num?,
      code: json['Code'] as String?,
      oltId: json['OLT_ID'] as num?,
      oltIdLong: json['OLT_IDLong'] as num?,
      oltCode: json['OLT_Code'] as dynamic,
      ponidId: json['PONID_ID'] as num?,
      ponidIdLong: json['PONID_IDLong'] as num?,
      ponidCode: json['PONID_Code'] as dynamic,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] as String?,
      modifiedBy: json['ModifiedBy'] as dynamic,
      modifiedDate: json['ModifiedDate'] as dynamic,
      deleteStatus: json['DeleteStatus'] as bool?,
      deleteBy: json['DeleteBy'] as dynamic,
      deleteDate: json['DeleteDate'] as dynamic,
      status: json['Status'] as bool?,
      setDefault: json['SetDefault'] as dynamic,
      googleMap: json['GoogleMap'] as dynamic,
      title: json['Title'] as dynamic,
      isOnline: json['IsOnline'] as bool?,
      provinceId: json['ProvinceID'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {
    'ID': id,
    'IDLong': idLong,
    'Code': code,
    'OLT_ID': oltId,
    'OLT_IDLong': oltIdLong,
    'OLT_Code': oltCode,
    'PONID_ID': ponidId,
    'PONID_IDLong': ponidIdLong,
    'PONID_Code': ponidCode,
    'CreatedBy': createdBy,
    'CreatedDate': createdDate,
    'ModifiedBy': modifiedBy,
    'ModifiedDate': modifiedDate,
    'DeleteStatus': deleteStatus,
    'DeleteBy': deleteBy,
    'DeleteDate': deleteDate,
    'Status': status,
    'SetDefault': setDefault,
    'GoogleMap': googleMap,
    'Title': title,
    'IsOnline': isOnline,
    'ProvinceID': provinceId,
  };
}
