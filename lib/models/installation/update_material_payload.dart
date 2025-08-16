import 'update_material_model_payload.dart';

class UpdateMaterialPayload {
  num? id;
  List<UpdateMaterialModelPayload>? model;

  UpdateMaterialPayload({this.id, this.model});

  factory UpdateMaterialPayload.fromJson(Map<String, dynamic> json) {
    return UpdateMaterialPayload(
      id: json['id'] as num?,
      model: (json['model'] as List<dynamic>?)
          ?.map(
            (e) =>
                UpdateMaterialModelPayload.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'model': model?.map((e) => e.toJson()).toList(),
  };
}
