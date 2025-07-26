class UpdateRepairRequestStep4Response {
  int? currentStep;

  UpdateRepairRequestStep4Response({this.currentStep});

  factory UpdateRepairRequestStep4Response.fromJson(Map<String, dynamic> json) {
    return UpdateRepairRequestStep4Response(
      currentStep: json['CurrentStep'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {'CurrentStep': currentStep};
}
