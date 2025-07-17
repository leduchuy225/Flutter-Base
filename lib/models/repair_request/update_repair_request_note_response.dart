class UpdateRepairRequestNoteResponse {
  int? currentStep;

  UpdateRepairRequestNoteResponse({this.currentStep});

  factory UpdateRepairRequestNoteResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRepairRequestNoteResponse(
      currentStep: json['CurrentStep'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {'CurrentStep': currentStep};
}
