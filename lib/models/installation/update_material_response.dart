import 'material_list_model_response.dart';

class UpdateMaterialResponse {
  int? currentStep;
  List<MaterialListModelResponse>? model;

  UpdateMaterialResponse({this.currentStep, this.model});

  factory UpdateMaterialResponse.fromJson(Map<String, dynamic> json) {
    return UpdateMaterialResponse(
      currentStep: json['CurrentStep'] as int?,
      model: (json['model'] as List<dynamic>?)
          ?.map(
            (e) =>
                MaterialListModelResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'CurrentStep': currentStep,
    'model': model?.map((e) => e.toJson()).toList(),
  };
}
