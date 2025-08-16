class UpdateRepairRequestTechnicalStaffResponse {
  num? currentStep;
  String? technicalStaffId;
  String? technicalStaffEmail;
  String? technicalStaffUserName;

  UpdateRepairRequestTechnicalStaffResponse({
    this.currentStep,
    this.technicalStaffId,
    this.technicalStaffEmail,
    this.technicalStaffUserName,
  });

  factory UpdateRepairRequestTechnicalStaffResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return UpdateRepairRequestTechnicalStaffResponse(
      currentStep: json['CurrentStep'] as num?,
      technicalStaffId: json['TechnicalStaff_Id'] as String?,
      technicalStaffEmail: json['TechnicalStaff_Email'] as String?,
      technicalStaffUserName: json['TechnicalStaff_UserName'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'CurrentStep': currentStep,
    'TechnicalStaff_Id': technicalStaffId,
    'TechnicalStaff_Email': technicalStaffEmail,
    'TechnicalStaff_UserName': technicalStaffUserName,
  };
}
