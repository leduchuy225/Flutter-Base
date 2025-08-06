class BoChiaSearchSetPayload {
  String? idLong;
  String? code;
  String? oltIdLong;
  String? ponidIdLong;
  String? maxPort;

  BoChiaSearchSetPayload({
    this.idLong,
    this.code,
    this.oltIdLong,
    this.ponidIdLong,
    this.maxPort,
  });

  factory BoChiaSearchSetPayload.fromJson(Map<String, dynamic> json) {
    return BoChiaSearchSetPayload(
      idLong: json['IDLong'] as String?,
      code: json['Code'] as String?,
      oltIdLong: json['OLT_IDLong'] as String?,
      ponidIdLong: json['PONID_IDLong'] as String?,
      maxPort: json['MaxPort'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'IDLong': idLong,
    'Code': code,
    'OLT_IDLong': oltIdLong,
    'PONID_IDLong': ponidIdLong,
    'MaxPort': maxPort,
  };
}
