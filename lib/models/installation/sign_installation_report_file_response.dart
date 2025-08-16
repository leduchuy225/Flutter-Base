class SignInstallationReportFileResponse {
  num? id;
  num? type;
  String? urlFile;

  SignInstallationReportFileResponse({this.id, this.type, this.urlFile});

  factory SignInstallationReportFileResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return SignInstallationReportFileResponse(
      id: json['id'] as num?,
      type: json['type'] as num?,
      urlFile: json['urlFile'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'type': type, 'urlFile': urlFile};
}
