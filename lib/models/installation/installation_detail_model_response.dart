import '../common/customer_viewmodel_response.dart';
import '../common/note_viewmodel_response.dart';
import '../common/technical_staff_list_model_response.dart';
import 'material_list_model_response.dart';

class InstallationDetailModelResponse {
  num? id;
  num? idLong;
  num? currentStep;
  num? customersId;
  num? serviceId;
  num? type;
  String? contractCode;
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
  num? devicePort;
  String? deviceAcc;
  String? devicePass;
  num? deviceStatus;
  String? reportAcceptance;
  String? reportHandoverDevice;
  dynamic reportAcceptanceIsSign;
  dynamic reportHandoverDeviceIsSign;
  dynamic staffCode;
  String? staffFullName;
  String? staffPhoneNumber;
  dynamic technicalStaffReportCompletedDate;
  bool? isCompletedStaffOn;
  num? reportDistance;
  dynamic reportResult;
  String? reportImageDivider;
  String? reportCableLengthStart;
  String? reportCableLengthEnd;
  num? cableLength;
  num? cableLengthStart;
  num? cableLengthEnd;
  String? reportNew;
  dynamic reportNewIsSet;
  num? slidId;
  num? slidIdLong;
  dynamic dividerId;
  dynamic dividerIdLong;
  CustomerViewmodelResponse? mbCustomerViewModel;
  dynamic mbConnectionRequestNoteViewModel;
  List<NoteViewmodelResponse>? listMbConnectionRequestNoteViewModel;
  dynamic listMbConnectionRequestNoteViewModel2;
  List<TechnicalStaffListModelResponse>? listTechnicalLeader;
  dynamic listTechnicalStaff;
  dynamic mbConnectionRequestOverdueViewModel;
  List<NoteViewmodelResponse>? listMbConnectionRequestOverdueViewModel;
  List<MaterialListModelResponse>? listMbConnectionRequestMaterialViewModel;
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
  dynamic customersIdUserName;
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
  String? slidCode;
  dynamic dividerCode;
  num? oltId;
  num? oltIdLong;
  dynamic oltCode;
  num? ponidId;
  num? ponidIdLong;
  dynamic ponidCode;

  InstallationDetailModelResponse({
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
    this.expectedCompletionDate,
    this.actualCompletionDate,
    this.devicePort,
    this.deviceAcc,
    this.devicePass,
    this.deviceStatus,
    this.reportAcceptance,
    this.reportHandoverDevice,
    this.reportAcceptanceIsSign,
    this.reportHandoverDeviceIsSign,
    this.staffCode,
    this.staffFullName,
    this.staffPhoneNumber,
    this.technicalStaffReportCompletedDate,
    this.isCompletedStaffOn,
    this.reportDistance,
    this.reportResult,
    this.reportImageDivider,
    this.reportCableLengthStart,
    this.reportCableLengthEnd,
    this.cableLength,
    this.cableLengthStart,
    this.cableLengthEnd,
    this.reportNew,
    this.reportNewIsSet,
    this.slidId,
    this.slidIdLong,
    this.dividerId,
    this.dividerIdLong,
    this.mbCustomerViewModel,
    this.mbConnectionRequestNoteViewModel,
    this.listMbConnectionRequestNoteViewModel,
    this.listMbConnectionRequestNoteViewModel2,
    this.listTechnicalLeader,
    this.listTechnicalStaff,
    this.mbConnectionRequestOverdueViewModel,
    this.listMbConnectionRequestOverdueViewModel,
    this.listMbConnectionRequestMaterialViewModel,
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
    this.customersIdUserName,
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
    this.slidCode,
    this.dividerCode,
    this.oltId,
    this.oltIdLong,
    this.oltCode,
    this.ponidId,
    this.ponidIdLong,
    this.ponidCode,
  });

  factory InstallationDetailModelResponse.fromJson(Map<String, dynamic> json) {
    return InstallationDetailModelResponse(
      id: json['ID'] as num?,
      idLong: json['IDLong'] as num?,
      currentStep: json['CurrentStep'] as num?,
      customersId: json['CustomersID'] as num?,
      serviceId: json['ServiceID'] as num?,
      type: json['Type'] as num?,
      contractCode: json['ContractCode'] as String?,
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
      devicePort: json['Device_Port'] as num?,
      deviceAcc: json['Device_ACC'] as String?,
      devicePass: json['Device_Pass'] as String?,
      deviceStatus: json['Device_Status'] as num?,
      reportAcceptance: json['Report_Acceptance'] as String?,
      reportHandoverDevice: json['Report_HandoverDevice'] as String?,
      reportAcceptanceIsSign: json['Report_Acceptance_IsSign'] as dynamic,
      reportHandoverDeviceIsSign:
          json['Report_HandoverDevice_IsSign'] as dynamic,
      staffCode: json['StaffCode'] as dynamic,
      staffFullName: json['StaffFullName'] as String?,
      staffPhoneNumber: json['StaffPhoneNumber'] as String?,
      technicalStaffReportCompletedDate:
          json['TechnicalStaffReportCompletedDate'] as dynamic,
      isCompletedStaffOn: json['IsCompletedStaffOn'] as bool?,
      reportDistance: json['Report_Distance'] as num?,
      reportResult: json['Report_Result'] as dynamic,
      reportImageDivider: json['Report_ImageDivider'] as String?,
      reportCableLengthStart: json['Report_CableLengthStart'] as String?,
      reportCableLengthEnd: json['Report_CableLengthEnd'] as String?,
      cableLength: json['CableLength'] as num?,
      cableLengthStart: json['CableLengthStart'] as num?,
      cableLengthEnd: json['CableLengthEnd'] as num?,
      reportNew: json['Report_New'] as String?,
      reportNewIsSet: json['Report_New_IsSet'] as dynamic,
      slidId: json['SLID_ID'] as num?,
      slidIdLong: json['SLID_IDLong'] as num?,
      dividerId: json['Divider_ID'] as dynamic,
      dividerIdLong: json['Divider_IDLong'] as dynamic,
      mbCustomerViewModel: json['MB_CustomerViewModel'] == null
          ? null
          : CustomerViewmodelResponse.fromJson(
              json['MB_CustomerViewModel'] as Map<String, dynamic>,
            ),
      mbConnectionRequestNoteViewModel:
          json['MB_ConnectionRequestNoteViewModel'] as dynamic,
      listMbConnectionRequestNoteViewModel:
          (json['ListMB_ConnectionRequestNoteViewModel'] as List<dynamic>?)
              ?.map(
                (e) =>
                    NoteViewmodelResponse.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      listMbConnectionRequestNoteViewModel2:
          json['ListMB_ConnectionRequestNoteViewModel2'] as dynamic,
      listTechnicalLeader: (json['ListTechnicalLeader'] as List<dynamic>?)
          ?.map(
            (e) => TechnicalStaffListModelResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      listTechnicalStaff: json['ListTechnicalStaff'] as dynamic,
      mbConnectionRequestOverdueViewModel:
          json['MB_ConnectionRequestOverdueViewModel'] as dynamic,
      listMbConnectionRequestOverdueViewModel:
          (json['ListMB_ConnectionRequestOverdueViewModel'] as List<dynamic>?)
              ?.map(
                (e) =>
                    NoteViewmodelResponse.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      listMbConnectionRequestMaterialViewModel:
          (json['ListMB_ConnectionRequestMaterialViewModel'] as List<dynamic>?)
              ?.map(
                (e) => MaterialListModelResponse.fromJson(
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
      customersIdUserName: json['CustomersID_UserName'] as dynamic,
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
      slidCode: json['SLID_Code'] as String?,
      dividerCode: json['Divider_Code'] as dynamic,
      oltId: json['OLT_ID'] as num?,
      oltIdLong: json['OLT_IDLong'] as num?,
      oltCode: json['OLT_Code'] as dynamic,
      ponidId: json['PONID_ID'] as num?,
      ponidIdLong: json['PONID_IDLong'] as num?,
      ponidCode: json['PONID_Code'] as dynamic,
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
    'ExpectedCompletionDate': expectedCompletionDate,
    'ActualCompletionDate': actualCompletionDate,
    'Device_Port': devicePort,
    'Device_ACC': deviceAcc,
    'Device_Pass': devicePass,
    'Device_Status': deviceStatus,
    'Report_Acceptance': reportAcceptance,
    'Report_HandoverDevice': reportHandoverDevice,
    'Report_Acceptance_IsSign': reportAcceptanceIsSign,
    'Report_HandoverDevice_IsSign': reportHandoverDeviceIsSign,
    'StaffCode': staffCode,
    'StaffFullName': staffFullName,
    'StaffPhoneNumber': staffPhoneNumber,
    'TechnicalStaffReportCompletedDate': technicalStaffReportCompletedDate,
    'IsCompletedStaffOn': isCompletedStaffOn,
    'Report_Distance': reportDistance,
    'Report_Result': reportResult,
    'Report_ImageDivider': reportImageDivider,
    'Report_CableLengthStart': reportCableLengthStart,
    'Report_CableLengthEnd': reportCableLengthEnd,
    'CableLength': cableLength,
    'CableLengthStart': cableLengthStart,
    'CableLengthEnd': cableLengthEnd,
    'Report_New': reportNew,
    'Report_New_IsSet': reportNewIsSet,
    'SLID_ID': slidId,
    'SLID_IDLong': slidIdLong,
    'Divider_ID': dividerId,
    'Divider_IDLong': dividerIdLong,
    'MB_CustomerViewModel': mbCustomerViewModel?.toJson(),
    'MB_ConnectionRequestNoteViewModel': mbConnectionRequestNoteViewModel,
    'ListMB_ConnectionRequestNoteViewModel':
        listMbConnectionRequestNoteViewModel?.map((e) => e.toJson()).toList(),
    'ListMB_ConnectionRequestNoteViewModel2':
        listMbConnectionRequestNoteViewModel2,
    'ListTechnicalLeader': listTechnicalLeader?.map((e) => e.toJson()).toList(),
    'ListTechnicalStaff': listTechnicalStaff,
    'MB_ConnectionRequestOverdueViewModel': mbConnectionRequestOverdueViewModel,
    'ListMB_ConnectionRequestOverdueViewModel':
        listMbConnectionRequestOverdueViewModel
            ?.map((e) => e.toJson())
            .toList(),
    'ListMB_ConnectionRequestMaterialViewModel':
        listMbConnectionRequestMaterialViewModel
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
    'CustomersID_UserName': customersIdUserName,
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
    'SLID_Code': slidCode,
    'Divider_Code': dividerCode,
    'OLT_ID': oltId,
    'OLT_IDLong': oltIdLong,
    'OLT_Code': oltCode,
    'PONID_ID': ponidId,
    'PONID_IDLong': ponidIdLong,
    'PONID_Code': ponidCode,
  };
}
