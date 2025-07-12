class CustomerSearchModelResponse {
  int? id;
  int? idLong;
  String? fullName;
  String? birthDay;
  String? avatar;
  String? cccd;
  String? cccdIssue;
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

  CustomerSearchModelResponse({
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
  });

  factory CustomerSearchModelResponse.fromJson(Map<String, dynamic> json) {
    return CustomerSearchModelResponse(
      id: json['ID'] as int?,
      idLong: json['IDLong'] as int?,
      fullName: json['FullName'] as String?,
      birthDay: json['BirthDay'] as String?,
      avatar: json['Avatar'] as String?,
      cccd: json['CCCD'] as String?,
      cccdIssue: json['CCCD_Issue'] as String?,
      cccdFront: json['CCCD_Front'] as String?,
      cccdBack: json['CCCD_Back'] as String?,
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
  };
}
