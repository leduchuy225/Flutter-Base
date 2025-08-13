class UpdateMaterialResponse {
  int? currentStep;

  UpdateMaterialResponse({this.currentStep});

  factory UpdateMaterialResponse.fromJson(Map<String, dynamic> json) {
    return UpdateMaterialResponse(currentStep: json['CurrentStep'] as int?);
  }

  Map<String, dynamic> toJson() => {'CurrentStep': currentStep};
}
