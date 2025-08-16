class UpdateRepairRequestStep4Response {
  num? currentStep;

  UpdateRepairRequestStep4Response({this.currentStep});

  factory UpdateRepairRequestStep4Response.fromJson(Map<String, dynamic> json) {
    return UpdateRepairRequestStep4Response(
      currentStep: json['CurrentStep'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {'CurrentStep': currentStep};
}
