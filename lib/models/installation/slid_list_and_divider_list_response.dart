import '../bo_chia/bo_chia_list_model_response.dart';
import '../slid/slid_list_model_response.dart';

class SlidListAndDividerListResponse {
  List<SlidListModelResponse>? listSlid;
  List<BoChiaListModelResponse>? listDivider;

  SlidListAndDividerListResponse({this.listSlid, this.listDivider});

  factory SlidListAndDividerListResponse.fromJson(Map<String, dynamic> json) {
    return SlidListAndDividerListResponse(
      listSlid: (json['list_SLID'] as List<dynamic>?)
          ?.map(
            (e) => SlidListModelResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      listDivider: (json['list_Divider'] as List<dynamic>?)
          ?.map(
            (e) => BoChiaListModelResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'list_SLID': listSlid?.map((e) => e.toJson()).toList(),
    'list_Divider': listDivider?.map((e) => e.toJson()).toList(),
  };
}
