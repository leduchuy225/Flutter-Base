import '../olt/olt_list_model_response.dart';
import 'bo_chia_list_model_response.dart';

class BoChiaListResponse {
  List<BoChiaListModelResponse>? model;
  int? totalItems;
  List<OltListModelResponse>? olt;

  BoChiaListResponse({this.model, this.totalItems, this.olt});

  factory BoChiaListResponse.fromJson(Map<String, dynamic> json) {
    return BoChiaListResponse(
      model: (json['model'] as List<dynamic>?)
          ?.map(
            (e) => BoChiaListModelResponse.fromJson(e as Map<String, dynamic>),
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
