class AccountInforResponse {
  String? email;
  String? phoneNumber;
  String? address;
  String? userName;
  String? fullName;
  String? avatar;
  bool? status;
  String? createdBy;
  String? createdDate;
  String? modifiedDate;
  String? modifiedBy;
  String? gioiTinh;
  dynamic ngaySinh;
  bool? gaStatus;
  int? countryId;
  int? thanhPhoId;
  int? quanHuyenId;
  int? phuongXaId;
  String? lastLogin;
  bool? hasPassword;
  String? shareCode;

  AccountInforResponse({
    this.email,
    this.phoneNumber,
    this.address,
    this.userName,
    this.fullName,
    this.avatar,
    this.status,
    this.createdBy,
    this.createdDate,
    this.modifiedDate,
    this.modifiedBy,
    this.gioiTinh,
    this.ngaySinh,
    this.gaStatus,
    this.countryId,
    this.thanhPhoId,
    this.quanHuyenId,
    this.phuongXaId,
    this.lastLogin,
    this.hasPassword,
    this.shareCode,
  });

  factory AccountInforResponse.fromJson(Map<String, dynamic> json) {
    return AccountInforResponse(
      email: json['Email'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
      address: json['Address'] as String?,
      userName: json['UserName'] as String?,
      fullName: json['FullName'] as String?,
      avatar: json['Avatar'] as String?,
      status: json['Status'] as bool?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] as String?,
      modifiedDate: json['ModifiedDate'] as String?,
      modifiedBy: json['ModifiedBy'] as String?,
      gioiTinh: json['GioiTinh'] as String?,
      ngaySinh: json['NgaySinh'] as dynamic,
      gaStatus: json['GA_Status'] as bool?,
      countryId: json['CountryId'] as int?,
      thanhPhoId: json['ThanhPhoId'] as int?,
      quanHuyenId: json['QuanHuyenId'] as int?,
      phuongXaId: json['PhuongXaId'] as int?,
      lastLogin: json['LastLogin'] as String?,
      hasPassword: json['HasPassword'] as bool?,
      shareCode: json['ShareCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'Email': email,
    'PhoneNumber': phoneNumber,
    'Address': address,
    'UserName': userName,
    'FullName': fullName,
    'Avatar': avatar,
    'Status': status,
    'CreatedBy': createdBy,
    'CreatedDate': createdDate,
    'ModifiedDate': modifiedDate,
    'ModifiedBy': modifiedBy,
    'GioiTinh': gioiTinh,
    'NgaySinh': ngaySinh,
    'GA_Status': gaStatus,
    'CountryId': countryId,
    'ThanhPhoId': thanhPhoId,
    'QuanHuyenId': quanHuyenId,
    'PhuongXaId': phuongXaId,
    'LastLogin': lastLogin,
    'HasPassword': hasPassword,
    'ShareCode': shareCode,
  };
}
