import 'olt_list_model_response.dart';

class OltGetallResponse {
  List<OltListModelResponse>? olt;

  OltGetallResponse({this.olt});

  factory OltGetallResponse.fromJson(Map<String, dynamic> json) {
    return OltGetallResponse(
      olt: (json['olt'] as List<dynamic>?)
          ?.map((e) => OltListModelResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'olt': olt?.map((e) => e.toJson()).toList(),
  };
}
