import '../common/role_response.dart';
import 'installation_list_model_response.dart';

class InstallationListResponse {
  List<InstallationListModelResponse>? model;
  num? totalItems;
  RoleResponse? role;

  InstallationListResponse({this.model, this.totalItems, this.role});

  factory InstallationListResponse.fromJson(Map<String, dynamic> json) {
    return InstallationListResponse(
      model: (json['model'] as List<dynamic>?)
          ?.map(
            (e) => InstallationListModelResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      totalItems: json['totalItems'] as num?,
      role: json['role'] == null
          ? null
          : RoleResponse.fromJson(json['role'] as Map<String, dynamic>),
    );
  }

  // Map<String, dynamic> toJson() => {
  //   'model': model?.map((e) => e.toJson()).toList(),
  //   'totalItems': totalItems,
  //   'role': role?.toJson(),
  // };
}
