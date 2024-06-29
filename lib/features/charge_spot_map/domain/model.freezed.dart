// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChargerSpot _$ChargerSpotFromJson(Map<String, dynamic> json) {
  return _ChargerSpot.fromJson(json);
}

/// @nodoc
mixin _$ChargerSpot {
  /// 充電スポットのUUID
  String get uuid => throw _privateConstructorUsedError;

  /// 充電スポットの名称
  String get name => throw _privateConstructorUsedError;

  /// 充電スポットの緯度
  double get latitude => throw _privateConstructorUsedError;

  /// 充電スポットの経度
  double get longitude => throw _privateConstructorUsedError;

  /// 充電器情報
  /// ※ カードの「充電器数」「充電出力」およびマーカーの充電器数の表示のために使用します
  List<ChargerDevice> get chargerDevices => throw _privateConstructorUsedError;

  /// サービス提供時間
  /// ※ カードの「営業中/営業時間外」で使用します
  List<ServiceTime> get serviceTimes => throw _privateConstructorUsedError;

  /// 充電スポットの写真URL
  /// ※ カードカードのサムネイル表示に使用します
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChargerSpotCopyWith<ChargerSpot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChargerSpotCopyWith<$Res> {
  factory $ChargerSpotCopyWith(
          ChargerSpot value, $Res Function(ChargerSpot) then) =
      _$ChargerSpotCopyWithImpl<$Res, ChargerSpot>;
  @useResult
  $Res call(
      {String uuid,
      String name,
      double latitude,
      double longitude,
      List<ChargerDevice> chargerDevices,
      List<ServiceTime> serviceTimes,
      String? imageUrl});
}

/// @nodoc
class _$ChargerSpotCopyWithImpl<$Res, $Val extends ChargerSpot>
    implements $ChargerSpotCopyWith<$Res> {
  _$ChargerSpotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? chargerDevices = null,
    Object? serviceTimes = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      chargerDevices: null == chargerDevices
          ? _value.chargerDevices
          : chargerDevices // ignore: cast_nullable_to_non_nullable
              as List<ChargerDevice>,
      serviceTimes: null == serviceTimes
          ? _value.serviceTimes
          : serviceTimes // ignore: cast_nullable_to_non_nullable
              as List<ServiceTime>,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChargerSpotImplCopyWith<$Res>
    implements $ChargerSpotCopyWith<$Res> {
  factory _$$ChargerSpotImplCopyWith(
          _$ChargerSpotImpl value, $Res Function(_$ChargerSpotImpl) then) =
      __$$ChargerSpotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String name,
      double latitude,
      double longitude,
      List<ChargerDevice> chargerDevices,
      List<ServiceTime> serviceTimes,
      String? imageUrl});
}

/// @nodoc
class __$$ChargerSpotImplCopyWithImpl<$Res>
    extends _$ChargerSpotCopyWithImpl<$Res, _$ChargerSpotImpl>
    implements _$$ChargerSpotImplCopyWith<$Res> {
  __$$ChargerSpotImplCopyWithImpl(
      _$ChargerSpotImpl _value, $Res Function(_$ChargerSpotImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? chargerDevices = null,
    Object? serviceTimes = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_$ChargerSpotImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      chargerDevices: null == chargerDevices
          ? _value._chargerDevices
          : chargerDevices // ignore: cast_nullable_to_non_nullable
              as List<ChargerDevice>,
      serviceTimes: null == serviceTimes
          ? _value._serviceTimes
          : serviceTimes // ignore: cast_nullable_to_non_nullable
              as List<ServiceTime>,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChargerSpotImpl implements _ChargerSpot {
  const _$ChargerSpotImpl(
      {required this.uuid,
      required this.name,
      required this.latitude,
      required this.longitude,
      required final List<ChargerDevice> chargerDevices,
      required final List<ServiceTime> serviceTimes,
      this.imageUrl})
      : _chargerDevices = chargerDevices,
        _serviceTimes = serviceTimes;

  factory _$ChargerSpotImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChargerSpotImplFromJson(json);

  /// 充電スポットのUUID
  @override
  final String uuid;

  /// 充電スポットの名称
  @override
  final String name;

  /// 充電スポットの緯度
  @override
  final double latitude;

  /// 充電スポットの経度
  @override
  final double longitude;

  /// 充電器情報
  /// ※ カードの「充電器数」「充電出力」およびマーカーの充電器数の表示のために使用します
  final List<ChargerDevice> _chargerDevices;

  /// 充電器情報
  /// ※ カードの「充電器数」「充電出力」およびマーカーの充電器数の表示のために使用します
  @override
  List<ChargerDevice> get chargerDevices {
    if (_chargerDevices is EqualUnmodifiableListView) return _chargerDevices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chargerDevices);
  }

  /// サービス提供時間
  /// ※ カードの「営業中/営業時間外」で使用します
  final List<ServiceTime> _serviceTimes;

  /// サービス提供時間
  /// ※ カードの「営業中/営業時間外」で使用します
  @override
  List<ServiceTime> get serviceTimes {
    if (_serviceTimes is EqualUnmodifiableListView) return _serviceTimes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceTimes);
  }

  /// 充電スポットの写真URL
  /// ※ カードカードのサムネイル表示に使用します
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'ChargerSpot(uuid: $uuid, name: $name, latitude: $latitude, longitude: $longitude, chargerDevices: $chargerDevices, serviceTimes: $serviceTimes, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChargerSpotImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            const DeepCollectionEquality()
                .equals(other._chargerDevices, _chargerDevices) &&
            const DeepCollectionEquality()
                .equals(other._serviceTimes, _serviceTimes) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      name,
      latitude,
      longitude,
      const DeepCollectionEquality().hash(_chargerDevices),
      const DeepCollectionEquality().hash(_serviceTimes),
      imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChargerSpotImplCopyWith<_$ChargerSpotImpl> get copyWith =>
      __$$ChargerSpotImplCopyWithImpl<_$ChargerSpotImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChargerSpotImplToJson(
      this,
    );
  }
}

abstract class _ChargerSpot implements ChargerSpot {
  const factory _ChargerSpot(
      {required final String uuid,
      required final String name,
      required final double latitude,
      required final double longitude,
      required final List<ChargerDevice> chargerDevices,
      required final List<ServiceTime> serviceTimes,
      final String? imageUrl}) = _$ChargerSpotImpl;

  factory _ChargerSpot.fromJson(Map<String, dynamic> json) =
      _$ChargerSpotImpl.fromJson;

  @override

  /// 充電スポットのUUID
  String get uuid;
  @override

  /// 充電スポットの名称
  String get name;
  @override

  /// 充電スポットの緯度
  double get latitude;
  @override

  /// 充電スポットの経度
  double get longitude;
  @override

  /// 充電器情報
  /// ※ カードの「充電器数」「充電出力」およびマーカーの充電器数の表示のために使用します
  List<ChargerDevice> get chargerDevices;
  @override

  /// サービス提供時間
  /// ※ カードの「営業中/営業時間外」で使用します
  List<ServiceTime> get serviceTimes;
  @override

  /// 充電スポットの写真URL
  /// ※ カードカードのサムネイル表示に使用します
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$ChargerSpotImplCopyWith<_$ChargerSpotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChargerDevice _$ChargerDeviceFromJson(Map<String, dynamic> json) {
  return _ChargerDevice.fromJson(json);
}

/// @nodoc
mixin _$ChargerDevice {
  /// 充電器のUUID
  String get uuid => throw _privateConstructorUsedError;

  /// 充電器の出力(kW)
  num get power => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChargerDeviceCopyWith<ChargerDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChargerDeviceCopyWith<$Res> {
  factory $ChargerDeviceCopyWith(
          ChargerDevice value, $Res Function(ChargerDevice) then) =
      _$ChargerDeviceCopyWithImpl<$Res, ChargerDevice>;
  @useResult
  $Res call({String uuid, num power});
}

/// @nodoc
class _$ChargerDeviceCopyWithImpl<$Res, $Val extends ChargerDevice>
    implements $ChargerDeviceCopyWith<$Res> {
  _$ChargerDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? power = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      power: null == power
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChargerDeviceImplCopyWith<$Res>
    implements $ChargerDeviceCopyWith<$Res> {
  factory _$$ChargerDeviceImplCopyWith(
          _$ChargerDeviceImpl value, $Res Function(_$ChargerDeviceImpl) then) =
      __$$ChargerDeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid, num power});
}

/// @nodoc
class __$$ChargerDeviceImplCopyWithImpl<$Res>
    extends _$ChargerDeviceCopyWithImpl<$Res, _$ChargerDeviceImpl>
    implements _$$ChargerDeviceImplCopyWith<$Res> {
  __$$ChargerDeviceImplCopyWithImpl(
      _$ChargerDeviceImpl _value, $Res Function(_$ChargerDeviceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? power = null,
  }) {
    return _then(_$ChargerDeviceImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      power: null == power
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChargerDeviceImpl implements _ChargerDevice {
  const _$ChargerDeviceImpl({required this.uuid, required this.power});

  factory _$ChargerDeviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChargerDeviceImplFromJson(json);

  /// 充電器のUUID
  @override
  final String uuid;

  /// 充電器の出力(kW)
  @override
  final num power;

  @override
  String toString() {
    return 'ChargerDevice(uuid: $uuid, power: $power)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChargerDeviceImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.power, power) || other.power == power));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, power);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChargerDeviceImplCopyWith<_$ChargerDeviceImpl> get copyWith =>
      __$$ChargerDeviceImplCopyWithImpl<_$ChargerDeviceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChargerDeviceImplToJson(
      this,
    );
  }
}

abstract class _ChargerDevice implements ChargerDevice {
  const factory _ChargerDevice(
      {required final String uuid,
      required final num power}) = _$ChargerDeviceImpl;

  factory _ChargerDevice.fromJson(Map<String, dynamic> json) =
      _$ChargerDeviceImpl.fromJson;

  @override

  /// 充電器のUUID
  String get uuid;
  @override

  /// 充電器の出力(kW)
  num get power;
  @override
  @JsonKey(ignore: true)
  _$$ChargerDeviceImplCopyWith<_$ChargerDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ServiceTime _$ServiceTimeFromJson(Map<String, dynamic> json) {
  return _ServiceTime.fromJson(json);
}

/// @nodoc
mixin _$ServiceTime {
  /// 開始時刻（hh:mm形式）
  String? get startTime => throw _privateConstructorUsedError;

  /// 終了時刻（hh:mm形式）
  String? get endTime => throw _privateConstructorUsedError;

  /// 営業日かどうか（true: 営業日、false: 休業日、null: 不明）
  bool get businessDay => throw _privateConstructorUsedError;

  /// 曜日
  ServiceTimeDay get day => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceTimeCopyWith<ServiceTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceTimeCopyWith<$Res> {
  factory $ServiceTimeCopyWith(
          ServiceTime value, $Res Function(ServiceTime) then) =
      _$ServiceTimeCopyWithImpl<$Res, ServiceTime>;
  @useResult
  $Res call(
      {String? startTime,
      String? endTime,
      bool businessDay,
      ServiceTimeDay day});
}

/// @nodoc
class _$ServiceTimeCopyWithImpl<$Res, $Val extends ServiceTime>
    implements $ServiceTimeCopyWith<$Res> {
  _$ServiceTimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? businessDay = null,
    Object? day = null,
  }) {
    return _then(_value.copyWith(
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      businessDay: null == businessDay
          ? _value.businessDay
          : businessDay // ignore: cast_nullable_to_non_nullable
              as bool,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as ServiceTimeDay,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceTimeImplCopyWith<$Res>
    implements $ServiceTimeCopyWith<$Res> {
  factory _$$ServiceTimeImplCopyWith(
          _$ServiceTimeImpl value, $Res Function(_$ServiceTimeImpl) then) =
      __$$ServiceTimeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? startTime,
      String? endTime,
      bool businessDay,
      ServiceTimeDay day});
}

/// @nodoc
class __$$ServiceTimeImplCopyWithImpl<$Res>
    extends _$ServiceTimeCopyWithImpl<$Res, _$ServiceTimeImpl>
    implements _$$ServiceTimeImplCopyWith<$Res> {
  __$$ServiceTimeImplCopyWithImpl(
      _$ServiceTimeImpl _value, $Res Function(_$ServiceTimeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? businessDay = null,
    Object? day = null,
  }) {
    return _then(_$ServiceTimeImpl(
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      businessDay: null == businessDay
          ? _value.businessDay
          : businessDay // ignore: cast_nullable_to_non_nullable
              as bool,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as ServiceTimeDay,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceTimeImpl implements _ServiceTime {
  const _$ServiceTimeImpl(
      {this.startTime,
      this.endTime,
      required this.businessDay,
      required this.day});

  factory _$ServiceTimeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceTimeImplFromJson(json);

  /// 開始時刻（hh:mm形式）
  @override
  final String? startTime;

  /// 終了時刻（hh:mm形式）
  @override
  final String? endTime;

  /// 営業日かどうか（true: 営業日、false: 休業日、null: 不明）
  @override
  final bool businessDay;

  /// 曜日
  @override
  final ServiceTimeDay day;

  @override
  String toString() {
    return 'ServiceTime(startTime: $startTime, endTime: $endTime, businessDay: $businessDay, day: $day)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceTimeImpl &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.businessDay, businessDay) ||
                other.businessDay == businessDay) &&
            (identical(other.day, day) || other.day == day));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, startTime, endTime, businessDay, day);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceTimeImplCopyWith<_$ServiceTimeImpl> get copyWith =>
      __$$ServiceTimeImplCopyWithImpl<_$ServiceTimeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceTimeImplToJson(
      this,
    );
  }
}

abstract class _ServiceTime implements ServiceTime {
  const factory _ServiceTime(
      {final String? startTime,
      final String? endTime,
      required final bool businessDay,
      required final ServiceTimeDay day}) = _$ServiceTimeImpl;

  factory _ServiceTime.fromJson(Map<String, dynamic> json) =
      _$ServiceTimeImpl.fromJson;

  @override

  /// 開始時刻（hh:mm形式）
  String? get startTime;
  @override

  /// 終了時刻（hh:mm形式）
  String? get endTime;
  @override

  /// 営業日かどうか（true: 営業日、false: 休業日、null: 不明）
  bool get businessDay;
  @override

  /// 曜日
  ServiceTimeDay get day;
  @override
  @JsonKey(ignore: true)
  _$$ServiceTimeImplCopyWith<_$ServiceTimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
