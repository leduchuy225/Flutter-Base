import 'update_device_model_payload.dart';

class UpdateDevicePayload {
  int? id;
  UpdateDeviceModelPayload? model;

  UpdateDevicePayload({this.id, this.model});

  factory UpdateDevicePayload.fromJson(Map<String, dynamic> json) {
    return UpdateDevicePayload(
      id: json['id'] as int?,
      model: json['model'] == null
          ? null
          : UpdateDeviceModelPayload.fromJson(
              json['model'] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'model': model?.toJson()};
}
