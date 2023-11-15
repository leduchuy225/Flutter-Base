// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BaseResponseModel<T> _$BaseResponseModelFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _BaseResponseModel<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$BaseResponseModel<T> {
  @JsonKey(name: 'count')
  int? get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'next')
  String? get next => throw _privateConstructorUsedError;
  @JsonKey(name: 'results')
  T? get results => throw _privateConstructorUsedError;
  @JsonKey(name: 'previous')
  String? get previous => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BaseResponseModelCopyWith<T, BaseResponseModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseResponseModelCopyWith<T, $Res> {
  factory $BaseResponseModelCopyWith(BaseResponseModel<T> value,
          $Res Function(BaseResponseModel<T>) then) =
      _$BaseResponseModelCopyWithImpl<T, $Res, BaseResponseModel<T>>;
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'next') String? next,
      @JsonKey(name: 'results') T? results,
      @JsonKey(name: 'previous') String? previous});
}

/// @nodoc
class _$BaseResponseModelCopyWithImpl<T, $Res,
        $Val extends BaseResponseModel<T>>
    implements $BaseResponseModelCopyWith<T, $Res> {
  _$BaseResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? results = freezed,
    Object? previous = freezed,
  }) {
    return _then(_value.copyWith(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as T?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BaseResponseModelCopyWith<T, $Res>
    implements $BaseResponseModelCopyWith<T, $Res> {
  factory _$$_BaseResponseModelCopyWith(_$_BaseResponseModel<T> value,
          $Res Function(_$_BaseResponseModel<T>) then) =
      __$$_BaseResponseModelCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'next') String? next,
      @JsonKey(name: 'results') T? results,
      @JsonKey(name: 'previous') String? previous});
}

/// @nodoc
class __$$_BaseResponseModelCopyWithImpl<T, $Res>
    extends _$BaseResponseModelCopyWithImpl<T, $Res, _$_BaseResponseModel<T>>
    implements _$$_BaseResponseModelCopyWith<T, $Res> {
  __$$_BaseResponseModelCopyWithImpl(_$_BaseResponseModel<T> _value,
      $Res Function(_$_BaseResponseModel<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? results = freezed,
    Object? previous = freezed,
  }) {
    return _then(_$_BaseResponseModel<T>(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as T?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_BaseResponseModel<T> implements _BaseResponseModel<T> {
  _$_BaseResponseModel(
      {@JsonKey(name: 'count') this.count,
      @JsonKey(name: 'next') this.next,
      @JsonKey(name: 'results') this.results,
      @JsonKey(name: 'previous') this.previous});

  factory _$_BaseResponseModel.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_BaseResponseModelFromJson(json, fromJsonT);

  @override
  @JsonKey(name: 'count')
  final int? count;
  @override
  @JsonKey(name: 'next')
  final String? next;
  @override
  @JsonKey(name: 'results')
  final T? results;
  @override
  @JsonKey(name: 'previous')
  final String? previous;

  @override
  String toString() {
    return 'BaseResponseModel<$T>(count: $count, next: $next, results: $results, previous: $previous)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BaseResponseModel<T> &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            const DeepCollectionEquality().equals(other.results, results) &&
            (identical(other.previous, previous) ||
                other.previous == previous));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, next,
      const DeepCollectionEquality().hash(results), previous);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BaseResponseModelCopyWith<T, _$_BaseResponseModel<T>> get copyWith =>
      __$$_BaseResponseModelCopyWithImpl<T, _$_BaseResponseModel<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_BaseResponseModelToJson<T>(this, toJsonT);
  }
}

abstract class _BaseResponseModel<T> implements BaseResponseModel<T> {
  factory _BaseResponseModel(
          {@JsonKey(name: 'count') final int? count,
          @JsonKey(name: 'next') final String? next,
          @JsonKey(name: 'results') final T? results,
          @JsonKey(name: 'previous') final String? previous}) =
      _$_BaseResponseModel<T>;

  factory _BaseResponseModel.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_BaseResponseModel<T>.fromJson;

  @override
  @JsonKey(name: 'count')
  int? get count;
  @override
  @JsonKey(name: 'next')
  String? get next;
  @override
  @JsonKey(name: 'results')
  T? get results;
  @override
  @JsonKey(name: 'previous')
  String? get previous;
  @override
  @JsonKey(ignore: true)
  _$$_BaseResponseModelCopyWith<T, _$_BaseResponseModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
