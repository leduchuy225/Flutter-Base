class PonIdSearchSetPayload {
  String? idLong;
  String? code;
  String? oltIdLong;
  String? oltCode;

  PonIdSearchSetPayload({this.idLong, this.code, this.oltIdLong, this.oltCode});

  factory PonIdSearchSetPayload.fromJson(Map<String, dynamic> json) {
    return PonIdSearchSetPayload(
      idLong: json['IDLong'] as String?,
      code: json['Code'] as String?,
      oltIdLong: json['OLT_IDLong'] as String?,
      oltCode: json['OLT_Code'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'IDLong': idLong,
    'Code': code,
    'OLT_IDLong': oltIdLong,
    'OLT_Code': oltCode,
  };
}
