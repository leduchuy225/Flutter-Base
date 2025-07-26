class TechnicalStaffListModelPayload {
  int? countryId;
  int? thanhPhoId;
  int? quanHuyenId;
  int? phuongXaId;

  TechnicalStaffListModelPayload({
    this.countryId,
    this.thanhPhoId,
    this.quanHuyenId,
    this.phuongXaId,
  });

  factory TechnicalStaffListModelPayload.fromJson(Map<String, dynamic> json) {
    return TechnicalStaffListModelPayload(
      countryId: json['CountryId'] as int?,
      thanhPhoId: json['ThanhPhoId'] as int?,
      quanHuyenId: json['QuanHuyenId'] as int?,
      phuongXaId: json['PhuongXaId'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'CountryId': countryId,
    'ThanhPhoId': thanhPhoId,
    'QuanHuyenId': quanHuyenId,
    'PhuongXaId': phuongXaId,
  };
}
