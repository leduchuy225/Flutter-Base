class ChangePasswordPayload {
  String? oldPassword;
  String? newPassword;
  String? confirmPassword;
  bool? sendMail;

  ChangePasswordPayload({
    this.oldPassword,
    this.newPassword,
    this.confirmPassword,
    this.sendMail,
  });

  factory ChangePasswordPayload.fromJson(Map<String, dynamic> json) {
    return ChangePasswordPayload(
      oldPassword: json['OldPassword'] as String?,
      newPassword: json['NewPassword'] as String?,
      confirmPassword: json['ConfirmPassword'] as String?,
      sendMail: json['SendMail'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
    'OldPassword': oldPassword,
    'NewPassword': newPassword,
    'ConfirmPassword': confirmPassword,
    'SendMail': sendMail,
  };
}
