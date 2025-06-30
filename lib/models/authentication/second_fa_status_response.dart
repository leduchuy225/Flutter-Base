class SecondFaStatusResponse {
  bool? status;
  String? setupCode;
  String? barcodeImageUrl;

  SecondFaStatusResponse({this.status, this.setupCode, this.barcodeImageUrl});

  factory SecondFaStatusResponse.fromJson(Map<String, dynamic> json) {
    return SecondFaStatusResponse(
      status: json['Status'] as bool?,
      setupCode: json['SetupCode'] as String?,
      barcodeImageUrl: json['BarcodeImageUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'Status': status,
    'SetupCode': setupCode,
    'BarcodeImageUrl': barcodeImageUrl,
  };
}
