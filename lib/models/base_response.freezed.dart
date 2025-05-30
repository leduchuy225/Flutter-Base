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

@JsonKey(name: 'count') int? get count;@JsonKey(name: 'next') String? get next;@JsonKey(name: 'results') T? get results;@JsonKey(name: 'previous') String? get previous;
/// Create a copy of BaseResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BaseResponseModelCopyWith<T, BaseResponseModel<T>> get copyWith => _$BaseResponseModelCopyWithImpl<T, BaseResponseModel<T>>(this as BaseResponseModel<T>, _$identity);

  /// Serializes this BaseResponseModel to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseResponseModel<T>&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&const DeepCollectionEquality().equals(other.results, results)&&(identical(other.previous, previous) || other.previous == previous));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,const DeepCollectionEquality().hash(results),previous);

@override
String toString() {
  return 'BaseResponseModel<$T>(count: $count, next: $next, results: $results, previous: $previous)';
}


}

/// @nodoc
abstract mixin class $BaseResponseModelCopyWith<T,$Res>  {
  factory $BaseResponseModelCopyWith(BaseResponseModel<T> value, $Res Function(BaseResponseModel<T>) _then) = _$BaseResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'count') int? count,@JsonKey(name: 'next') String? next,@JsonKey(name: 'results') T? results,@JsonKey(name: 'previous') String? previous
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
@pragma('vm:prefer-inline') @override $Res call({Object? count = freezed,Object? next = freezed,Object? results = freezed,Object? previous = freezed,}) {
  return _then(_self.copyWith(
count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,results: freezed == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as T?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _BaseResponseModel<T> implements BaseResponseModel<T> {
   _BaseResponseModel({@JsonKey(name: 'count') this.count, @JsonKey(name: 'next') this.next, @JsonKey(name: 'results') this.results, @JsonKey(name: 'previous') this.previous});
  factory _BaseResponseModel.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$BaseResponseModelFromJson(json,fromJsonT);

@override@JsonKey(name: 'count') final  int? count;
@override@JsonKey(name: 'next') final  String? next;
@override@JsonKey(name: 'results') final  T? results;
@override@JsonKey(name: 'previous') final  String? previous;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BaseResponseModel<T>&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&const DeepCollectionEquality().equals(other.results, results)&&(identical(other.previous, previous) || other.previous == previous));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,const DeepCollectionEquality().hash(results),previous);

@override
String toString() {
  return 'BaseResponseModel<$T>(count: $count, next: $next, results: $results, previous: $previous)';
}


}

/// @nodoc
abstract mixin class _$BaseResponseModelCopyWith<T,$Res> implements $BaseResponseModelCopyWith<T, $Res> {
  factory _$BaseResponseModelCopyWith(_BaseResponseModel<T> value, $Res Function(_BaseResponseModel<T>) _then) = __$BaseResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'count') int? count,@JsonKey(name: 'next') String? next,@JsonKey(name: 'results') T? results,@JsonKey(name: 'previous') String? previous
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
@override @pragma('vm:prefer-inline') $Res call({Object? count = freezed,Object? next = freezed,Object? results = freezed,Object? previous = freezed,}) {
  return _then(_BaseResponseModel<T>(
count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,results: freezed == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as T?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
