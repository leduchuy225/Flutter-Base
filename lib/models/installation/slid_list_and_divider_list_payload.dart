import 'slid_list_and_divider_list_model_payload.dart';

class SlidListAndDividerListPayload {
  int? id;
  SlidListAndDividerListModelPayload? model;

  SlidListAndDividerListPayload({this.id, this.model});

  factory SlidListAndDividerListPayload.fromJson(Map<String, dynamic> json) {
    return SlidListAndDividerListPayload(
      id: json['id'] as int?,
      model: json['model'] == null
          ? null
          : SlidListAndDividerListModelPayload.fromJson(
              json['model'] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'model': model?.toJson()};
}
