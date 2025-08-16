class DeleteMaterialResponse {
  num? currentStep;

  DeleteMaterialResponse({this.currentStep});

  factory DeleteMaterialResponse.fromJson(Map<String, dynamic> json) {
    return DeleteMaterialResponse(currentStep: json['CurrentStep'] as num?);
  }

  Map<String, dynamic> toJson() => {'CurrentStep': currentStep};
}
