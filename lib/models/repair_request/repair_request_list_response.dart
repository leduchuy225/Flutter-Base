import 'package:flutter_base/models/installation/role_response.dart';

import 'repair_request_list_model_response.dart';

class RepairRequestListResponse {
  List<RepairRequestListModelResponse>? model;
  int? totalItems;
  RoleResponse? role;

  RepairRequestListResponse({this.model, this.totalItems, this.role});

  factory RepairRequestListResponse.fromJson(Map<String, dynamic> json) {
    return RepairRequestListResponse(
      model: (json['model'] as List<dynamic>?)
          ?.map(
            (e) => RepairRequestListModelResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      totalItems: json['totalItems'] as int?,
      role: json['role'] == null
          ? null
          : RoleResponse.fromJson(json['role'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'model': model?.map((e) => e.toJson()).toList(),
    'totalItems': totalItems,
    'role': role?.toJson(),
  };
}
