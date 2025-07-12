class TechnicalStaffResponse {
  String? id;
  int? idNew;
  String? email;
  bool? emailConfirmed;
  dynamic passwordHash;
  dynamic securityStamp;
  dynamic phoneNumber;
  bool? phoneNumberConfirmed;
  dynamic address;
  bool? twoFactorEnabled;
  dynamic lockoutEndDateUtc;
  bool? lockoutEnabled;
  int? accessFailedCount;
  dynamic userName;
  dynamic fullName;
  String? avatar;
  bool? status;
  dynamic createdBy;
  dynamic createdDate;
  dynamic modifiedDate;
  dynamic modifiedBy;
  dynamic gioiTinh;
  dynamic deleteStatus;
  dynamic deleteBy;
  dynamic deleteDate;
  dynamic tienTong;
  dynamic tienTrue;
  dynamic tienFalse;
  dynamic tienStatus;
  dynamic tienBlock;
  dynamic gCoinAll;
  dynamic gCoinTrue;
  dynamic gCoinFalse;
  dynamic gCoinStatus;
  dynamic gCoinBlock;
  dynamic ngaySinh;
  dynamic summary;
  dynamic contents;
  dynamic linkFaceBook;
  dynamic linkTwitter;
  dynamic linkedin;
  dynamic linkGoogle;
  dynamic linkYoutube;
  dynamic linkPinterest;
  dynamic linkInstagram;
  dynamic linkSnapchat;
  dynamic linkTiktok;
  dynamic resetPasswordKey;
  dynamic resetPasswordDate;
  dynamic resetPasswordCount;
  dynamic resetPasswordIp;
  dynamic resetPasswordUserAgent;
  dynamic aspRole;
  dynamic userDefau;
  dynamic confirmPassword;
  dynamic roles;
  dynamic gaStatus;
  dynamic gaKey;
  dynamic gaPass;
  dynamic gaStartDate;
  dynamic gaEndDate;
  dynamic metaTitle;
  dynamic parent;
  dynamic listParent;
  dynamic company;
  dynamic website;
  dynamic jobInCompany;
  dynamic industryField;
  dynamic groupName;
  dynamic jobInGroup;
  dynamic moreInformation;
  dynamic banner;
  dynamic background;
  dynamic vip;
  dynamic rankUser;
  dynamic countryId;
  dynamic thanhPhoId;
  dynamic quanHuyenId;
  dynamic phuongXaId;
  dynamic token;
  dynamic googleMap;
  dynamic webId;
  dynamic transactionLock;
  dynamic cccd;
  dynamic lastLogin;
  dynamic position;
  dynamic countryName;
  dynamic thanhPhoName;
  dynamic quanHuyenName;
  dynamic phuongXaName;
  int? parentLevel;

  TechnicalStaffResponse({
    this.id,
    this.idNew,
    this.email,
    this.emailConfirmed,
    this.passwordHash,
    this.securityStamp,
    this.phoneNumber,
    this.phoneNumberConfirmed,
    this.address,
    this.twoFactorEnabled,
    this.lockoutEndDateUtc,
    this.lockoutEnabled,
    this.accessFailedCount,
    this.userName,
    this.fullName,
    this.avatar,
    this.status,
    this.createdBy,
    this.createdDate,
    this.modifiedDate,
    this.modifiedBy,
    this.gioiTinh,
    this.deleteStatus,
    this.deleteBy,
    this.deleteDate,
    this.tienTong,
    this.tienTrue,
    this.tienFalse,
    this.tienStatus,
    this.tienBlock,
    this.gCoinAll,
    this.gCoinTrue,
    this.gCoinFalse,
    this.gCoinStatus,
    this.gCoinBlock,
    this.ngaySinh,
    this.summary,
    this.contents,
    this.linkFaceBook,
    this.linkTwitter,
    this.linkedin,
    this.linkGoogle,
    this.linkYoutube,
    this.linkPinterest,
    this.linkInstagram,
    this.linkSnapchat,
    this.linkTiktok,
    this.resetPasswordKey,
    this.resetPasswordDate,
    this.resetPasswordCount,
    this.resetPasswordIp,
    this.resetPasswordUserAgent,
    this.aspRole,
    this.userDefau,
    this.confirmPassword,
    this.roles,
    this.gaStatus,
    this.gaKey,
    this.gaPass,
    this.gaStartDate,
    this.gaEndDate,
    this.metaTitle,
    this.parent,
    this.listParent,
    this.company,
    this.website,
    this.jobInCompany,
    this.industryField,
    this.groupName,
    this.jobInGroup,
    this.moreInformation,
    this.banner,
    this.background,
    this.vip,
    this.rankUser,
    this.countryId,
    this.thanhPhoId,
    this.quanHuyenId,
    this.phuongXaId,
    this.token,
    this.googleMap,
    this.webId,
    this.transactionLock,
    this.cccd,
    this.lastLogin,
    this.position,
    this.countryName,
    this.thanhPhoName,
    this.quanHuyenName,
    this.phuongXaName,
    this.parentLevel,
  });

  factory TechnicalStaffResponse.fromJson(Map<String, dynamic> json) {
    return TechnicalStaffResponse(
      id: json['Id'] as String?,
      idNew: json['IDNew'] as int?,
      email: json['Email'] as String?,
      emailConfirmed: json['EmailConfirmed'] as bool?,
      passwordHash: json['PasswordHash'] as dynamic,
      securityStamp: json['SecurityStamp'] as dynamic,
      phoneNumber: json['PhoneNumber'] as dynamic,
      phoneNumberConfirmed: json['PhoneNumberConfirmed'] as bool?,
      address: json['Address'] as dynamic,
      twoFactorEnabled: json['TwoFactorEnabled'] as bool?,
      lockoutEndDateUtc: json['LockoutEndDateUtc'] as dynamic,
      lockoutEnabled: json['LockoutEnabled'] as bool?,
      accessFailedCount: json['AccessFailedCount'] as int?,
      userName: json['UserName'] as dynamic,
      fullName: json['FullName'] as dynamic,
      avatar: json['Avatar'] as String?,
      status: json['Status'] as bool?,
      createdBy: json['CreatedBy'] as dynamic,
      createdDate: json['CreatedDate'] as dynamic,
      modifiedDate: json['ModifiedDate'] as dynamic,
      modifiedBy: json['ModifiedBy'] as dynamic,
      gioiTinh: json['GioiTinh'] as dynamic,
      deleteStatus: json['DeleteStatus'] as dynamic,
      deleteBy: json['DeleteBy'] as dynamic,
      deleteDate: json['DeleteDate'] as dynamic,
      tienTong: json['TienTong'] as dynamic,
      tienTrue: json['TienTrue'] as dynamic,
      tienFalse: json['TienFalse'] as dynamic,
      tienStatus: json['TienStatus'] as dynamic,
      tienBlock: json['TienBlock'] as dynamic,
      gCoinAll: json['GCoinAll'] as dynamic,
      gCoinTrue: json['GCoinTrue'] as dynamic,
      gCoinFalse: json['GCoinFalse'] as dynamic,
      gCoinStatus: json['GCoinStatus'] as dynamic,
      gCoinBlock: json['GCoinBlock'] as dynamic,
      ngaySinh: json['NgaySinh'] as dynamic,
      summary: json['Summary'] as dynamic,
      contents: json['Contents'] as dynamic,
      linkFaceBook: json['LinkFaceBook'] as dynamic,
      linkTwitter: json['LinkTwitter'] as dynamic,
      linkedin: json['Linkedin'] as dynamic,
      linkGoogle: json['LinkGoogle'] as dynamic,
      linkYoutube: json['LinkYoutube'] as dynamic,
      linkPinterest: json['LinkPinterest'] as dynamic,
      linkInstagram: json['LinkInstagram'] as dynamic,
      linkSnapchat: json['LinkSnapchat'] as dynamic,
      linkTiktok: json['LinkTiktok'] as dynamic,
      resetPasswordKey: json['ResetPasswordKey'] as dynamic,
      resetPasswordDate: json['ResetPasswordDate'] as dynamic,
      resetPasswordCount: json['ResetPasswordCount'] as dynamic,
      resetPasswordIp: json['ResetPasswordIp'] as dynamic,
      resetPasswordUserAgent: json['ResetPasswordUserAgent'] as dynamic,
      aspRole: json['AspRole'] as dynamic,
      userDefau: json['UserDefau'] as dynamic,
      confirmPassword: json['ConfirmPassword'] as dynamic,
      roles: json['Roles'] as dynamic,
      gaStatus: json['GA_Status'] as dynamic,
      gaKey: json['GA_Key'] as dynamic,
      gaPass: json['GA_Pass'] as dynamic,
      gaStartDate: json['GA_StartDate'] as dynamic,
      gaEndDate: json['GA_EndDate'] as dynamic,
      metaTitle: json['MetaTitle'] as dynamic,
      parent: json['Parent'] as dynamic,
      listParent: json['ListParent'] as dynamic,
      company: json['Company'] as dynamic,
      website: json['Website'] as dynamic,
      jobInCompany: json['JobInCompany'] as dynamic,
      industryField: json['IndustryField'] as dynamic,
      groupName: json['GroupName'] as dynamic,
      jobInGroup: json['JobInGroup'] as dynamic,
      moreInformation: json['MoreInformation'] as dynamic,
      banner: json['Banner'] as dynamic,
      background: json['Background'] as dynamic,
      vip: json['Vip'] as dynamic,
      rankUser: json['RankUser'] as dynamic,
      countryId: json['CountryId'] as dynamic,
      thanhPhoId: json['ThanhPhoId'] as dynamic,
      quanHuyenId: json['QuanHuyenId'] as dynamic,
      phuongXaId: json['PhuongXaId'] as dynamic,
      token: json['Token'] as dynamic,
      googleMap: json['GoogleMap'] as dynamic,
      webId: json['WebID'] as dynamic,
      transactionLock: json['TransactionLock'] as dynamic,
      cccd: json['CCCD'] as dynamic,
      lastLogin: json['LastLogin'] as dynamic,
      position: json['Position'] as dynamic,
      countryName: json['CountryName'] as dynamic,
      thanhPhoName: json['ThanhPhoName'] as dynamic,
      quanHuyenName: json['QuanHuyenName'] as dynamic,
      phuongXaName: json['PhuongXaName'] as dynamic,
      parentLevel: json['Parent_Level'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'Id': id,
    'IDNew': idNew,
    'Email': email,
    'EmailConfirmed': emailConfirmed,
    'PasswordHash': passwordHash,
    'SecurityStamp': securityStamp,
    'PhoneNumber': phoneNumber,
    'PhoneNumberConfirmed': phoneNumberConfirmed,
    'Address': address,
    'TwoFactorEnabled': twoFactorEnabled,
    'LockoutEndDateUtc': lockoutEndDateUtc,
    'LockoutEnabled': lockoutEnabled,
    'AccessFailedCount': accessFailedCount,
    'UserName': userName,
    'FullName': fullName,
    'Avatar': avatar,
    'Status': status,
    'CreatedBy': createdBy,
    'CreatedDate': createdDate,
    'ModifiedDate': modifiedDate,
    'ModifiedBy': modifiedBy,
    'GioiTinh': gioiTinh,
    'DeleteStatus': deleteStatus,
    'DeleteBy': deleteBy,
    'DeleteDate': deleteDate,
    'TienTong': tienTong,
    'TienTrue': tienTrue,
    'TienFalse': tienFalse,
    'TienStatus': tienStatus,
    'TienBlock': tienBlock,
    'GCoinAll': gCoinAll,
    'GCoinTrue': gCoinTrue,
    'GCoinFalse': gCoinFalse,
    'GCoinStatus': gCoinStatus,
    'GCoinBlock': gCoinBlock,
    'NgaySinh': ngaySinh,
    'Summary': summary,
    'Contents': contents,
    'LinkFaceBook': linkFaceBook,
    'LinkTwitter': linkTwitter,
    'Linkedin': linkedin,
    'LinkGoogle': linkGoogle,
    'LinkYoutube': linkYoutube,
    'LinkPinterest': linkPinterest,
    'LinkInstagram': linkInstagram,
    'LinkSnapchat': linkSnapchat,
    'LinkTiktok': linkTiktok,
    'ResetPasswordKey': resetPasswordKey,
    'ResetPasswordDate': resetPasswordDate,
    'ResetPasswordCount': resetPasswordCount,
    'ResetPasswordIp': resetPasswordIp,
    'ResetPasswordUserAgent': resetPasswordUserAgent,
    'AspRole': aspRole,
    'UserDefau': userDefau,
    'ConfirmPassword': confirmPassword,
    'Roles': roles,
    'GA_Status': gaStatus,
    'GA_Key': gaKey,
    'GA_Pass': gaPass,
    'GA_StartDate': gaStartDate,
    'GA_EndDate': gaEndDate,
    'MetaTitle': metaTitle,
    'Parent': parent,
    'ListParent': listParent,
    'Company': company,
    'Website': website,
    'JobInCompany': jobInCompany,
    'IndustryField': industryField,
    'GroupName': groupName,
    'JobInGroup': jobInGroup,
    'MoreInformation': moreInformation,
    'Banner': banner,
    'Background': background,
    'Vip': vip,
    'RankUser': rankUser,
    'CountryId': countryId,
    'ThanhPhoId': thanhPhoId,
    'QuanHuyenId': quanHuyenId,
    'PhuongXaId': phuongXaId,
    'Token': token,
    'GoogleMap': googleMap,
    'WebID': webId,
    'TransactionLock': transactionLock,
    'CCCD': cccd,
    'LastLogin': lastLogin,
    'Position': position,
    'CountryName': countryName,
    'ThanhPhoName': thanhPhoName,
    'QuanHuyenName': quanHuyenName,
    'PhuongXaName': phuongXaName,
    'Parent_Level': parentLevel,
  };
}
