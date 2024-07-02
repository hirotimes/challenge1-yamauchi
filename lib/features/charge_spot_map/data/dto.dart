import 'package:flutter_map_app/constants/enums.dart';
import 'package:flutter_map_app/features/charge_spot_map/domain/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto.freezed.dart';

part 'dto.g.dart';

/// 充電スポット取得のレスポンス
@freezed
class GetChargerSpotsResponse with _$GetChargerSpotsResponse {
  const factory GetChargerSpotsResponse({
    /// ステータス
    required GetChargerSpotsStatus status,

    /// 取得した充電スポット
    required List<ChargerSpot> spots,
  }) = _GetChargerSpotsResponse;

  factory GetChargerSpotsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetChargerSpotsResponseFromJson(json);
}
