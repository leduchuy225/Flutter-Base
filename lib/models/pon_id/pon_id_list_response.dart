import '../olt/olt_list_model_response.dart';
import 'pon_id_list_model_response.dart';

class PonIdListResponse {
  List<PonIdListModelResponse>? model;
  int? totalItems;
  List<OltListModelResponse>? olt;

  PonIdListResponse({this.model, this.totalItems, this.olt});

  factory PonIdListResponse.fromJson(Map<String, dynamic> json) {
    return PonIdListResponse(
      model: (json['model'] as List<dynamic>?)
          ?.map(
            (e) => PonIdListModelResponse.fromJson(e as Map<String, dynamic>),
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
