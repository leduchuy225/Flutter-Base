class SecondFaStatusResponse {
  bool? status;
  String? setupCode;
  String? barcodeImageUrl;
  String? secondFaLink;

  SecondFaStatusResponse({
    this.status,
    this.setupCode,
    this.barcodeImageUrl,
    this.secondFaLink,
  });

  factory SecondFaStatusResponse.fromJson(Map<String, dynamic> json) {
    return SecondFaStatusResponse(
      status: json['Status'] as bool?,
      setupCode: json['SetupCode'] as String?,
      barcodeImageUrl: json['BarcodeImageUrl'] as String?,
      secondFaLink: json['SecondFaLink'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'Status': status,
    'SetupCode': setupCode,
    'BarcodeImageUrl': barcodeImageUrl,
    'SecondFaLink': secondFaLink,
  };
}
