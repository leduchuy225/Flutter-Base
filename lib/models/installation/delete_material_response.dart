class DeleteMaterialResponse {
  int? currentStep;

  DeleteMaterialResponse({this.currentStep});

  factory DeleteMaterialResponse.fromJson(Map<String, dynamic> json) {
    return DeleteMaterialResponse(currentStep: json['CurrentStep'] as int?);
  }

  Map<String, dynamic> toJson() => {'CurrentStep': currentStep};
}
