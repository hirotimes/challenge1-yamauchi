import 'package:flutter_map_app/constants/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';

part 'model.g.dart';

/// 充電スポット情報
@freezed
class ChargerSpot with _$ChargerSpot {
  const factory ChargerSpot({
    /// 充電スポットのUUID
    required String uuid,

    /// 充電スポットの名称
    required String name,

    /// 充電スポットの緯度
    required double latitude,

    /// 充電スポットの経度
    required double longitude,

    /// 充電器情報
    /// ※ カードの「充電器数」「充電出力」およびマーカーの充電器数の表示のために使用します
    @JsonKey(name: 'charger_devices')
    required List<ChargerDevice> chargerDevices,

    /// サービス提供時間
    /// ※ カードの「営業中/営業時間外」で使用します
    @JsonKey(name: 'service_times') required List<ServiceTime> serviceTimes,

    /// 充電スポットの写真URL
    /// ※ カードカードのサムネイル表示に使用します
    String? imageUrl,
  }) = _ChargerSpot;

  factory ChargerSpot.fromJson(Map<String, dynamic> json) =>
      _$ChargerSpotFromJson(json);
}

/// 充電器情報
@freezed
class ChargerDevice with _$ChargerDevice {
  const factory ChargerDevice({
    /// 充電器のUUID
    required String uuid,

    /// 充電器の出力(kW)
    required num power,
  }) = _ChargerDevice;

  factory ChargerDevice.fromJson(Map<String, dynamic> json) =>
      _$ChargerDeviceFromJson(json);
}

/// サービス提供時間
@freezed
class ServiceTime with _$ServiceTime implements _$ServiceTime {
  const ServiceTime._();

  const factory ServiceTime({
    /// 開始時刻（hh:mm形式）
    @JsonKey(name: 'start_time') String? startTime,

    /// 終了時刻（hh:mm形式）
    @JsonKey(name: 'end_time') String? endTime,

    /// 営業日かどうか（true: 営業日、false: 休業日、null: 不明）
    @JsonKey(name: 'business_day') required bool businessDay,

    /// 曜日
    required ServiceTimeDay day,
  }) = _ServiceTime;

  factory ServiceTime.fromJson(Map<String, dynamic> json) =>
      _$ServiceTimeFromJson(json);

  bool isBusinessHours(DateTime now) {
    if (!businessDay) return false;
    final int nowInMinutes = now.hour * 60 + now.minute;
    final int startInMinutes = startTime == null
        ? 0
        : int.parse(startTime!.split(':')[0]) * 60 +
            int.parse(startTime!.split(':')[1]);
    final int endInMinutes = endTime == null
        ? 1440
        : int.parse(endTime!.split(':')[0]) * 60 +
            int.parse(endTime!.split(':')[1]);

    return (now.weekday - 1 == day.index) &&
        (nowInMinutes >= startInMinutes && nowInMinutes <= endInMinutes);
  }
}
