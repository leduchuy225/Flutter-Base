class SlidListModelResponse {
  int? id;
  int? idLong;
  String? code;
  int? oltId;
  int? oltIdLong;
  String? oltCode;
  int? ponidId;
  int? ponidIdLong;
  String? ponidCode;
  dynamic createdBy;
  String? createdDate;
  dynamic modifiedBy;
  dynamic modifiedDate;
  dynamic deleteStatus;
  dynamic deleteBy;
  dynamic deleteDate;
  bool? status;
  dynamic setDefault;
  String? googleMap;
  dynamic title;
  String? createdByEmail;
  String? createdByUserName;

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
    this.createdByEmail,
    this.createdByUserName,
  });

  factory SlidListModelResponse.fromJson(Map<String, dynamic> json) {
    return SlidListModelResponse(
      id: json['ID'] as int?,
      idLong: json['IDLong'] as int?,
      code: json['Code'] as String?,
      oltId: json['OLT_ID'] as int?,
      oltIdLong: json['OLT_IDLong'] as int?,
      oltCode: json['OLT_Code'] as String?,
      ponidId: json['PONID_ID'] as int?,
      ponidIdLong: json['PONID_IDLong'] as int?,
      ponidCode: json['PONID_Code'] as String?,
      createdBy: json['CreatedBy'] as dynamic,
      createdDate: json['CreatedDate'] as String?,
      modifiedBy: json['ModifiedBy'] as dynamic,
      modifiedDate: json['ModifiedDate'] as dynamic,
      deleteStatus: json['DeleteStatus'] as dynamic,
      deleteBy: json['DeleteBy'] as dynamic,
      deleteDate: json['DeleteDate'] as dynamic,
      status: json['Status'] as bool?,
      setDefault: json['SetDefault'] as dynamic,
      googleMap: json['GoogleMap'] as String?,
      title: json['Title'] as dynamic,
      createdByEmail: json['CreatedBy_Email'] as String?,
      createdByUserName: json['CreatedBy_UserName'] as String?,
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
    'CreatedBy_Email': createdByEmail,
    'CreatedBy_UserName': createdByUserName,
  };
}
