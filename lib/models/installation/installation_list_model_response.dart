class InstallationListModelResponse {
  int? id;
  int? idLong;
  int? currentStep;
  int? customersId;
  int? serviceId;
  dynamic type;
  dynamic contractCode;
  dynamic surveyStatus;
  int? countryId;
  int? provinceId;
  int? districtId;
  int? wardId;
  String? address;
  String? createdBy;
  String? createdDate;
  dynamic deleteStatus;
  dynamic deleteBy;
  dynamic deleteDate;
  bool? isClosed;
  dynamic closedBy;
  String? closedDate;
  dynamic closedNote;
  dynamic technicalLeader;
  dynamic technicalStaff;
  dynamic technicalStaffDate;
  dynamic technicalStaffReception;
  dynamic technicalStaffModuleImage;
  dynamic technicalStaffTestImage;
  dynamic technicalStaffImage;
  dynamic technicalStaffRating;
  dynamic googleMap;
  dynamic deviceAcc;
  dynamic deviceSlid;
  dynamic mbCustomerViewModel;
  dynamic mbConnectionRequestNoteViewModel;
  dynamic listMbConnectionRequestNoteViewModel;
  dynamic listMbConnectionRequestNoteViewModel2;
  dynamic listTechnicalLeader;
  dynamic listTechnicalStaff;
  String? address2;
  String? countryIdTitle;
  String? provinceIdTitle;
  String? districtIdTitle;
  String? wardIdTitle;
  dynamic closedByEmail;
  dynamic closedByUserName;
  int? customersIdIdLong;
  String? customersIdFullName;
  String? customersIdCccd;
  String? serviceIdTitle;
  String? createdByEmail;
  String? createdByUserName;

  InstallationListModelResponse({
    this.id,
    this.idLong,
    this.currentStep,
    this.customersId,
    this.serviceId,
    this.type,
    this.contractCode,
    this.surveyStatus,
    this.countryId,
    this.provinceId,
    this.districtId,
    this.wardId,
    this.address,
    this.createdBy,
    this.createdDate,
    this.deleteStatus,
    this.deleteBy,
    this.deleteDate,
    this.isClosed,
    this.closedBy,
    this.closedDate,
    this.closedNote,
    this.technicalLeader,
    this.technicalStaff,
    this.technicalStaffDate,
    this.technicalStaffReception,
    this.technicalStaffModuleImage,
    this.technicalStaffTestImage,
    this.technicalStaffImage,
    this.technicalStaffRating,
    this.googleMap,
    this.deviceAcc,
    this.deviceSlid,
    this.mbCustomerViewModel,
    this.mbConnectionRequestNoteViewModel,
    this.listMbConnectionRequestNoteViewModel,
    this.listMbConnectionRequestNoteViewModel2,
    this.listTechnicalLeader,
    this.listTechnicalStaff,
    this.address2,
    this.countryIdTitle,
    this.provinceIdTitle,
    this.districtIdTitle,
    this.wardIdTitle,
    this.closedByEmail,
    this.closedByUserName,
    this.customersIdIdLong,
    this.customersIdFullName,
    this.customersIdCccd,
    this.serviceIdTitle,
    this.createdByEmail,
    this.createdByUserName,
  });

  factory InstallationListModelResponse.fromJson(Map<String, dynamic> json) {
    return InstallationListModelResponse(
      id: json['ID'] as int?,
      idLong: json['IDLong'] as int?,
      currentStep: json['CurrentStep'] as int?,
      customersId: json['CustomersID'] as int?,
      serviceId: json['ServiceID'] as int?,
      type: json['Type'] as dynamic,
      contractCode: json['ContractCode'] as dynamic,
      surveyStatus: json['SurveyStatus'] as dynamic,
      countryId: json['CountryID'] as int?,
      provinceId: json['ProvinceID'] as int?,
      districtId: json['DistrictID'] as int?,
      wardId: json['WardID'] as int?,
      address: json['Address'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] as String?,
      deleteStatus: json['DeleteStatus'] as dynamic,
      deleteBy: json['DeleteBy'] as dynamic,
      deleteDate: json['DeleteDate'] as dynamic,
      isClosed: json['IsClosed'] as bool?,
      closedBy: json['ClosedBy'] as dynamic,
      closedDate: json['ClosedDate'] as String?,
      closedNote: json['ClosedNote'] as dynamic,
      technicalLeader: json['TechnicalLeader'] as dynamic,
      technicalStaff: json['TechnicalStaff'] as dynamic,
      technicalStaffDate: json['TechnicalStaffDate'] as dynamic,
      technicalStaffReception: json['TechnicalStaffReception'] as dynamic,
      technicalStaffModuleImage: json['TechnicalStaffModuleImage'] as dynamic,
      technicalStaffTestImage: json['TechnicalStaffTestImage'] as dynamic,
      technicalStaffImage: json['TechnicalStaffImage'] as dynamic,
      technicalStaffRating: json['TechnicalStaffRating'] as dynamic,
      googleMap: json['GoogleMap'] as dynamic,
      deviceAcc: json['Device_ACC'] as dynamic,
      deviceSlid: json['Device_SLID'] as dynamic,
      mbCustomerViewModel: json['MB_CustomerViewModel'] as dynamic,
      mbConnectionRequestNoteViewModel:
          json['MB_ConnectionRequestNoteViewModel'] as dynamic,
      listMbConnectionRequestNoteViewModel:
          json['ListMB_ConnectionRequestNoteViewModel'] as dynamic,
      listMbConnectionRequestNoteViewModel2:
          json['ListMB_ConnectionRequestNoteViewModel2'] as dynamic,
      listTechnicalLeader: json['ListTechnicalLeader'] as dynamic,
      listTechnicalStaff: json['ListTechnicalStaff'] as dynamic,
      address2: json['Address2'] as String?,
      countryIdTitle: json['CountryID_Title'] as String?,
      provinceIdTitle: json['ProvinceID_Title'] as String?,
      districtIdTitle: json['DistrictID_Title'] as String?,
      wardIdTitle: json['WardID_Title'] as String?,
      closedByEmail: json['ClosedBy_Email'] as dynamic,
      closedByUserName: json['ClosedBy_UserName'] as dynamic,
      customersIdIdLong: json['CustomersID_IDLong'] as int?,
      customersIdFullName: json['CustomersID_FullName'] as String?,
      customersIdCccd: json['CustomersID_CCCD'] as String?,
      serviceIdTitle: json['ServiceID_Title'] as String?,
      createdByEmail: json['CreatedBy_Email'] as String?,
      createdByUserName: json['CreatedBy_UserName'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'ID': id,
    'IDLong': idLong,
    'CurrentStep': currentStep,
    'CustomersID': customersId,
    'ServiceID': serviceId,
    'Type': type,
    'ContractCode': contractCode,
    'SurveyStatus': surveyStatus,
    'CountryID': countryId,
    'ProvinceID': provinceId,
    'DistrictID': districtId,
    'WardID': wardId,
    'Address': address,
    'CreatedBy': createdBy,
    'CreatedDate': createdDate,
    'DeleteStatus': deleteStatus,
    'DeleteBy': deleteBy,
    'DeleteDate': deleteDate,
    'IsClosed': isClosed,
    'ClosedBy': closedBy,
    'ClosedDate': closedDate,
    'ClosedNote': closedNote,
    'TechnicalLeader': technicalLeader,
    'TechnicalStaff': technicalStaff,
    'TechnicalStaffDate': technicalStaffDate,
    'TechnicalStaffReception': technicalStaffReception,
    'TechnicalStaffModuleImage': technicalStaffModuleImage,
    'TechnicalStaffTestImage': technicalStaffTestImage,
    'TechnicalStaffImage': technicalStaffImage,
    'TechnicalStaffRating': technicalStaffRating,
    'GoogleMap': googleMap,
    'Device_ACC': deviceAcc,
    'Device_SLID': deviceSlid,
    'MB_CustomerViewModel': mbCustomerViewModel,
    'MB_ConnectionRequestNoteViewModel': mbConnectionRequestNoteViewModel,
    'ListMB_ConnectionRequestNoteViewModel':
        listMbConnectionRequestNoteViewModel,
    'ListMB_ConnectionRequestNoteViewModel2':
        listMbConnectionRequestNoteViewModel2,
    'ListTechnicalLeader': listTechnicalLeader,
    'ListTechnicalStaff': listTechnicalStaff,
    'Address2': address2,
    'CountryID_Title': countryIdTitle,
    'ProvinceID_Title': provinceIdTitle,
    'DistrictID_Title': districtIdTitle,
    'WardID_Title': wardIdTitle,
    'ClosedBy_Email': closedByEmail,
    'ClosedBy_UserName': closedByUserName,
    'CustomersID_IDLong': customersIdIdLong,
    'CustomersID_FullName': customersIdFullName,
    'CustomersID_CCCD': customersIdCccd,
    'ServiceID_Title': serviceIdTitle,
    'CreatedBy_Email': createdByEmail,
    'CreatedBy_UserName': createdByUserName,
  };
}
