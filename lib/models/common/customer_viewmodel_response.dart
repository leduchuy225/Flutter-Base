class CustomerViewmodelResponse {
  int? id;
  int? idLong;
  String? fullName;
  String? birthDay;
  dynamic avatar;
  String? cccd;
  dynamic cccdIssue;
  String? cccdFront;
  String? cccdBack;
  String? phoneNumber;
  int? countryId;
  int? provinceId;
  int? districtId;
  int? wardId;
  String? address;
  String? createdBy;
  String? createdDate;
  dynamic deleteStatus;
  dynamic deleteBy;
  dynamic deleteDate;
  dynamic setDefault;
  String? userName;
  String? code;
  String? addressSet;
  String? serviceTitle;
  String? setDate;
  String? staffCode;
  String? staffFullName;
  dynamic contractStatus;
  String? contractStatusTitle;
  String? completionDate;
  String? startDate;
  String? endDate;
  dynamic blockingStatus;
  String? blockingStatusTitle;
  String? codeChDl;
  dynamic serviceId;
  String? address2;
  dynamic countryIdTitle;
  dynamic provinceIdTitle;
  dynamic districtIdTitle;
  dynamic wardIdTitle;
  dynamic createdByEmail;
  dynamic createdByUserName;

  CustomerViewmodelResponse({
    this.id,
    this.idLong,
    this.fullName,
    this.birthDay,
    this.avatar,
    this.cccd,
    this.cccdIssue,
    this.cccdFront,
    this.cccdBack,
    this.phoneNumber,
    this.countryId,
    this.provinceId,
    this.districtId,
    this.wardId,
    this.address,
    this.createdBy,
    this.createdDate,
    this.deleteStatus,
    this.deleteBy,
    this.deleteDate,
    this.setDefault,
    this.userName,
    this.code,
    this.addressSet,
    this.serviceTitle,
    this.setDate,
    this.staffCode,
    this.staffFullName,
    this.contractStatus,
    this.contractStatusTitle,
    this.completionDate,
    this.startDate,
    this.endDate,
    this.blockingStatus,
    this.blockingStatusTitle,
    this.codeChDl,
    this.serviceId,
    this.address2,
    this.countryIdTitle,
    this.provinceIdTitle,
    this.districtIdTitle,
    this.wardIdTitle,
    this.createdByEmail,
    this.createdByUserName,
  });

  factory CustomerViewmodelResponse.fromJson(Map<String, dynamic> json) {
    return CustomerViewmodelResponse(
      id: json['ID'] as int?,
      idLong: json['IDLong'] as int?,
      fullName: json['FullName'] as String?,
      birthDay: json['BirthDay'] as String?,
      avatar: json['Avatar'] as dynamic,
      cccd: json['CCCD'] as String?,
      cccdIssue: json['CCCD_Issue'] as dynamic,
      cccdFront: json['CCCD_Front'] as dynamic,
      cccdBack: json['CCCD_Back'] as dynamic,
      phoneNumber: json['PhoneNumber'] as String?,
      countryId: json['CountryID'] as int?,
      provinceId: json['ProvinceID'] as int?,
      districtId: json['DistrictID'] as int?,
      wardId: json['WardID'] as int?,
      address: json['Address'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] as String?,
      deleteStatus: json['DeleteStatus'] as dynamic,
      deleteBy: json['DeleteBy'] as dynamic,
      deleteDate: json['DeleteDate'] as dynamic,
      setDefault: json['SetDefault'] as dynamic,
      userName: json['UserName'] as String?,
      code: json['Code'] as String?,
      addressSet: json['AddressSet'] as String?,
      serviceTitle: json['ServiceTitle'] as String?,
      setDate: json['SetDate'] as String?,
      staffCode: json['StaffCode'] as String?,
      staffFullName: json['StaffFullName'] as String?,
      contractStatus: json['ContractStatus'] as dynamic,
      contractStatusTitle: json['ContractStatusTitle'] as String?,
      completionDate: json['CompletionDate'] as String?,
      startDate: json['StartDate'] as String?,
      endDate: json['EndDate'] as String?,
      blockingStatus: json['BlockingStatus'] as dynamic,
      blockingStatusTitle: json['BlockingStatusTitle'] as String?,
      codeChDl: json['CodeChDl'] as String?,
      serviceId: json['ServiceID'] as dynamic,
      address2: json['Address2'] as String?,
      countryIdTitle: json['CountryID_Title'] as dynamic,
      provinceIdTitle: json['ProvinceID_Title'] as dynamic,
      districtIdTitle: json['DistrictID_Title'] as dynamic,
      wardIdTitle: json['WardID_Title'] as dynamic,
      createdByEmail: json['CreatedBy_Email'] as dynamic,
      createdByUserName: json['CreatedBy_UserName'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
    'ID': id,
    'IDLong': idLong,
    'FullName': fullName,
    'BirthDay': birthDay,
    'Avatar': avatar,
    'CCCD': cccd,
    'CCCD_Issue': cccdIssue,
    'CCCD_Front': cccdFront,
    'CCCD_Back': cccdBack,
    'PhoneNumber': phoneNumber,
    'CountryID': countryId,
    'ProvinceID': provinceId,
    'DistrictID': districtId,
    'WardID': wardId,
    'Address': address,
    'CreatedBy': createdBy,
    'CreatedDate': createdDate,
    'DeleteStatus': deleteStatus,
    'DeleteBy': deleteBy,
    'DeleteDate': deleteDate,
    'SetDefault': setDefault,
    'UserName': userName,
    'Code': code,
    'AddressSet': addressSet,
    'ServiceTitle': serviceTitle,
    'SetDate': setDate,
    'StaffCode': staffCode,
    'StaffFullName': staffFullName,
    'ContractStatus': contractStatus,
    'ContractStatusTitle': contractStatusTitle,
    'CompletionDate': completionDate,
    'StartDate': startDate,
    'EndDate': endDate,
    'BlockingStatus': blockingStatus,
    'BlockingStatusTitle': blockingStatusTitle,
    'CodeChDl': codeChDl,
    'ServiceID': serviceId,
    'Address2': address2,
    'CountryID_Title': countryIdTitle,
    'ProvinceID_Title': provinceIdTitle,
    'DistrictID_Title': districtIdTitle,
    'WardID_Title': wardIdTitle,
    'CreatedBy_Email': createdByEmail,
    'CreatedBy_UserName': createdByUserName,
  };
}
