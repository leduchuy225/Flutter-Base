import 'olt_list_model_response.dart';

class OltListResponse {
  List<OltListModelResponse>? model;
  int? totalItems;

  OltListResponse({this.model, this.totalItems});

  factory OltListResponse.fromJson(Map<String, dynamic> json) {
    return OltListResponse(
      model: (json['model'] as List<dynamic>?)
          ?.map((e) => OltListModelResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalItems: json['totalItems'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'model': model?.map((e) => e.toJson()).toList(),
    'totalItems': totalItems,
  };
}
