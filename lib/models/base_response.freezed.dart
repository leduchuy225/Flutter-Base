// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BaseResponseModel<T> {

@JsonKey(name: 'data') T? get data;@JsonKey(name: 'code') int? get code;@JsonKey(name: 'message') String? get message;
/// Create a copy of BaseResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BaseResponseModelCopyWith<T, BaseResponseModel<T>> get copyWith => _$BaseResponseModelCopyWithImpl<T, BaseResponseModel<T>>(this as BaseResponseModel<T>, _$identity);

  /// Serializes this BaseResponseModel to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseResponseModel<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),code,message);

@override
String toString() {
  return 'BaseResponseModel<$T>(data: $data, code: $code, message: $message)';
}


}

/// @nodoc
abstract mixin class $BaseResponseModelCopyWith<T,$Res>  {
  factory $BaseResponseModelCopyWith(BaseResponseModel<T> value, $Res Function(BaseResponseModel<T>) _then) = _$BaseResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'data') T? data,@JsonKey(name: 'code') int? code,@JsonKey(name: 'message') String? message
});




}
/// @nodoc
class _$BaseResponseModelCopyWithImpl<T,$Res>
    implements $BaseResponseModelCopyWith<T, $Res> {
  _$BaseResponseModelCopyWithImpl(this._self, this._then);

  final BaseResponseModel<T> _self;
  final $Res Function(BaseResponseModel<T>) _then;

/// Create a copy of BaseResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,Object? code = freezed,Object? message = freezed,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _BaseResponseModel<T> implements BaseResponseModel<T> {
   _BaseResponseModel({@JsonKey(name: 'data') this.data, @JsonKey(name: 'code') this.code, @JsonKey(name: 'message') this.message});
  factory _BaseResponseModel.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$BaseResponseModelFromJson(json,fromJsonT);

@override@JsonKey(name: 'data') final  T? data;
@override@JsonKey(name: 'code') final  int? code;
@override@JsonKey(name: 'message') final  String? message;

/// Create a copy of BaseResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BaseResponseModelCopyWith<T, _BaseResponseModel<T>> get copyWith => __$BaseResponseModelCopyWithImpl<T, _BaseResponseModel<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$BaseResponseModelToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BaseResponseModel<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),code,message);

@override
String toString() {
  return 'BaseResponseModel<$T>(data: $data, code: $code, message: $message)';
}


}

/// @nodoc
abstract mixin class _$BaseResponseModelCopyWith<T,$Res> implements $BaseResponseModelCopyWith<T, $Res> {
  factory _$BaseResponseModelCopyWith(_BaseResponseModel<T> value, $Res Function(_BaseResponseModel<T>) _then) = __$BaseResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'data') T? data,@JsonKey(name: 'code') int? code,@JsonKey(name: 'message') String? message
});




}
/// @nodoc
class __$BaseResponseModelCopyWithImpl<T,$Res>
    implements _$BaseResponseModelCopyWith<T, $Res> {
  __$BaseResponseModelCopyWithImpl(this._self, this._then);

  final _BaseResponseModel<T> _self;
  final $Res Function(_BaseResponseModel<T>) _then;

/// Create a copy of BaseResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? code = freezed,Object? message = freezed,}) {
  return _then(_BaseResponseModel<T>(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
