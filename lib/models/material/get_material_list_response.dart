import 'get_material_list_model_response.dart';

class GetMaterialListResponse {
  List<GetMaterialListModelResponse>? material;

  GetMaterialListResponse({this.material});

  factory GetMaterialListResponse.fromJson(Map<String, dynamic> json) {
    return GetMaterialListResponse(
      material: (json['material'] as List<dynamic>?)
          ?.map(
            (e) => GetMaterialListModelResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'material': material?.map((e) => e.toJson()).toList(),
  };
}
