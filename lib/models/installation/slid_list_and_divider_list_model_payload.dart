class SlidListAndDividerListModelPayload {
  int? countryId;
  int? provinceId;
  int? oltId;
  int? ponidId;

  SlidListAndDividerListModelPayload({
    this.countryId,
    this.provinceId,
    this.oltId,
    this.ponidId,
  });

  factory SlidListAndDividerListModelPayload.fromJson(
    Map<String, dynamic> json,
  ) {
    return SlidListAndDividerListModelPayload(
      countryId: json['CountryID'] as int?,
      provinceId: json['ProvinceID'] as int?,
      oltId: json['OLT_ID'] as int?,
      ponidId: json['PONID_ID'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'CountryID': countryId,
    'ProvinceID': provinceId,
    'OLT_ID': oltId,
    'PONID_ID': ponidId,
  };
}
