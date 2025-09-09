class AdgeneralcompanyinfomationModelLanguageListResponse {
  num? idInt;
  String? id;
  String? countryCode;
  String? commonName;
  String? formalName;
  String? countryType;
  dynamic countrySubType;
  dynamic sovereignty;
  String? capital;
  String? currencyCode;
  String? currencyName;
  String? telephoneCode;
  String? countryCode3;
  String? countryNumber;
  String? internetCountryCode;
  num? sortOrder;
  bool? isPublished;
  String? flags;
  bool? deleteStatus;
  dynamic deleteBy;
  dynamic deleteDate;
  String? langName;
  String? image;
  bool? status;
  num? orders;
  bool? setDefault;
  String? twoLetter;
  String? threeLetter;
  num? numberLcid;
  bool? show;

  AdgeneralcompanyinfomationModelLanguageListResponse({
    this.idInt,
    this.id,
    this.countryCode,
    this.commonName,
    this.formalName,
    this.countryType,
    this.countrySubType,
    this.sovereignty,
    this.capital,
    this.currencyCode,
    this.currencyName,
    this.telephoneCode,
    this.countryCode3,
    this.countryNumber,
    this.internetCountryCode,
    this.sortOrder,
    this.isPublished,
    this.flags,
    this.deleteStatus,
    this.deleteBy,
    this.deleteDate,
    this.langName,
    this.image,
    this.status,
    this.orders,
    this.setDefault,
    this.twoLetter,
    this.threeLetter,
    this.numberLcid,
    this.show,
  });

  factory AdgeneralcompanyinfomationModelLanguageListResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return AdgeneralcompanyinfomationModelLanguageListResponse(
      idInt: json['IDInt'] as num?,
      id: json['ID'] as String?,
      countryCode: json['CountryCode'] as String?,
      commonName: json['CommonName'] as String?,
      formalName: json['FormalName'] as String?,
      countryType: json['CountryType'] as String?,
      countrySubType: json['CountrySubType'] as dynamic,
      sovereignty: json['Sovereignty'] as dynamic,
      capital: json['Capital'] as String?,
      currencyCode: json['CurrencyCode'] as String?,
      currencyName: json['CurrencyName'] as String?,
      telephoneCode: json['TelephoneCode'] as String?,
      countryCode3: json['CountryCode3'] as String?,
      countryNumber: json['CountryNumber'] as String?,
      internetCountryCode: json['InternetCountryCode'] as String?,
      sortOrder: json['SortOrder'] as num?,
      isPublished: json['IsPublished'] as bool?,
      flags: json['Flags'] as String?,
      deleteStatus: json['DeleteStatus'] as bool?,
      deleteBy: json['DeleteBy'] as dynamic,
      deleteDate: json['DeleteDate'] as dynamic,
      langName: json['LangName'] as String?,
      image: json['Image'] as String?,
      status: json['Status'] as bool?,
      orders: json['Orders'] as num?,
      setDefault: json['SetDefault'] as bool?,
      twoLetter: json['TwoLetter'] as String?,
      threeLetter: json['ThreeLetter'] as String?,
      numberLcid: json['NumberLCID'] as num?,
      show: json['Show'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
    'IDInt': idInt,
    'ID': id,
    'CountryCode': countryCode,
    'CommonName': commonName,
    'FormalName': formalName,
    'CountryType': countryType,
    'CountrySubType': countrySubType,
    'Sovereignty': sovereignty,
    'Capital': capital,
    'CurrencyCode': currencyCode,
    'CurrencyName': currencyName,
    'TelephoneCode': telephoneCode,
    'CountryCode3': countryCode3,
    'CountryNumber': countryNumber,
    'InternetCountryCode': internetCountryCode,
    'SortOrder': sortOrder,
    'IsPublished': isPublished,
    'Flags': flags,
    'DeleteStatus': deleteStatus,
    'DeleteBy': deleteBy,
    'DeleteDate': deleteDate,
    'LangName': langName,
    'Image': image,
    'Status': status,
    'Orders': orders,
    'SetDefault': setDefault,
    'TwoLetter': twoLetter,
    'ThreeLetter': threeLetter,
    'NumberLCID': numberLcid,
    'Show': show,
  };
}
