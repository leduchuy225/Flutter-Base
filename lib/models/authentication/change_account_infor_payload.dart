class ChangeAccountInforPayload {
  String? address;
  String? fullName;
  String? gioiTinh;
  int? countryId;
  int? thanhPhoId;
  int? quanHuyenId;
  int? phuongXaId;
  String? email;
  String? userName;

  ChangeAccountInforPayload({
    this.address,
    this.fullName,
    this.gioiTinh,
    this.countryId,
    this.thanhPhoId,
    this.quanHuyenId,
    this.phuongXaId,
    this.email,
    this.userName,
  });

  factory ChangeAccountInforPayload.fromJson(Map<String, dynamic> json) {
    return ChangeAccountInforPayload(
      address: json['Address'] as String?,
      fullName: json['FullName'] as String?,
      gioiTinh: json['GioiTinh'] as String?,
      countryId: json['CountryId'] as int?,
      thanhPhoId: json['ThanhPhoId'] as int?,
      quanHuyenId: json['QuanHuyenId'] as int?,
      phuongXaId: json['PhuongXaId'] as int?,
      email: json['Email'] as String?,
      userName: json['UserName'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'Address': address,
    'FullName': fullName,
    'GioiTinh': gioiTinh,
    'CountryId': countryId,
    'ThanhPhoId': thanhPhoId,
    'QuanHuyenId': quanHuyenId,
    'PhuongXaId': phuongXaId,
    'Email': email,
    'UserName': userName,
  };
}
