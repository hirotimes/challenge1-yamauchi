
/// サービス提供時間の曜日
enum ServiceTimeDay {
  /// 日曜日
  sunday,

  /// 月曜日
  monday,

  /// 火曜日
  tuesday,

  /// 水曜日
  wednesday,

  /// 木曜日
  thursday,

  /// 金曜日
  friday,

  /// 土曜日
  saturday,

  /// 祝日
  holiday,

  /// 平日
  weekday;
}

/// 充電スポット取得のステータス
enum GetChargerSpotsStatus {
  /// 成功
  ok,

  /// 失敗：指定範囲内に充電スポットが多すぎる
  ngTooManySpots,
}
