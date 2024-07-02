import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter_map_app/constants/asset_path.dart';
import 'package:flutter_map_app/constants/enums.dart';
import 'package:flutter_map_app/features/charge_spot_map/data/dto.dart';
import 'package:flutter_map_app/features/charge_spot_map/domain/model.dart';
import 'package:logger/logger.dart';

/// 充電スポット・リポジトリ
class ChargerSpotsRepository {
  ChargerSpotsRepository();

  List<ChargerSpot>? _spots;

  /// 最南西の座標（緯度[swLat]・経度[swLng]）と
  /// 最北東の座標（緯度[neLat]・経度[neLng]）と
  /// 範囲内にある充電スポットを取得します。
  Future<GetChargerSpotsResponse> getChargerSpots({
    required double swLat,
    required double swLng,
    required double neLat,
    required double neLng,
  }) async {
    final List<ChargerSpot> spots = _spots ??
        (jsonDecode(await rootBundle.loadString('assets/spots.json')) as List)
            .map((e) => ChargerSpot.fromJson(e as Map<String, dynamic>))
            .toList();

    await Future.delayed(Duration(milliseconds: Random().nextInt(400)));

    final spotsInRegion = spots
        .where((spot) =>
            spot.latitude >= swLat &&
            spot.latitude <= neLat &&
            spot.longitude >= swLng &&
            spot.longitude <= neLng)
        .toList();

    return spotsInRegion.length > 100
        ? const GetChargerSpotsResponse(
            status: GetChargerSpotsStatus.ngTooManySpots,
            spots: [],
          )
        : GetChargerSpotsResponse(
            status: GetChargerSpotsStatus.ok,
            spots: spotsInRegion,
          );
  }
}
