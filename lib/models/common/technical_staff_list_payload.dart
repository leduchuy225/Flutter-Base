import 'technical_staff_list_model_payload.dart';

class TechnicalStaffListPayload {
  TechnicalStaffListModelPayload? model;

  TechnicalStaffListPayload({this.model});

  factory TechnicalStaffListPayload.fromJson(Map<String, dynamic> json) {
    return TechnicalStaffListPayload(
      model: json['model'] == null
          ? null
          : TechnicalStaffListModelPayload.fromJson(
              json['model'] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic> toJson() => {'model': model?.toJson()};
}
