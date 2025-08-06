class OltSearchSetPayload {
  String? idLong;
  String? code;

  OltSearchSetPayload({this.idLong, this.code});

  factory OltSearchSetPayload.fromJson(Map<String, dynamic> json) {
    return OltSearchSetPayload(
      idLong: json['IDLong'] as String?,
      code: json['Code'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'IDLong': idLong, 'Code': code};
}
