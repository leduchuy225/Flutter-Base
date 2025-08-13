import 'material_list_model_response.dart';

class MaterialListResponse {
  List<MaterialListModelResponse>? model;

  MaterialListResponse({this.model});

  factory MaterialListResponse.fromJson(Map<String, dynamic> json) {
    return MaterialListResponse(
      model: (json['model'] as List<dynamic>?)
          ?.map(
            (e) =>
                MaterialListModelResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'model': model?.map((e) => e.toJson()).toList(),
  };
}
