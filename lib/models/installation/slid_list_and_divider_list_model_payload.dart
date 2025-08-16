class SlidListAndDividerListModelPayload {
  num? countryId;
  num? provinceId;
  num? oltId;
  num? ponidId;

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
      countryId: json['CountryID'] as num?,
      provinceId: json['ProvinceID'] as num?,
      oltId: json['OLT_ID'] as num?,
      ponidId: json['PONID_ID'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {
    'CountryID': countryId,
    'ProvinceID': provinceId,
    'OLT_ID': oltId,
    'PONID_ID': ponidId,
  };
}
