class UpdateRepairRequestStep3Response {
  num? currentStep;

  UpdateRepairRequestStep3Response({this.currentStep});

  factory UpdateRepairRequestStep3Response.fromJson(Map<String, dynamic> json) {
    return UpdateRepairRequestStep3Response(
      currentStep: json['CurrentStep'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {'CurrentStep': currentStep};
}
