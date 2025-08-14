class RepairRequestAddModemLogModelPayload {
  String? modemOld;
  String? modemNew;

  RepairRequestAddModemLogModelPayload({this.modemOld, this.modemNew});

  factory RepairRequestAddModemLogModelPayload.fromJson(
    Map<String, dynamic> json,
  ) {
    return RepairRequestAddModemLogModelPayload(
      modemOld: json['ModemOld'] as String?,
      modemNew: json['ModemNew'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'ModemOld': modemOld, 'ModemNew': modemNew};
}
