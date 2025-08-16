import 'repair_request_add_modem_log_model_payload.dart';

class RepairRequestAddModemLogPayload {
  num? id;
  RepairRequestAddModemLogModelPayload? model;

  RepairRequestAddModemLogPayload({this.id, this.model});

  factory RepairRequestAddModemLogPayload.fromJson(Map<String, dynamic> json) {
    return RepairRequestAddModemLogPayload(
      id: json['id'] as num?,
      model: json['model'] == null
          ? null
          : RepairRequestAddModemLogModelPayload.fromJson(
              json['model'] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'model': model?.toJson()};
}
