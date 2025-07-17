class UpdateNewInstallationNoteResponse {
  int? currentStep;

  UpdateNewInstallationNoteResponse({this.currentStep});

  factory UpdateNewInstallationNoteResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return UpdateNewInstallationNoteResponse(
      currentStep: json['CurrentStep'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {'CurrentStep': currentStep};
}
