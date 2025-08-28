class SignInstallationReportFileResponse {
  num? id;
  num? type;
  String? urlFile;
  bool? isCompletedStaffOn;

  SignInstallationReportFileResponse({
    this.id,
    this.type,
    this.urlFile,
    this.isCompletedStaffOn,
  });

  factory SignInstallationReportFileResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return SignInstallationReportFileResponse(
      id: json['id'] as num?,
      type: json['type'] as num?,
      urlFile: json['urlFile'] as String?,
      isCompletedStaffOn: json['IsCompletedStaffOn'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'urlFile': urlFile,
    'IsCompletedStaffOn': isCompletedStaffOn,
  };
}
