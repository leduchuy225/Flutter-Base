class InstallationReportFileListModelResponse {
  num? id;
  String? title;

  InstallationReportFileListModelResponse({this.id, this.title});

  factory InstallationReportFileListModelResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return InstallationReportFileListModelResponse(
      id: json['ID'] as num?,
      title: json['Title'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'ID': id, 'Title': title};
}
