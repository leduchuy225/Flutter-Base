import 'view_installation_report_file_model_payload.dart';

class ViewInstallationReportFilePayload {
  int? id;
  int? type;
  ViewInstallationReportFileModelPayload? model;

  ViewInstallationReportFilePayload({this.id, this.type, this.model});

  factory ViewInstallationReportFilePayload.fromJson(
    Map<String, dynamic> json,
  ) {
    return ViewInstallationReportFilePayload(
      id: json['id'] as int?,
      type: json['type'] as int?,
      model: json['model'] == null
          ? null
          : ViewInstallationReportFileModelPayload.fromJson(
              json['model'] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'model': model?.toJson(),
  };
}
