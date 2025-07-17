class NoteViewmodelResponse {
  int? id;
  dynamic parent;
  int? currentStep;
  String? note;
  String? createdBy;
  String? createdDate;
  dynamic deleteStatus;
  dynamic deleteBy;
  dynamic deleteDate;
  dynamic setDefault;
  dynamic createdByAvatar;
  String? createdByEmail;
  dynamic createdByUserName;

  NoteViewmodelResponse({
    this.id,
    this.parent,
    this.currentStep,
    this.note,
    this.createdBy,
    this.createdDate,
    this.deleteStatus,
    this.deleteBy,
    this.deleteDate,
    this.setDefault,
    this.createdByAvatar,
    this.createdByEmail,
    this.createdByUserName,
  });

  factory NoteViewmodelResponse.fromJson(Map<String, dynamic> json) {
    return NoteViewmodelResponse(
      id: json['ID'] as int?,
      parent: json['Parent'] as dynamic,
      currentStep: json['CurrentStep'] as int?,
      note: json['Note'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] as String?,
      deleteStatus: json['DeleteStatus'] as dynamic,
      deleteBy: json['DeleteBy'] as dynamic,
      deleteDate: json['DeleteDate'] as dynamic,
      setDefault: json['SetDefault'] as dynamic,
      createdByAvatar: json['CreatedBy_Avatar'] as dynamic,
      createdByEmail: json['CreatedBy_Email'] as String?,
      createdByUserName: json['CreatedBy_UserName'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
    'ID': id,
    'Parent': parent,
    'CurrentStep': currentStep,
    'Note': note,
    'CreatedBy': createdBy,
    'CreatedDate': createdDate,
    'DeleteStatus': deleteStatus,
    'DeleteBy': deleteBy,
    'DeleteDate': deleteDate,
    'SetDefault': setDefault,
    'CreatedBy_Avatar': createdByAvatar,
    'CreatedBy_Email': createdByEmail,
    'CreatedBy_UserName': createdByUserName,
  };
}
