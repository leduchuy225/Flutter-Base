class ForgotPasswordPayload {
  String? email;

  ForgotPasswordPayload({this.email});

  factory ForgotPasswordPayload.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordPayload(email: json['Email'] as String?);
  }

  Map<String, dynamic> toJson() => {'Email': email};
}
