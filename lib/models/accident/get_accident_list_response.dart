import 'get_accident_list_model_response.dart';

class GetAccidentListResponse {
  List<GetAccidentListModelResponse>? listError;

  GetAccidentListResponse({this.listError});

  factory GetAccidentListResponse.fromJson(Map<String, dynamic> json) {
    return GetAccidentListResponse(
      listError: (json['ListError'] as List<dynamic>?)
          ?.map(
            (e) => GetAccidentListModelResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'ListError': listError?.map((e) => e.toJson()).toList(),
  };
}
