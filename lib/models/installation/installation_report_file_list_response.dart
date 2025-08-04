import 'installation_report_file_list_model_response.dart';

class InstallationReportFileListResponse {
  List<InstallationReportFileListModelResponse>? model;

  InstallationReportFileListResponse({this.model});

  factory InstallationReportFileListResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return InstallationReportFileListResponse(
      model: (json['model'] as List<dynamic>?)
          ?.map(
            (e) => InstallationReportFileListModelResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'model': model?.map((e) => e.toJson()).toList(),
  };
}
