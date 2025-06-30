class SmsVertificationResponse {
  bool? status;
  String? barcodeImageUrl;
  String? setupCode;

  SmsVertificationResponse({this.status, this.barcodeImageUrl, this.setupCode});

  factory SmsVertificationResponse.fromJson(Map<String, dynamic> json) {
    return SmsVertificationResponse(
      status: json['Status'] as bool?,
      barcodeImageUrl: json['BarcodeImageUrl'] as String?,
      setupCode: json['SetupCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'Status': status,
    'BarcodeImageUrl': barcodeImageUrl,
    'SetupCode': setupCode,
  };
}
