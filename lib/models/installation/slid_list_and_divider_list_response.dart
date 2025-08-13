import 'slid_list_model_response.dart';

class SlidListAndDividerListResponse {
  List<SlidListModelResponse>? listSlid;
  List<dynamic>? listDivider;

  SlidListAndDividerListResponse({this.listSlid, this.listDivider});

  factory SlidListAndDividerListResponse.fromJson(Map<String, dynamic> json) {
    return SlidListAndDividerListResponse(
      listSlid: (json['list_SLID'] as List<dynamic>?)
          ?.map(
            (e) => SlidListModelResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      listDivider:
          json['list_Divider.bo_chia_list_model_response'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() => {
    'list_SLID': listSlid?.map((e) => e.toJson()).toList(),
    'list_Divider': listDivider,
  };
}
