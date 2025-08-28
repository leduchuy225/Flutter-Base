class UpdateNewInstallationStep4Response {
  num? currentStep;
  bool? isCompletedStaffOn;

  UpdateNewInstallationStep4Response({
    this.currentStep,
    this.isCompletedStaffOn,
  });

  factory UpdateNewInstallationStep4Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return UpdateNewInstallationStep4Response(
      currentStep: json['CurrentStep'] as num?,
      isCompletedStaffOn: json['IsCompletedStaffOn'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
    'CurrentStep': currentStep,
    'IsCompletedStaffOn': isCompletedStaffOn,
  };
}
