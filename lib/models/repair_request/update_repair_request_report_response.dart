class UpdateRepairRequestReportResponse {
  int? currentStep;

  UpdateRepairRequestReportResponse({this.currentStep});

  factory UpdateRepairRequestReportResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return UpdateRepairRequestReportResponse(
      currentStep: json['CurrentStep'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {'CurrentStep': currentStep};
}
