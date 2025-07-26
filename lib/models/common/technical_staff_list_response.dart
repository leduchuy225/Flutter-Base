import 'technical_staff_list_model_response.dart';

class TechnicalStaffListResponse {
  List<TechnicalStaffListModelResponse>? model;
  int? totalItems;

  TechnicalStaffListResponse({this.model, this.totalItems});

  factory TechnicalStaffListResponse.fromJson(Map<String, dynamic> json) {
    return TechnicalStaffListResponse(
      model: (json['model'] as List<dynamic>?)
          ?.map(
            (e) => TechnicalStaffListModelResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      totalItems: json['totalItems'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'model': model?.map((e) => e.toJson()).toList(),
    'totalItems': totalItems,
  };
}
