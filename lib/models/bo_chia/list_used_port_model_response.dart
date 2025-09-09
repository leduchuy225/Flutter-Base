class ListUsedPortModelResponse {
  int? id;
  int? idLong;
  int? status;

  ListUsedPortModelResponse({this.id, this.idLong, this.status});

  factory ListUsedPortModelResponse.fromJson(Map<String, dynamic> json) {
    return ListUsedPortModelResponse(
      id: json['ID'] as int?,
      idLong: json['IDLong'] as int?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'ID': id,
    'IDLong': idLong,
    'Status': status,
  };
}
