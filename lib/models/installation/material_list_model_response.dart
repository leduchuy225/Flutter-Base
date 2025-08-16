class MaterialListModelResponse {
  num? id;
  num? materialId;
  dynamic materialIdLong;
  num? parentId;
  dynamic parentIdLong;
  num? quantity;
  dynamic price;
  dynamic priceOld;
  dynamic priceImport;
  num? unitId;
  dynamic status;
  dynamic createdBy;
  dynamic createdDate;
  dynamic modifiedDate;
  dynamic modifiedBy;
  dynamic deleteStatus;
  dynamic deleteBy;
  dynamic deleteDate;
  dynamic setDefault;
  dynamic createdByEmail;
  dynamic createdByUserName;
  dynamic modifiedByEmail;
  dynamic modifiedByUserName;
  String? materialTitle;
  String? unitIdTitle;

  MaterialListModelResponse({
    this.id,
    this.materialId,
    this.materialIdLong,
    this.parentId,
    this.parentIdLong,
    this.quantity,
    this.price,
    this.priceOld,
    this.priceImport,
    this.unitId,
    this.status,
    this.createdBy,
    this.createdDate,
    this.modifiedDate,
    this.modifiedBy,
    this.deleteStatus,
    this.deleteBy,
    this.deleteDate,
    this.setDefault,
    this.createdByEmail,
    this.createdByUserName,
    this.modifiedByEmail,
    this.modifiedByUserName,
    this.materialTitle,
    this.unitIdTitle,
  });

  factory MaterialListModelResponse.fromJson(Map<String, dynamic> json) {
    return MaterialListModelResponse(
      id: json['ID'] as num?,
      materialId: json['Material_ID'] as num?,
      materialIdLong: json['Material_IDLong'] as dynamic,
      parentId: json['Parent_ID'] as num?,
      parentIdLong: json['Parent_IDLong'] as dynamic,
      quantity: json['Quantity'] as num?,
      price: json['Price'] as dynamic,
      priceOld: json['PriceOld'] as dynamic,
      priceImport: json['PriceImport'] as dynamic,
      unitId: json['UnitId'] as num?,
      status: json['Status'] as dynamic,
      createdBy: json['CreatedBy'] as dynamic,
      createdDate: json['CreatedDate'] as dynamic,
      modifiedDate: json['ModifiedDate'] as dynamic,
      modifiedBy: json['ModifiedBy'] as dynamic,
      deleteStatus: json['DeleteStatus'] as dynamic,
      deleteBy: json['DeleteBy'] as dynamic,
      deleteDate: json['DeleteDate'] as dynamic,
      setDefault: json['SetDefault'] as dynamic,
      createdByEmail: json['CreatedBy_Email'] as dynamic,
      createdByUserName: json['CreatedBy_UserName'] as dynamic,
      modifiedByEmail: json['ModifiedBy_Email'] as dynamic,
      modifiedByUserName: json['ModifiedBy_UserName'] as dynamic,
      materialTitle: json['Material_Title'] as String?,
      unitIdTitle: json['UnitId_Title'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'ID': id,
    'Material_ID': materialId,
    'Material_IDLong': materialIdLong,
    'Parent_ID': parentId,
    'Parent_IDLong': parentIdLong,
    'Quantity': quantity,
    'Price': price,
    'PriceOld': priceOld,
    'PriceImport': priceImport,
    'UnitId': unitId,
    'Status': status,
    'CreatedBy': createdBy,
    'CreatedDate': createdDate,
    'ModifiedDate': modifiedDate,
    'ModifiedBy': modifiedBy,
    'DeleteStatus': deleteStatus,
    'DeleteBy': deleteBy,
    'DeleteDate': deleteDate,
    'SetDefault': setDefault,
    'CreatedBy_Email': createdByEmail,
    'CreatedBy_UserName': createdByUserName,
    'ModifiedBy_Email': modifiedByEmail,
    'ModifiedBy_UserName': modifiedByUserName,
    'Material_Title': materialTitle,
    'UnitId_Title': unitIdTitle,
  };
}
