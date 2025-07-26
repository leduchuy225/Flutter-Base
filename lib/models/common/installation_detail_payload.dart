class InstallationDetailPayload {
  int? id;
  String? typeData;

  InstallationDetailPayload({this.id, this.typeData});

  factory InstallationDetailPayload.fromJson(Map<String, dynamic> json) {
    return InstallationDetailPayload(
      id: json['ID'] as int?,
      typeData: json['typeData'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'ID': id, 'typeData': typeData};
}
