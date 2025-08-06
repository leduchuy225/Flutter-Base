import '../common/search_default_model_payload.dart';
import 'pon_id_search_set_payload.dart';

class PonIdListPayload {
  SearchDefaultModelPayload? searchDefault;
  PonIdSearchSetPayload? searchSet;
  int? coundLoad;

  PonIdListPayload({this.searchDefault, this.searchSet, this.coundLoad});

  factory PonIdListPayload.fromJson(Map<String, dynamic> json) {
    return PonIdListPayload(
      searchDefault: json['searchDefault'] == null
          ? null
          : SearchDefaultModelPayload.fromJson(
              json['searchDefault'] as Map<String, dynamic>,
            ),
      searchSet: json['searchSet'] == null
          ? null
          : PonIdSearchSetPayload.fromJson(
              json['searchSet'] as Map<String, dynamic>,
            ),
      coundLoad: json['coundLoad'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'searchDefault': searchDefault?.toJson(),
    'searchSet': searchSet?.toJson(),
    'coundLoad': coundLoad,
  };
}
