import 'customer_search_model_response.dart';

class CustomerSearchResponse {
  List<CustomerSearchModelResponse>? model;
  int? totalItems;

  CustomerSearchResponse({this.model, this.totalItems});

  factory CustomerSearchResponse.fromJson(Map<String, dynamic> json) {
    return CustomerSearchResponse(
      model: (json['model'] as List<dynamic>?)
          ?.map(
            (e) =>
                CustomerSearchModelResponse.fromJson(e as Map<String, dynamic>),
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
