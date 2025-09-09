class SlidSearchSetPayload {
  String? idLong;
  String? code;
  String? oltCode;
  String? ponidCode;
  bool? isOnline;

  SlidSearchSetPayload({
    this.idLong,
    this.code,
    this.oltCode,
    this.ponidCode,
    this.isOnline,
  });

  factory SlidSearchSetPayload.fromJson(Map<String, dynamic> json) {
    return SlidSearchSetPayload(
      idLong: json['IDLong'] as String?,
      code: json['Code'] as String?,
      oltCode: json['OLT_Code'] as String?,
      ponidCode: json['PONID_Code'] as String?,
      isOnline: json['IsOnline'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
    'IDLong': idLong,
    'Code': code,
    'OLT_Code': oltCode,
    'PONID_Code': ponidCode,
    'IsOnline': isOnline,
  };
}
