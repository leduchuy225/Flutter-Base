class CustomerSearchSet {
  String? idLong;
  String? code;
  String? cccd;
  String? phoneNumber;
  String? fullName;
  int? countryId;

  CustomerSearchSet({
    this.idLong,
    this.code,
    this.cccd,
    this.phoneNumber,
    this.fullName,
    this.countryId,
  });

  factory CustomerSearchSet.fromJson(Map<String, dynamic> json) {
    return CustomerSearchSet(
      idLong: json['IDLong'] as String?,
      code: json['Code'] as String?,
      cccd: json['CCCD'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
      fullName: json['FullName'] as String?,
      countryId: json['CountryID'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'IDLong': idLong,
    'Code': code,
    'CCCD': cccd,
    'PhoneNumber': phoneNumber,
    'FullName': fullName,
    'CountryID': countryId,
  };
}
