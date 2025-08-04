class ViewInstallationReportFileModelPayload {
  String? duLieuAcc;
  String? duLieuPass;
  String? duLieuIpV4;
  DateTime? duLieuHoanThanh;
  String? duLieuChatLuongDichVu;

  ViewInstallationReportFileModelPayload({
    this.duLieuAcc,
    this.duLieuPass,
    this.duLieuIpV4,
    this.duLieuHoanThanh,
    this.duLieuChatLuongDichVu,
  });

  factory ViewInstallationReportFileModelPayload.fromJson(
    Map<String, dynamic> json,
  ) {
    return ViewInstallationReportFileModelPayload(
      duLieuAcc: json['DuLieu_Acc'] as String?,
      duLieuPass: json['DuLieu_Pass'] as String?,
      duLieuIpV4: json['DuLieu_IpV4'] as String?,
      duLieuHoanThanh: json['DuLieu_HoanThanh'] == null
          ? null
          : DateTime.parse(json['DuLieu_HoanThanh'] as String),
      duLieuChatLuongDichVu: json['DuLieu_ChatLuongDichVu'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'DuLieu_Acc': duLieuAcc,
    'DuLieu_Pass': duLieuPass,
    'DuLieu_IpV4': duLieuIpV4,
    'DuLieu_HoanThanh': duLieuHoanThanh?.toIso8601String(),
    'DuLieu_ChatLuongDichVu': duLieuChatLuongDichVu,
  };
}
