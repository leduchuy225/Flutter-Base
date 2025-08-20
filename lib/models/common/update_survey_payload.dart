class UpdateSurveyPayload {
  int? id;
  int? status;
  String? note;

  UpdateSurveyPayload({this.id, this.status, this.note});

  factory UpdateSurveyPayload.fromJson(Map<String, dynamic> json) {
    return UpdateSurveyPayload(
      id: json['id'] as int?,
      status: json['status'] as int?,
      note: json['note'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'status': status, 'note': note};
}
