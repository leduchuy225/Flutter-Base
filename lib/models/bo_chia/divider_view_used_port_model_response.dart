import 'list_used_port_model_response.dart';

class DividerViewUsedPortModelResponse {
  int? port;
  int? status;
  dynamic idLong;
  List<ListUsedPortModelResponse>? listUsedPortModel;

  DividerViewUsedPortModelResponse({
    this.port,
    this.status,
    this.idLong,
    this.listUsedPortModel,
  });

  factory DividerViewUsedPortModelResponse.fromJson(Map<String, dynamic> json) {
    return DividerViewUsedPortModelResponse(
      port: json['Port'] as int?,
      status: json['Status'] as int?,
      idLong: json['IDLong'] as dynamic,
      listUsedPortModel: (json['ListUsedPortModel'] as List<dynamic>?)
          ?.map(
            (e) =>
                ListUsedPortModelResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'Port': port,
    'Status': status,
    'IDLong': idLong,
    'ListUsedPortModel': listUsedPortModel?.map((e) => e.toJson()).toList(),
  };
}
