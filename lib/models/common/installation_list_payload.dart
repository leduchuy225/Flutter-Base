import 'search_default_model_payload.dart';

class InstallationListPayload {
  SearchDefaultModelPayload? searchDefault;
  String? typeData;
  int? coundLoad;

  InstallationListPayload({this.searchDefault, this.typeData, this.coundLoad});

  factory InstallationListPayload.fromJson(Map<String, dynamic> json) {
    return InstallationListPayload(
      searchDefault: json['searchDefault'] == null
          ? null
          : SearchDefaultModelPayload.fromJson(
              json['searchDefault'] as Map<String, dynamic>,
            ),
      typeData: json['typeData'] as String?,
      coundLoad: json['coundLoad'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'searchDefault': searchDefault?.toJson(),
    'typeData': typeData,
    'coundLoad': coundLoad,
  };
}
