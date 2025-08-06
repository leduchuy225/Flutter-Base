import '../common/search_default_model_payload.dart';
import 'olt_search_set_payload.dart';

class OltListPayload {
  SearchDefaultModelPayload? searchDefault;
  OltSearchSetPayload? searchSet;
  int? coundLoad;

  OltListPayload({this.searchDefault, this.searchSet, this.coundLoad});

  factory OltListPayload.fromJson(Map<String, dynamic> json) {
    return OltListPayload(
      searchDefault: json['searchDefault'] == null
          ? null
          : SearchDefaultModelPayload.fromJson(
              json['searchDefault'] as Map<String, dynamic>,
            ),
      searchSet: json['searchSet'] == null
          ? null
          : OltSearchSetPayload.fromJson(
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
