import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/const/constants.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class BaseResponse<T> with _$BaseResponse<T> {
  factory BaseResponse({
    @JsonKey(name: 'data') final T? data,
    @JsonKey(name: 'msg') final String? message,
    @JsonKey(name: 'status', defaultValue: MyStatus.success) final int? code,
  }) = _BaseResponse;

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$BaseResponseFromJson(json, fromJsonT);
}
