import 'repair_request_get_modem_log_model_response.dart';

class RepairRequestGetModemLogResponse {
  List<RepairRequestGetModemLogModelResponse>? model;

  RepairRequestGetModemLogResponse({this.model});

  factory RepairRequestGetModemLogResponse.fromJson(Map<String, dynamic> json) {
    return RepairRequestGetModemLogResponse(
      model: (json['model'] as List<dynamic>?)
          ?.map(
            (e) => RepairRequestGetModemLogModelResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'model': model?.map((e) => e.toJson()).toList(),
  };
}
