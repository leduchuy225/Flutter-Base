import 'repair_request_get_modem_log_model_response.dart';

class RepairRequestAddModemLogResponse {
  num? currentStep;
  List<RepairRequestGetModemLogModelResponse>? model;

  RepairRequestAddModemLogResponse({this.currentStep, this.model});

  factory RepairRequestAddModemLogResponse.fromJson(Map<String, dynamic> json) {
    return RepairRequestAddModemLogResponse(
      currentStep: json['CurrentStep'] as num?,
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
    'CurrentStep': currentStep,
    'model': model?.map((e) => e.toJson()).toList(),
  };
}
