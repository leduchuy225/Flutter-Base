class GetMaterialListModelResponse {
  int? id;
  int? idLong;
  String? title;
  dynamic price;
  dynamic priceOld;
  dynamic priceImport;
  dynamic unitId;
  dynamic status;
  dynamic orders;
  dynamic createdBy;
  dynamic createdDate;
  dynamic modifiedDate;
  dynamic modifiedBy;
  dynamic deleteStatus;
  dynamic deleteBy;
  dynamic deleteDate;
  dynamic image;
  dynamic setDefault;
  dynamic createdByEmail;
  dynamic createdByUserName;
  dynamic modifiedByEmail;
  dynamic modifiedByUserName;
  String? unitIdTitle;

  GetMaterialListModelResponse({
    this.id,
    this.idLong,
    this.title,
    this.price,
    this.priceOld,
    this.priceImport,
    this.unitId,
    this.status,
    this.orders,
    this.createdBy,
    this.createdDate,
    this.modifiedDate,
    this.modifiedBy,
    this.deleteStatus,
    this.deleteBy,
    this.deleteDate,
    this.image,
    this.setDefault,
    this.createdByEmail,
    this.createdByUserName,
    this.modifiedByEmail,
    this.modifiedByUserName,
    this.unitIdTitle,
  });

  factory GetMaterialListModelResponse.fromJson(Map<String, dynamic> json) {
    return GetMaterialListModelResponse(
      id: json['ID'] as int?,
      idLong: json['IDLong'] as int?,
      title: json['Title'] as String?,
      price: json['Price'] as dynamic,
      priceOld: json['PriceOld'] as dynamic,
      priceImport: json['PriceImport'] as dynamic,
      unitId: json['UnitId'] as dynamic,
      status: json['Status'] as dynamic,
      orders: json['Orders'] as dynamic,
      createdBy: json['CreatedBy'] as dynamic,
      createdDate: json['CreatedDate'] as dynamic,
      modifiedDate: json['ModifiedDate'] as dynamic,
      modifiedBy: json['ModifiedBy'] as dynamic,
      deleteStatus: json['DeleteStatus'] as dynamic,
      deleteBy: json['DeleteBy'] as dynamic,
      deleteDate: json['DeleteDate'] as dynamic,
      image: json['Image'] as dynamic,
      setDefault: json['SetDefault'] as dynamic,
      createdByEmail: json['CreatedBy_Email'] as dynamic,
      createdByUserName: json['CreatedBy_UserName'] as dynamic,
      modifiedByEmail: json['ModifiedBy_Email'] as dynamic,
      modifiedByUserName: json['ModifiedBy_UserName'] as dynamic,
      unitIdTitle: json['UnitId_Title'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'ID': id,
    'IDLong': idLong,
    'Title': title,
    'Price': price,
    'PriceOld': priceOld,
    'PriceImport': priceImport,
    'UnitId': unitId,
    'Status': status,
    'Orders': orders,
    'CreatedBy': createdBy,
    'CreatedDate': createdDate,
    'ModifiedDate': modifiedDate,
    'ModifiedBy': modifiedBy,
    'DeleteStatus': deleteStatus,
    'DeleteBy': deleteBy,
    'DeleteDate': deleteDate,
    'Image': image,
    'SetDefault': setDefault,
    'CreatedBy_Email': createdByEmail,
    'CreatedBy_UserName': createdByUserName,
    'ModifiedBy_Email': modifiedByEmail,
    'ModifiedBy_UserName': modifiedByUserName,
    'UnitId_Title': unitIdTitle,
  };
}
