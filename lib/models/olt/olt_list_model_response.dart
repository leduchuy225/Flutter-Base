class OltListModelResponse {
  int? id;
  int? idLong;
  String? code;
  String? createdBy;
  String? createdDate;
  String? modifiedBy;
  String? modifiedDate;
  bool? deleteStatus;
  dynamic deleteBy;
  dynamic deleteDate;
  bool? status;
  dynamic setDefault;
  dynamic googleMap;
  dynamic title;
  String? createdByEmail;
  String? createdByUserName;

  OltListModelResponse({
    this.id,
    this.idLong,
    this.code,
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

  factory OltListModelResponse.fromJson(Map<String, dynamic> json) {
    return OltListModelResponse(
      id: json['ID'] as int?,
      idLong: json['IDLong'] as int?,
      code: json['Code'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] as String?,
      modifiedBy: json['ModifiedBy'] as String?,
      modifiedDate: json['ModifiedDate'] as String?,
      deleteStatus: json['DeleteStatus'] as bool?,
      deleteBy: json['DeleteBy'] as dynamic,
      deleteDate: json['DeleteDate'] as dynamic,
      status: json['Status'] as bool?,
      setDefault: json['SetDefault'] as dynamic,
      googleMap: json['GoogleMap'] as dynamic,
      title: json['Title'] as dynamic,
      createdByEmail: json['CreatedBy_Email'] as String?,
      createdByUserName: json['CreatedBy_UserName'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'ID': id,
    'IDLong': idLong,
    'Code': code,
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
