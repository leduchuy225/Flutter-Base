import '../accident/get_accident_list_model_response.dart';
import '../common/customer_viewmodel_response.dart';
import '../common/note_viewmodel_response.dart';
import '../common/technical_staff_list_model_response.dart';
import '../installation/material_list_model_response.dart';
import 'repair_request_get_modem_log_model_response.dart';

class RepairRequestDetailModelResponse {
  num? id;
  num? idLong;
  dynamic parent;
  dynamic parentLong;
  num? currentStep;
  num? customersId;
  num? serviceId;
  num? type;
  dynamic contractCode;
  num? surveyStatus;
  num? countryId;
  num? provinceId;
  num? districtId;
  num? wardId;
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
  String? technicalStaff;
  String? technicalStaffDate;
  bool? technicalStaffReception;
  String? technicalStaffModuleImage;
  String? technicalStaffTestImage;
  String? technicalStaffImage;
  dynamic technicalStaffRating;
  String? googleMap;
  dynamic expectedCompletionDate;
  dynamic actualCompletionDate;
  dynamic devicePort;
  dynamic deviceAcc;
  dynamic devicePass;
  dynamic deviceStatus;
  dynamic slidId;
  dynamic slidIdLong;
  dynamic dividerId;
  dynamic dividerIdLong;
  dynamic staffCode;
  String? staffFullName;
  String? staffPhoneNumber;
  dynamic technicalStaffReportCompletedDate;
  bool? isCompletedStaffOn;
  dynamic customerNote;
  num? reportDistance;
  String? reportCorrectionMethod;
  dynamic reportOtherArising;
  dynamic reportResult;
  String? reportImageDivider;
  String? reportCableLengthStart;
  String? reportCableLengthEnd;
  num? cableLength;
  num? cableLengthStart;
  num? cableLengthEnd;
  String? reportProblem;
  dynamic reportProblemIsSet;
  CustomerViewmodelResponse? mbCustomerViewModel;
  dynamic listError;
  dynamic technicalStaffNote;
  String? technicalStaffSurveyDate;
  dynamic technicalStaffSurveyDateSuccess;
  String? technicalStaffSurveyCancelNote;
  dynamic technicalStaffSurveyPendingNote;
  num? technicalStaffSurveyStatus;
  dynamic totalProcessingTime;
  dynamic convertHours;
  dynamic kCoefficient;
  dynamic mbRepairRequestNoteViewModel;
  List<NoteViewmodelResponse>? listMbRepairRequestNoteViewModel;
  List<TechnicalStaffListModelResponse>? listTechnicalLeader;
  dynamic listTechnicalStaff;
  dynamic mbRepairRequestOverdueViewModel;
  List<NoteViewmodelResponse>? listMbRepairRequestOverdueViewModel;
  List<MaterialListModelResponse>? listMbRepairRequestMaterialViewModel;
  List<RepairRequestGetModemLogModelResponse>? listMbModemLogViewModel;
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
  dynamic customersIdPhoneNumber;
  dynamic customersIdCode;
  dynamic serviceIdTitle;
  dynamic createdByEmail;
  dynamic createdByUserName;
  dynamic progress;
  dynamic progressTitle;
  dynamic typeTitle;
  dynamic surveyStatusTitle;
  dynamic technicalLeaderUserName;
  dynamic technicalStaffUserName;
  List<GetAccidentListModelResponse>? listListError;

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
    this.devicePort,
    this.deviceAcc,
    this.devicePass,
    this.deviceStatus,
    this.slidId,
    this.slidIdLong,
    this.dividerId,
    this.dividerIdLong,
    this.staffCode,
    this.staffFullName,
    this.staffPhoneNumber,
    this.technicalStaffReportCompletedDate,
    this.isCompletedStaffOn,
    this.customerNote,
    this.reportDistance,
    this.reportCorrectionMethod,
    this.reportOtherArising,
    this.reportResult,
    this.reportImageDivider,
    this.reportCableLengthStart,
    this.reportCableLengthEnd,
    this.cableLength,
    this.cableLengthStart,
    this.cableLengthEnd,
    this.reportProblem,
    this.reportProblemIsSet,
    this.mbCustomerViewModel,
    this.listError,
    this.technicalStaffNote,
    this.technicalStaffSurveyDate,
    this.technicalStaffSurveyDateSuccess,
    this.technicalStaffSurveyCancelNote,
    this.technicalStaffSurveyPendingNote,
    this.technicalStaffSurveyStatus,
    this.totalProcessingTime,
    this.convertHours,
    this.kCoefficient,
    this.mbRepairRequestNoteViewModel,
    this.listMbRepairRequestNoteViewModel,
    this.listTechnicalLeader,
    this.listTechnicalStaff,
    this.mbRepairRequestOverdueViewModel,
    this.listMbRepairRequestOverdueViewModel,
    this.listMbRepairRequestMaterialViewModel,
    this.listMbModemLogViewModel,
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
    this.customersIdPhoneNumber,
    this.customersIdCode,
    this.serviceIdTitle,
    this.createdByEmail,
    this.createdByUserName,
    this.progress,
    this.progressTitle,
    this.typeTitle,
    this.surveyStatusTitle,
    this.technicalLeaderUserName,
    this.technicalStaffUserName,
    this.listListError,
  });

  factory RepairRequestDetailModelResponse.fromJson(Map<String, dynamic> json) {
    return RepairRequestDetailModelResponse(
      id: json['ID'] as num?,
      idLong: json['IDLong'] as num?,
      parent: json['Parent'] as dynamic,
      parentLong: json['ParentLong'] as dynamic,
      currentStep: json['CurrentStep'] as num?,
      customersId: json['CustomersID'] as num?,
      serviceId: json['ServiceID'] as num?,
      type: json['Type'] as num?,
      contractCode: json['ContractCode'] as dynamic,
      surveyStatus: json['SurveyStatus'] as num?,
      countryId: json['CountryID'] as num?,
      provinceId: json['ProvinceID'] as num?,
      districtId: json['DistrictID'] as num?,
      wardId: json['WardID'] as num?,
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
      technicalStaff: json['TechnicalStaff'] as String?,
      technicalStaffDate: json['TechnicalStaffDate'] as String?,
      technicalStaffReception: json['TechnicalStaffReception'] as bool?,
      technicalStaffModuleImage: json['TechnicalStaffModuleImage'] as String?,
      technicalStaffTestImage: json['TechnicalStaffTestImage'] as String?,
      technicalStaffImage: json['TechnicalStaffImage'] as String?,
      technicalStaffRating: json['TechnicalStaffRating'] as dynamic,
      googleMap: json['GoogleMap'] as String?,
      expectedCompletionDate: json['ExpectedCompletionDate'] as dynamic,
      actualCompletionDate: json['ActualCompletionDate'] as dynamic,
      devicePort: json['Device_Port'] as dynamic,
      deviceAcc: json['Device_ACC'] as dynamic,
      devicePass: json['Device_Pass'] as dynamic,
      deviceStatus: json['Device_Status'] as dynamic,
      slidId: json['SLID_ID'] as dynamic,
      slidIdLong: json['SLID_IDLong'] as dynamic,
      dividerId: json['Divider_ID'] as dynamic,
      dividerIdLong: json['Divider_IDLong'] as dynamic,
      staffCode: json['StaffCode'] as dynamic,
      staffFullName: json['StaffFullName'] as String?,
      staffPhoneNumber: json['StaffPhoneNumber'] as String?,
      technicalStaffReportCompletedDate:
          json['TechnicalStaffReportCompletedDate'] as dynamic,
      isCompletedStaffOn: json['IsCompletedStaffOn'] as bool?,
      customerNote: json['CustomerNote'] as dynamic,
      reportDistance: json['Report_Distance'] as num?,
      reportCorrectionMethod: json['Report_CorrectionMethod'] as String?,
      reportOtherArising: json['Report_OtherArising'] as dynamic,
      reportResult: json['Report_Result'] as dynamic,
      reportImageDivider: json['Report_ImageDivider'] as String?,
      reportCableLengthStart: json['Report_CableLengthStart'] as String?,
      reportCableLengthEnd: json['Report_CableLengthEnd'] as String?,
      cableLength: json['CableLength'] as num?,
      cableLengthStart: json['CableLengthStart'] as num?,
      cableLengthEnd: json['CableLengthEnd'] as num?,
      reportProblem: json['Report_Problem'] as String?,
      reportProblemIsSet: json['Report_Problem_IsSet'] as dynamic,
      listError: json['ListError'] as dynamic,
      technicalStaffNote: json['TechnicalStaffNote'] as dynamic,
      technicalStaffSurveyDate: json['TechnicalStaffSurveyDate'] as String?,
      technicalStaffSurveyDateSuccess:
          json['TechnicalStaffSurveyDateSuccess'] as dynamic,
      technicalStaffSurveyCancelNote:
          json['TechnicalStaffSurveyCancelNote'] as String?,
      technicalStaffSurveyPendingNote:
          json['TechnicalStaffSurveyPendingNote'] as dynamic,
      technicalStaffSurveyStatus: json['TechnicalStaffSurveyStatus'] as num?,
      totalProcessingTime: json['TotalProcessingTime'] as dynamic,
      convertHours: json['ConvertHours'] as dynamic,
      kCoefficient: json['KCoefficient'] as dynamic,
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
      listMbRepairRequestMaterialViewModel:
          (json['ListMB_RepairRequestMaterialViewModel'] as List<dynamic>?)
              ?.map(
                (e) => MaterialListModelResponse.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
      listMbModemLogViewModel:
          (json['ListMB_ModemLogViewModel'] as List<dynamic>?)
              ?.map(
                (e) => RepairRequestGetModemLogModelResponse.fromJson(
                  e as Map<String, dynamic>,
                ),
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
      customersIdPhoneNumber: json['CustomersID_PhoneNumber'] as dynamic,
      customersIdCode: json['CustomersID_Code'] as dynamic,
      serviceIdTitle: json['ServiceID_Title'] as dynamic,
      createdByEmail: json['CreatedBy_Email'] as dynamic,
      createdByUserName: json['CreatedBy_UserName'] as dynamic,
      progress: json['Progress'] as dynamic,
      progressTitle: json['Progress_Title'] as dynamic,
      typeTitle: json['Type_Title'] as dynamic,
      surveyStatusTitle: json['SurveyStatus_Title'] as dynamic,
      technicalLeaderUserName: json['TechnicalLeader_UserName'] as dynamic,
      technicalStaffUserName: json['TechnicalStaff_UserName'] as dynamic,
      listListError: (json['List_ListError'] as List<dynamic>?)
          ?.map(
            (e) => GetAccidentListModelResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
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
    'Device_Port': devicePort,
    'Device_ACC': deviceAcc,
    'Device_Pass': devicePass,
    'Device_Status': deviceStatus,
    'SLID_ID': slidId,
    'SLID_IDLong': slidIdLong,
    'Divider_ID': dividerId,
    'Divider_IDLong': dividerIdLong,
    'StaffCode': staffCode,
    'StaffFullName': staffFullName,
    'StaffPhoneNumber': staffPhoneNumber,
    'TechnicalStaffReportCompletedDate': technicalStaffReportCompletedDate,
    'IsCompletedStaffOn': isCompletedStaffOn,
    'CustomerNote': customerNote,
    'Report_Distance': reportDistance,
    'Report_CorrectionMethod': reportCorrectionMethod,
    'Report_OtherArising': reportOtherArising,
    'Report_Result': reportResult,
    'Report_ImageDivider': reportImageDivider,
    'Report_CableLengthStart': reportCableLengthStart,
    'Report_CableLengthEnd': reportCableLengthEnd,
    'CableLength': cableLength,
    'CableLengthStart': cableLengthStart,
    'CableLengthEnd': cableLengthEnd,
    'Report_Problem': reportProblem,
    'Report_Problem_IsSet': reportProblemIsSet,
    'MB_CustomerViewModel': mbCustomerViewModel?.toJson(),
    'ListError': listError,
    'TechnicalStaffNote': technicalStaffNote,
    'TechnicalStaffSurveyDate': technicalStaffSurveyDate,
    'TechnicalStaffSurveyDateSuccess': technicalStaffSurveyDateSuccess,
    'TechnicalStaffSurveyCancelNote': technicalStaffSurveyCancelNote,
    'TechnicalStaffSurveyPendingNote': technicalStaffSurveyPendingNote,
    'TechnicalStaffSurveyStatus': technicalStaffSurveyStatus,
    'TotalProcessingTime': totalProcessingTime,
    'ConvertHours': convertHours,
    'KCoefficient': kCoefficient,
    'MB_RepairRequestNoteViewModel': mbRepairRequestNoteViewModel,
    'ListMB_RepairRequestNoteViewModel': listMbRepairRequestNoteViewModel
        ?.map((e) => e.toJson())
        .toList(),
    'ListTechnicalLeader': listTechnicalLeader?.map((e) => e.toJson()).toList(),
    'ListTechnicalStaff': listTechnicalStaff,
    'MB_RepairRequestOverdueViewModel': mbRepairRequestOverdueViewModel,
    'ListMB_RepairRequestOverdueViewModel': listMbRepairRequestOverdueViewModel,
    'ListMB_RepairRequestMaterialViewModel':
        listMbRepairRequestMaterialViewModel?.map((e) => e.toJson()).toList(),
    'ListMB_ModemLogViewModel': listMbModemLogViewModel
        ?.map((e) => e.toJson())
        .toList(),
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
    'CustomersID_PhoneNumber': customersIdPhoneNumber,
    'CustomersID_Code': customersIdCode,
    'ServiceID_Title': serviceIdTitle,
    'CreatedBy_Email': createdByEmail,
    'CreatedBy_UserName': createdByUserName,
    'Progress': progress,
    'Progress_Title': progressTitle,
    'Type_Title': typeTitle,
    'SurveyStatus_Title': surveyStatusTitle,
    'TechnicalLeader_UserName': technicalLeaderUserName,
    'TechnicalStaff_UserName': technicalStaffUserName,
    'List_ListError': listListError?.map((e) => e.toJson()).toList(),
  };
}
