// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetChargerSpotsResponse _$GetChargerSpotsResponseFromJson(
    Map<String, dynamic> json) {
  return _GetChargerSpotsResponse.fromJson(json);
}

/// @nodoc
mixin _$GetChargerSpotsResponse {
  /// ステータス
  GetChargerSpotsStatus get status => throw _privateConstructorUsedError;

  /// 取得した充電スポット
  List<ChargerSpot> get spots => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetChargerSpotsResponseCopyWith<GetChargerSpotsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetChargerSpotsResponseCopyWith<$Res> {
  factory $GetChargerSpotsResponseCopyWith(GetChargerSpotsResponse value,
          $Res Function(GetChargerSpotsResponse) then) =
      _$GetChargerSpotsResponseCopyWithImpl<$Res, GetChargerSpotsResponse>;
  @useResult
  $Res call({GetChargerSpotsStatus status, List<ChargerSpot> spots});
}

/// @nodoc
class _$GetChargerSpotsResponseCopyWithImpl<$Res,
        $Val extends GetChargerSpotsResponse>
    implements $GetChargerSpotsResponseCopyWith<$Res> {
  _$GetChargerSpotsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? spots = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GetChargerSpotsStatus,
      spots: null == spots
          ? _value.spots
          : spots // ignore: cast_nullable_to_non_nullable
              as List<ChargerSpot>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetChargerSpotsResponseImplCopyWith<$Res>
    implements $GetChargerSpotsResponseCopyWith<$Res> {
  factory _$$GetChargerSpotsResponseImplCopyWith(
          _$GetChargerSpotsResponseImpl value,
          $Res Function(_$GetChargerSpotsResponseImpl) then) =
      __$$GetChargerSpotsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GetChargerSpotsStatus status, List<ChargerSpot> spots});
}

/// @nodoc
class __$$GetChargerSpotsResponseImplCopyWithImpl<$Res>
    extends _$GetChargerSpotsResponseCopyWithImpl<$Res,
        _$GetChargerSpotsResponseImpl>
    implements _$$GetChargerSpotsResponseImplCopyWith<$Res> {
  __$$GetChargerSpotsResponseImplCopyWithImpl(
      _$GetChargerSpotsResponseImpl _value,
      $Res Function(_$GetChargerSpotsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? spots = null,
  }) {
    return _then(_$GetChargerSpotsResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GetChargerSpotsStatus,
      spots: null == spots
          ? _value._spots
          : spots // ignore: cast_nullable_to_non_nullable
              as List<ChargerSpot>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetChargerSpotsResponseImpl implements _GetChargerSpotsResponse {
  const _$GetChargerSpotsResponseImpl(
      {required this.status, required final List<ChargerSpot> spots})
      : _spots = spots;

  factory _$GetChargerSpotsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetChargerSpotsResponseImplFromJson(json);

  /// ステータス
  @override
  final GetChargerSpotsStatus status;

  /// 取得した充電スポット
  final List<ChargerSpot> _spots;

  /// 取得した充電スポット
  @override
  List<ChargerSpot> get spots {
    if (_spots is EqualUnmodifiableListView) return _spots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spots);
  }

  @override
  String toString() {
    return 'GetChargerSpotsResponse(status: $status, spots: $spots)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetChargerSpotsResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._spots, _spots));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_spots));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetChargerSpotsResponseImplCopyWith<_$GetChargerSpotsResponseImpl>
      get copyWith => __$$GetChargerSpotsResponseImplCopyWithImpl<
          _$GetChargerSpotsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetChargerSpotsResponseImplToJson(
      this,
    );
  }
}

abstract class _GetChargerSpotsResponse implements GetChargerSpotsResponse {
  const factory _GetChargerSpotsResponse(
      {required final GetChargerSpotsStatus status,
      required final List<ChargerSpot> spots}) = _$GetChargerSpotsResponseImpl;

  factory _GetChargerSpotsResponse.fromJson(Map<String, dynamic> json) =
      _$GetChargerSpotsResponseImpl.fromJson;

  @override

  /// ステータス
  GetChargerSpotsStatus get status;
  @override

  /// 取得した充電スポット
  List<ChargerSpot> get spots;
  @override
  @JsonKey(ignore: true)
  _$$GetChargerSpotsResponseImplCopyWith<_$GetChargerSpotsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
