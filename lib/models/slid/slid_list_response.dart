import '../olt/olt_list_model_response.dart';
import 'slid_list_model_response.dart';

class SlidListResponse {
  List<SlidListModelResponse>? model;
  int? totalItems;
  List<OltListModelResponse>? olt;

  SlidListResponse({this.model, this.totalItems, this.olt});

  factory SlidListResponse.fromJson(Map<String, dynamic> json) {
    return SlidListResponse(
      model: (json['model'] as List<dynamic>?)
          ?.map(
            (e) => SlidListModelResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      totalItems: json['totalItems'] as int?,
      olt: (json['olt'] as List<dynamic>?)
          ?.map((e) => OltListModelResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'model': model?.map((e) => e.toJson()).toList(),
    'totalItems': totalItems,
    'olt': olt?.map((e) => e.toJson()).toList(),
  };
}
