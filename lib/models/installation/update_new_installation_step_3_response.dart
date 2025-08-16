class UpdateNewInstallationStep3Response {
  num? currentStep;

  UpdateNewInstallationStep3Response({this.currentStep});

  factory UpdateNewInstallationStep3Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return UpdateNewInstallationStep3Response(
      currentStep: json['CurrentStep'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {'CurrentStep': currentStep};
}
