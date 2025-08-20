class InstallationReportFileListModelResponse {
  num? id;
  String? title;
  bool? isSign;

  InstallationReportFileListModelResponse({this.id, this.title, this.isSign});

  factory InstallationReportFileListModelResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return InstallationReportFileListModelResponse(
      id: json['ID'] as num?,
      title: json['Title'] as String?,
      isSign: json['IsSign'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {'ID': id, 'Title': title, 'IsSign': isSign};
}
