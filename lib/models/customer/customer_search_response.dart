import 'customer_search_model_response.dart';

class CustomerSearchResponse {
  CustomerSearchModelResponse? customers;

  CustomerSearchResponse({this.customers});

  factory CustomerSearchResponse.fromJson(Map<String, dynamic> json) {
    return CustomerSearchResponse(
      customers: json['customers'] == null
          ? null
          : CustomerSearchModelResponse.fromJson(
              json['customers'] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic> toJson() => {'customers': customers?.toJson()};
}
