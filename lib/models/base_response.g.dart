// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BaseResponseModel<T> _$BaseResponseModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _BaseResponseModel<T>(
  count: (json['count'] as num?)?.toInt(),
  next: json['next'] as String?,
  results: _$nullableGenericFromJson(json['results'], fromJsonT),
  previous: json['previous'] as String?,
);

Map<String, dynamic> _$BaseResponseModelToJson<T>(
  _BaseResponseModel<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'results': _$nullableGenericToJson(instance.results, toJsonT),
  'previous': instance.previous,
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);
