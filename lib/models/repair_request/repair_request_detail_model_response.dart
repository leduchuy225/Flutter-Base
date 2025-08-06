import '../common/customer_viewmodel_response.dart';
import '../common/note_viewmodel_response.dart';
import '../common/technical_staff_list_model_response.dart';

class RepairRequestDetailModelResponse {
  int? id;
  int? idLong;
  int? parent;
  int? parentLong;
  int? currentStep;
  int? customersId;
  int? serviceId;
  int? type;
  String? contractCode;
  int? surveyStatus;
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
  dynamic isClosed;
  dynamic closedBy;
  dynamic closedDate;
  dynamic closedNote;
  String? technicalLeader;
  dynamic technicalStaff;
  dynamic technicalStaffDate;
  dynamic technicalStaffReception;
  dynamic technicalStaffModuleImage;
  dynamic technicalStaffTestImage;
  dynamic technicalStaffImage;
  dynamic technicalStaffRating;
  dynamic googleMap;
  String? expectedCompletionDate;
  dynamic actualCompletionDate;
  CustomerViewmodelResponse? mbCustomerViewModel;
  dynamic mbRepairRequestNoteViewModel;
  List<NoteViewmodelResponse>? listMbRepairRequestNoteViewModel;
  List<TechnicalStaffListModelResponse>? listTechnicalLeader;
  dynamic listTechnicalStaff;
  dynamic mbRepairRequestOverdueViewModel;
  List<NoteViewmodelResponse>? listMbRepairRequestOverdueViewModel;
  String? address2;
  dynamic countryIdTitle;
  dynamic provinceIdTitle;
  dynamic districtIdTitle;
  dynamic wardIdTitle;
  dynamic closedByEmail;
  dynamic closedByUserName;
  dynamic customersIdIdLong;
  dynamic customersIdFullName;
  dynamic customersIdCccd;
  dynamic serviceIdTitle;
  dynamic createdByEmail;
  dynamic createdByUserName;
  dynamic progress;
  dynamic progressTitle;

  RepairRequestDetailModelResponse({
    this.id,
    this.idLong,
    this.parent,
    this.parentLong,
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
    this.expectedCompletionDate,
    this.actualCompletionDate,
    this.mbCustomerViewModel,
    this.mbRepairRequestNoteViewModel,
    this.listMbRepairRequestNoteViewModel,
    this.listTechnicalLeader,
    this.listTechnicalStaff,
    this.mbRepairRequestOverdueViewModel,
    this.listMbRepairRequestOverdueViewModel,
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
    this.progress,
    this.progressTitle,
  });

  factory RepairRequestDetailModelResponse.fromJson(Map<String, dynamic> json) {
    return RepairRequestDetailModelResponse(
      id: json['ID'] as int?,
      idLong: json['IDLong'] as int?,
      parent: json['Parent'] as int?,
      parentLong: json['ParentLong'] as int?,
      currentStep: json['CurrentStep'] as int?,
      customersId: json['CustomersID'] as int?,
      serviceId: json['ServiceID'] as int?,
      type: json['Type'] as int?,
      contractCode: json['ContractCode'] as String?,
      surveyStatus: json['SurveyStatus'] as int?,
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
      isClosed: json['IsClosed'] as dynamic,
      closedBy: json['ClosedBy'] as dynamic,
      closedDate: json['ClosedDate'] as dynamic,
      closedNote: json['ClosedNote'] as dynamic,
      technicalLeader: json['TechnicalLeader'] as String?,
      technicalStaff: json['TechnicalStaff'] as dynamic,
      technicalStaffDate: json['TechnicalStaffDate'] as dynamic,
      technicalStaffReception: json['TechnicalStaffReception'] as dynamic,
      technicalStaffModuleImage: json['TechnicalStaffModuleImage'] as dynamic,
      technicalStaffTestImage: json['TechnicalStaffTestImage'] as dynamic,
      technicalStaffImage: json['TechnicalStaffImage'] as dynamic,
      technicalStaffRating: json['TechnicalStaffRating'] as dynamic,
      googleMap: json['GoogleMap'] as dynamic,
      expectedCompletionDate: json['ExpectedCompletionDate'] as String?,
      actualCompletionDate: json['ActualCompletionDate'] as dynamic,
      mbCustomerViewModel: json['MB_CustomerViewModel'] == null
          ? null
          : CustomerViewmodelResponse.fromJson(
              json['MB_CustomerViewModel'] as Map<String, dynamic>,
            ),
      mbRepairRequestNoteViewModel:
          json['MB_RepairRequestNoteViewModel'] as dynamic,
      listMbRepairRequestNoteViewModel:
          (json['ListMB_RepairRequestNoteViewModel'] as List<dynamic>?)
              ?.map(
                (e) =>
                    NoteViewmodelResponse.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      listTechnicalLeader: (json['ListTechnicalLeader'] as List<dynamic>?)
          ?.map(
            (e) => TechnicalStaffListModelResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      listTechnicalStaff: json['ListTechnicalStaff'] as dynamic,
      mbRepairRequestOverdueViewModel:
          json['MB_RepairRequestOverdueViewModel'] as dynamic,
      listMbRepairRequestOverdueViewModel:
          (json['ListMB_RepairRequestOverdueViewModel'] as List<dynamic>?)
              ?.map(
                (e) =>
                    NoteViewmodelResponse.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      address2: json['Address2'] as String?,
      countryIdTitle: json['CountryID_Title'] as dynamic,
      provinceIdTitle: json['ProvinceID_Title'] as dynamic,
      districtIdTitle: json['DistrictID_Title'] as dynamic,
      wardIdTitle: json['WardID_Title'] as dynamic,
      closedByEmail: json['ClosedBy_Email'] as dynamic,
      closedByUserName: json['ClosedBy_UserName'] as dynamic,
      customersIdIdLong: json['CustomersID_IDLong'] as dynamic,
      customersIdFullName: json['CustomersID_FullName'] as dynamic,
      customersIdCccd: json['CustomersID_CCCD'] as dynamic,
      serviceIdTitle: json['ServiceID_Title'] as dynamic,
      createdByEmail: json['CreatedBy_Email'] as dynamic,
      createdByUserName: json['CreatedBy_UserName'] as dynamic,
      progress: json['Progress'] as dynamic,
      progressTitle: json['Progress_Title'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
    'ID': id,
    'IDLong': idLong,
    'Parent': parent,
    'ParentLong': parentLong,
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
    'ExpectedCompletionDate': expectedCompletionDate,
    'ActualCompletionDate': actualCompletionDate,
    'MB_CustomerViewModel': mbCustomerViewModel?.toJson(),
    'MB_RepairRequestNoteViewModel': mbRepairRequestNoteViewModel,
    'ListMB_RepairRequestNoteViewModel': listMbRepairRequestNoteViewModel
        ?.map((e) => e.toJson())
        .toList(),
    'ListTechnicalLeader': listTechnicalLeader?.map((e) => e.toJson()).toList(),
    'ListTechnicalStaff': listTechnicalStaff,
    'MB_RepairRequestOverdueViewModel': mbRepairRequestOverdueViewModel,
    'ListMB_RepairRequestOverdueViewModel': listMbRepairRequestOverdueViewModel,
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
    'Progress': progress,
    'Progress_Title': progressTitle,
  };
}
