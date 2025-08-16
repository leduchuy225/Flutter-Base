import 'view_installation_report_file_model_payload.dart';

class ViewInstallationReportFilePayload {
  num? id;
  num? type;
  ViewInstallationReportFileModelPayload? model;

  ViewInstallationReportFilePayload({this.id, this.type, this.model});

  factory ViewInstallationReportFilePayload.fromJson(
    Map<String, dynamic> json,
  ) {
    return ViewInstallationReportFilePayload(
      id: json['id'] as num?,
      type: json['type'] as num?,
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
