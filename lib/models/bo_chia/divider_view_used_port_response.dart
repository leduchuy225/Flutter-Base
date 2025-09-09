import 'divider_view_used_port_model_response.dart';

class DividerViewUsedPortResponse {
  List<DividerViewUsedPortModelResponse>? model;

  DividerViewUsedPortResponse({this.model});

  factory DividerViewUsedPortResponse.fromJson(Map<String, dynamic> json) {
    return DividerViewUsedPortResponse(
      model: (json['_model'] as List<dynamic>?)
          ?.map(
            (e) => DividerViewUsedPortModelResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    '_model': model?.map((e) => e.toJson()).toList(),
  };
}
