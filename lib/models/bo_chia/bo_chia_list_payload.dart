import '../common/search_default_model_payload.dart';
import 'bo_chia_search_set_payload.dart';

class BoChiaListPayload {
  SearchDefaultModelPayload? searchDefault;
  BoChiaSearchSetPayload? searchSet;
  int? coundLoad;

  BoChiaListPayload({this.searchDefault, this.searchSet, this.coundLoad});

  factory BoChiaListPayload.fromJson(Map<String, dynamic> json) {
    return BoChiaListPayload(
      searchDefault: json['searchDefault'] == null
          ? null
          : SearchDefaultModelPayload.fromJson(
              json['searchDefault'] as Map<String, dynamic>,
            ),
      searchSet: json['searchSet'] == null
          ? null
          : BoChiaSearchSetPayload.fromJson(
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
