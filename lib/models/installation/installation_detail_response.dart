import 'installation_detail_model_response.dart';

class InstallationDetailResponse {
  InstallationDetailModelResponse? model;

  InstallationDetailResponse({this.model});

  factory InstallationDetailResponse.fromJson(Map<String, dynamic> json) {
    return InstallationDetailResponse(
      model: json['model'] == null
          ? null
          : InstallationDetailModelResponse.fromJson(
              json['model'] as Map<String, dynamic>,
            ),
    );
  }

  // Map<String, dynamic> toJson() => {'model': model?.toJson()};
}
