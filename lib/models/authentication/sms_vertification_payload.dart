class SmsVertificationPayload {
  String? codeKey;

  SmsVertificationPayload({this.codeKey});

  factory SmsVertificationPayload.fromJson(Map<String, dynamic> json) {
    return SmsVertificationPayload(codeKey: json['codeKey'] as String?);
  }

  Map<String, dynamic> toJson() => {'codeKey': codeKey};
}
