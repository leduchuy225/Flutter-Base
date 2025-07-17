class UpdateNewInstallationReportResponse {
  int? currentStep;

  UpdateNewInstallationReportResponse({this.currentStep});

  factory UpdateNewInstallationReportResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return UpdateNewInstallationReportResponse(
      currentStep: json['CurrentStep'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {'CurrentStep': currentStep};
}
