class CloseRepairRequestResponse {
  bool? isClosed;
  String? closedBy;
  String? closedDate;
  String? closedNote;
  String? closedByEmail;

  CloseRepairRequestResponse({
    this.isClosed,
    this.closedBy,
    this.closedDate,
    this.closedNote,
    this.closedByEmail,
  });

  factory CloseRepairRequestResponse.fromJson(Map<String, dynamic> json) {
    return CloseRepairRequestResponse(
      isClosed: json['IsClosed'] as bool?,
      closedBy: json['ClosedBy'] as String?,
      closedDate: json['ClosedDate'] as String?,
      closedNote: json['ClosedNote'] as String?,
      closedByEmail: json['ClosedBy_Email'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'IsClosed': isClosed,
    'ClosedBy': closedBy,
    'ClosedDate': closedDate,
    'ClosedNote': closedNote,
    'ClosedBy_Email': closedByEmail,
  };
}
