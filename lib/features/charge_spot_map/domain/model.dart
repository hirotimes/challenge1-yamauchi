import 'package:collection/collection.dart';
import 'package:flutter_map_app/constants/enums.dart';
import 'package:flutter_map_app/constants/system.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:holiday_jp/holiday_jp.dart' as holiday_jp;

part 'model.freezed.dart';

part 'model.g.dart';

/// 充電スポット情報
@freezed
class ChargerSpot with _$ChargerSpot implements _$ChargerSpot {
  const ChargerSpot._();

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
    @JsonKey(name: 'image_url') String? imageUrl,
  }) = _ChargerSpot;

  factory ChargerSpot.fromJson(Map<String, dynamic> json) =>
      _$ChargerSpotFromJson(json);

  /// 取得時点の曜日の営業時間を取得
  String getTodayServiceTime() {
    final DateTime now = DateTime.now();
    final today = serviceTimes
        .firstWhereOrNull((st) => st.day == _getTodayServiceTimeDay(now));

    return today == null ? '-' : '${today.startTime} - ${today.endTime}';
  }

  /// 本日が祝日か、何曜日かを取得
  ServiceTimeDay _getTodayServiceTimeDay(DateTime now) {
    // 祝日かチェック
    final isHoliday = holiday_jp.isHoliday(now);
    if (isHoliday) return ServiceTimeDay.holiday;

    // 祝日ではない場合、曜日を返す
    switch (now.weekday) {
      case DateTime.monday:
        return ServiceTimeDay.monday;
      case DateTime.tuesday:
        return ServiceTimeDay.tuesday;
      case DateTime.wednesday:
        return ServiceTimeDay.wednesday;
      case DateTime.thursday:
        return ServiceTimeDay.thursday;
      case DateTime.friday:
        return ServiceTimeDay.friday;
      case DateTime.saturday:
        return ServiceTimeDay.saturday;
      case DateTime.sunday:
        return ServiceTimeDay.sunday;
      default:
        throw ArgumentError('Invalid day');
    }
  }

  /// 定休日を取得
  String getRegularHoliday() {
    final regularHoliday = serviceTimes
        .where((st) => !st.businessDay)
        .map((st) => _getJapaneseDayName(st.day.name))
        .join('、 ');
    return regularHoliday.isNotEmpty ? regularHoliday : '-';
  }

  /// 英語の曜日を日本語に変換
  String _getJapaneseDayName(String day) {
    return dayToJapanese[day] ?? day;
  }

  /// 充電出力を取得
  String getChargePower() {
    return chargerDevices
        .map((dev) => dev.power)
        .toSet()
        .toList()
        .map((power) => '${power}kW')
        .join('、');
  }

  /// 営業日か営業時間外を取得
  String businessStatus() {
    final DateTime now = DateTime.now();
    final today = serviceTimes
        .firstWhereOrNull((st) => st.day == _getTodayServiceTimeDay(now));
    if (today == null) return '-';
    final isOpen = today.isBusinessHours(now);
    return isOpen ? '営業中' : '営業時間外';
  }
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

  /// 営業中・営業時間外を取得
  bool isBusinessHours(DateTime now) {
    // 営業日かどうかをチェック
    if (!businessDay) return false;

    // 現在時刻を分単位で計算
    final int nowInMinutes = now.hour * 60 + now.minute;

    // 開始時刻を分単位で計算。開始時刻がnullの場合は0に設定
    final int startInMinutes = startTime == null
        ? 0
        : int.parse(startTime!.split(':')[0]) * 60 +
        int.parse(startTime!.split(':')[1]);

    // 終了時刻を分単位で計算。終了時刻がnullの場合は1440(24:00)に設定
    final int endInMinutes = endTime == null
        ? 1440
        : int.parse(endTime!.split(':')[0]) * 60 +
        int.parse(endTime!.split(':')[1]);

    // 今日が指定された曜日であり、現在時刻が開始時刻と終了時刻の間にあるかをチェック
    return (now.weekday - 1 == day.index) &&
        (nowInMinutes >= startInMinutes && nowInMinutes <= endInMinutes);
  }
}
