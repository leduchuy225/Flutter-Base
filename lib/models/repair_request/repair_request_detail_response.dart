import 'repair_request_detail_model_response.dart';

class RepairRequestDetailResponse {
  RepairRequestDetailModelResponse? model;

  RepairRequestDetailResponse({this.model});

  factory RepairRequestDetailResponse.fromJson(Map<String, dynamic> json) {
    return RepairRequestDetailResponse(
      model: json['model'] == null
          ? null
          : RepairRequestDetailModelResponse.fromJson(
              json['model'] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic> toJson() => {'model': model?.toJson()};
}
