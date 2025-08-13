import 'pon_id_list_model_response.dart';

class PonidGetallResponse {
  List<PonIdListModelResponse>? pOnid;

  PonidGetallResponse({this.pOnid});

  factory PonidGetallResponse.fromJson(Map<String, dynamic> json) {
    return PonidGetallResponse(
      pOnid: (json['pONID'] as List<dynamic>?)
          ?.map(
            (e) => PonIdListModelResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'pONID': pOnid?.map((e) => e.toJson()).toList(),
  };
}
