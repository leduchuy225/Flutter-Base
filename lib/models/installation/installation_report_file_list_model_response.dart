class InstallationReportFileListModelResponse {
  num? id;
  String? title;
  bool? isSigned;

  InstallationReportFileListModelResponse({this.id, this.title, this.isSigned});

  factory InstallationReportFileListModelResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return InstallationReportFileListModelResponse(
      id: json['ID'] as num?,
      title: json['Title'] as String?,
      isSigned: json['IsSign'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
    'ID': id,
    'Title': title,
    'IsSign': isSigned,
  };
}
