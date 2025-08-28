class UpdateRepairRequestStep4Response {
  num? currentStep;
  bool? isCompletedStaffOn;

  UpdateRepairRequestStep4Response({this.currentStep, this.isCompletedStaffOn});

  factory UpdateRepairRequestStep4Response.fromJson(Map<String, dynamic> json) {
    return UpdateRepairRequestStep4Response(
      currentStep: json['CurrentStep'] as num?,
      isCompletedStaffOn: json['IsCompletedStaffOn'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
    'CurrentStep': currentStep,
    'IsCompletedStaffOn': isCompletedStaffOn,
  };
}
