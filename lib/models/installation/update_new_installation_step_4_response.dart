class UpdateNewInstallationStep4Response {
  int? currentStep;

  UpdateNewInstallationStep4Response({this.currentStep});

  factory UpdateNewInstallationStep4Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return UpdateNewInstallationStep4Response(
      currentStep: json['CurrentStep'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {'CurrentStep': currentStep};
}
