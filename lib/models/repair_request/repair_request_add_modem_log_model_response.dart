class RepairRequestAddModemLogModelResponse {
  int? id;
  dynamic idLong;
  dynamic parentId;
  dynamic parentIdLong;
  dynamic parentType;
  dynamic userId;
  String? setDate;
  String? modemOld;
  String? modemNew;
  dynamic status;
  dynamic orders;
  dynamic createdBy;
  dynamic createdDate;
  dynamic modifiedDate;
  dynamic modifiedBy;
  dynamic deleteStatus;
  dynamic deleteBy;
  dynamic deleteDate;
  dynamic setDefault;
  dynamic createdByEmail;
  dynamic createdByUserName;
  dynamic modifiedByEmail;
  dynamic modifiedByUserName;
  String? userIdEmail;
  String? userIdUserName;

  RepairRequestAddModemLogModelResponse({
    this.id,
    this.idLong,
    this.parentId,
    this.parentIdLong,
    this.parentType,
    this.userId,
    this.setDate,
    this.modemOld,
    this.modemNew,
    this.status,
    this.orders,
    this.createdBy,
    this.createdDate,
    this.modifiedDate,
    this.modifiedBy,
    this.deleteStatus,
    this.deleteBy,
    this.deleteDate,
    this.setDefault,
    this.createdByEmail,
    this.createdByUserName,
    this.modifiedByEmail,
    this.modifiedByUserName,
    this.userIdEmail,
    this.userIdUserName,
  });

  factory RepairRequestAddModemLogModelResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return RepairRequestAddModemLogModelResponse(
      id: json['ID'] as int?,
      idLong: json['IDLong'] as dynamic,
      parentId: json['ParentID'] as dynamic,
      parentIdLong: json['ParentIDLong'] as dynamic,
      parentType: json['ParentType'] as dynamic,
      userId: json['UserId'] as dynamic,
      setDate: json['SetDate'] as String?,
      modemOld: json['ModemOld'] as String?,
      modemNew: json['ModemNew'] as String?,
      status: json['Status'] as dynamic,
      orders: json['Orders'] as dynamic,
      createdBy: json['CreatedBy'] as dynamic,
      createdDate: json['CreatedDate'] as dynamic,
      modifiedDate: json['ModifiedDate'] as dynamic,
      modifiedBy: json['ModifiedBy'] as dynamic,
      deleteStatus: json['DeleteStatus'] as dynamic,
      deleteBy: json['DeleteBy'] as dynamic,
      deleteDate: json['DeleteDate'] as dynamic,
      setDefault: json['SetDefault'] as dynamic,
      createdByEmail: json['CreatedBy_Email'] as dynamic,
      createdByUserName: json['CreatedBy_UserName'] as dynamic,
      modifiedByEmail: json['ModifiedBy_Email'] as dynamic,
      modifiedByUserName: json['ModifiedBy_UserName'] as dynamic,
      userIdEmail: json['UserId_Email'] as String?,
      userIdUserName: json['UserId_UserName'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'ID': id,
    'IDLong': idLong,
    'ParentID': parentId,
    'ParentIDLong': parentIdLong,
    'ParentType': parentType,
    'UserId': userId,
    'SetDate': setDate,
    'ModemOld': modemOld,
    'ModemNew': modemNew,
    'Status': status,
    'Orders': orders,
    'CreatedBy': createdBy,
    'CreatedDate': createdDate,
    'ModifiedDate': modifiedDate,
    'ModifiedBy': modifiedBy,
    'DeleteStatus': deleteStatus,
    'DeleteBy': deleteBy,
    'DeleteDate': deleteDate,
    'SetDefault': setDefault,
    'CreatedBy_Email': createdByEmail,
    'CreatedBy_UserName': createdByUserName,
    'ModifiedBy_Email': modifiedByEmail,
    'ModifiedBy_UserName': modifiedByUserName,
    'UserId_Email': userIdEmail,
    'UserId_UserName': userIdUserName,
  };
}
