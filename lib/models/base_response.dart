import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class BaseResponseModel<T> with _$BaseResponseModel<T> {
  factory BaseResponseModel({
    @JsonKey(name: 'data') final T? data,
    @JsonKey(name: 'status') final int? code,
    @JsonKey(name: 'msg') final String? message,
  }) = _BaseResponseModel;

  factory BaseResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$BaseResponseModelFromJson(json, fromJsonT);
}
