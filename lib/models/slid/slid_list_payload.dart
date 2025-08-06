import '../common/search_default_model_payload.dart';
import 'slid_search_set_payload.dart';

class SlidListPayload {
  SearchDefaultModelPayload? searchDefault;
  SlidSearchSetPayload? searchSet;
  int? coundLoad;

  SlidListPayload({this.searchDefault, this.searchSet, this.coundLoad});

  factory SlidListPayload.fromJson(Map<String, dynamic> json) {
    return SlidListPayload(
      searchDefault: json['searchDefault'] == null
          ? null
          : SearchDefaultModelPayload.fromJson(
              json['searchDefault'] as Map<String, dynamic>,
            ),
      searchSet: json['searchSet'] == null
          ? null
          : SlidSearchSetPayload.fromJson(
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
