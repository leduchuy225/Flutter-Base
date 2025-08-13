class SlidListModelResponse {
  int? id;
  int? idLong;
  String? code;
  int? oltId;
  int? oltIdLong;
  dynamic oltCode;
  int? ponidId;
  int? ponidIdLong;
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
  int? provinceId;

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
      id: json['ID'] as int?,
      idLong: json['IDLong'] as int?,
      code: json['Code'] as String?,
      oltId: json['OLT_ID'] as int?,
      oltIdLong: json['OLT_IDLong'] as int?,
      oltCode: json['OLT_Code'] as dynamic,
      ponidId: json['PONID_ID'] as int?,
      ponidIdLong: json['PONID_IDLong'] as int?,
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
      provinceId: json['ProvinceID'] as int?,
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
