import 'adgeneralcompanyinfomation_model_language_list_response.dart';
import 'adgeneralcompanyinfomation_model_language_response.dart';
import 'adgeneralcompanyinfomation_model_response.dart';

class AdgeneralcompanyinfomationResponse {
  List<AdgeneralcompanyinfomationModelResponse>? model;
  List<AdgeneralcompanyinfomationModelLanguageResponse>? modelLanguage;
  List<AdgeneralcompanyinfomationModelLanguageListResponse>? modelLanguageList;

  AdgeneralcompanyinfomationResponse({
    this.model,
    this.modelLanguage,
    this.modelLanguageList,
  });

  factory AdgeneralcompanyinfomationResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return AdgeneralcompanyinfomationResponse(
      model: (json['model'] as List<dynamic>?)
          ?.map(
            (e) => AdgeneralcompanyinfomationModelResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      modelLanguage: (json['modelLanguage'] as List<dynamic>?)
          ?.map(
            (e) => AdgeneralcompanyinfomationModelLanguageResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      modelLanguageList: (json['modelLanguageList'] as List<dynamic>?)
          ?.map(
            (e) => AdgeneralcompanyinfomationModelLanguageListResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'model': model?.map((e) => e.toJson()).toList(),
    'modelLanguage': modelLanguage?.map((e) => e.toJson()).toList(),
    'modelLanguageList': modelLanguageList?.map((e) => e.toJson()).toList(),
  };
}
