class InstallationReportFileListModelResponse {
  int? id;
  String? title;

  InstallationReportFileListModelResponse({this.id, this.title});

  factory InstallationReportFileListModelResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return InstallationReportFileListModelResponse(
      id: json['ID'] as int?,
      title: json['Title'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'ID': id, 'Title': title};
}
