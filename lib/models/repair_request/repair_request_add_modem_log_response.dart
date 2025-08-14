import 'repair_request_add_modem_log_model_response.dart';

class RepairRequestAddModemLogResponse {
  int? currentStep;
  List<RepairRequestAddModemLogModelResponse>? model;

  RepairRequestAddModemLogResponse({this.currentStep, this.model});

  factory RepairRequestAddModemLogResponse.fromJson(Map<String, dynamic> json) {
    return RepairRequestAddModemLogResponse(
      currentStep: json['CurrentStep'] as int?,
      model: (json['model'] as List<dynamic>?)
          ?.map(
            (e) => RepairRequestAddModemLogModelResponse.fromJson(
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
