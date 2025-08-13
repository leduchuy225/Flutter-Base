class OltListModelResponse {
  int? id;
  int? idLong;
  String? code;
  dynamic createdBy;
  dynamic createdDate;
  dynamic modifiedBy;
  dynamic modifiedDate;
  dynamic deleteStatus;
  dynamic deleteBy;
  dynamic deleteDate;
  dynamic status;
  dynamic setDefault;
  dynamic googleMap;
  dynamic title;
  dynamic provinceId;
  dynamic createdByEmail;
  dynamic createdByUserName;
  dynamic provinceIdTitle;

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
    this.provinceId,
    this.createdByEmail,
    this.createdByUserName,
    this.provinceIdTitle,
  });

  factory OltListModelResponse.fromJson(Map<String, dynamic> json) {
    return OltListModelResponse(
      id: json['ID'] as int?,
      idLong: json['IDLong'] as int?,
      code: json['Code'] as String?,
      createdBy: json['CreatedBy'] as dynamic,
      createdDate: json['CreatedDate'] as dynamic,
      modifiedBy: json['ModifiedBy'] as dynamic,
      modifiedDate: json['ModifiedDate'] as dynamic,
      deleteStatus: json['DeleteStatus'] as dynamic,
      deleteBy: json['DeleteBy'] as dynamic,
      deleteDate: json['DeleteDate'] as dynamic,
      status: json['Status'] as dynamic,
      setDefault: json['SetDefault'] as dynamic,
      googleMap: json['GoogleMap'] as dynamic,
      title: json['Title'] as dynamic,
      provinceId: json['ProvinceID'] as dynamic,
      createdByEmail: json['CreatedBy_Email'] as dynamic,
      createdByUserName: json['CreatedBy_UserName'] as dynamic,
      provinceIdTitle: json['ProvinceID_Title'] as dynamic,
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
    'ProvinceID': provinceId,
    'CreatedBy_Email': createdByEmail,
    'CreatedBy_UserName': createdByUserName,
    'ProvinceID_Title': provinceIdTitle,
  };
}
