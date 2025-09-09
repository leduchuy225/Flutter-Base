class AdgeneralcompanyinfomationModelLanguageResponse {
  String? lang;

  AdgeneralcompanyinfomationModelLanguageResponse({this.lang});

  factory AdgeneralcompanyinfomationModelLanguageResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return AdgeneralcompanyinfomationModelLanguageResponse(
      lang: json['Lang'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'Lang': lang};
}
