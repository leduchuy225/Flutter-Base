class ViewInstallationReportFileModelPayload {
  DateTime? duLieuHoanThanh;
  // Biên bản nghiệm thu
  String? duLieuAcc;
  String? duLieuPass;
  String? duLieuIpV4;
  String? duLieuChatLuongDichVu;
  // Biên bản bàn giao
  String? tb1Ten;
  String? tb1ThongSo;
  String? tb1SLuong;
  String? tb1HTrang;

  ViewInstallationReportFileModelPayload({
    this.duLieuHoanThanh,
    this.duLieuAcc,
    this.duLieuPass,
    this.duLieuIpV4,
    this.duLieuChatLuongDichVu,
    this.tb1Ten,
    this.tb1ThongSo,
    this.tb1SLuong,
    this.tb1HTrang,
  });

  factory ViewInstallationReportFileModelPayload.fromJson(
    Map<String, dynamic> json,
  ) {
    return ViewInstallationReportFileModelPayload(
      duLieuHoanThanh: json['DuLieu_HoanThanh'] == null
          ? null
          : DateTime.parse(json['DuLieu_HoanThanh'] as String),
      duLieuAcc: json['DuLieu_Acc'] as String?,
      duLieuPass: json['DuLieu_Pass'] as String?,
      duLieuIpV4: json['DuLieu_IpV4'] as String?,
      duLieuChatLuongDichVu: json['DuLieu_ChatLuongDichVu'] as String?,
      tb1Ten: json['TB_1_Ten'] as String?,
      tb1ThongSo: json['TB_1_ThongSo'] as String?,
      tb1SLuong: json['TB_1_SLuong'] as String?,
      tb1HTrang: json['TB_1_HTrang'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'DuLieu_HoanThanh': duLieuHoanThanh?.toIso8601String(),
    'DuLieu_Acc': duLieuAcc,
    'DuLieu_Pass': duLieuPass,
    'DuLieu_IpV4': duLieuIpV4,
    'DuLieu_ChatLuongDichVu': duLieuChatLuongDichVu,
    'TB_1_Ten': tb1Ten,
    'TB_1_ThongSo': tb1ThongSo,
    'TB_1_SLuong': tb1SLuong,
    'TB_1_HTrang': tb1HTrang,
  };
}
