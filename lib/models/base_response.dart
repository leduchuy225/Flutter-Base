import 'package:json_annotation/json_annotation.dart';

part './base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class BaseResponseModel<T> {
  @JsonKey(name: 'count')
  final int? count;
  @JsonKey(name: 'next')
  final String? next;
  @JsonKey(name: 'previous')
  final String? previous;
  @JsonKey(name: 'results')
  final T? results;

  BaseResponseModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory BaseResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) =>
      _$BaseResponseModelFromJson(json, fromJsonT);
}
