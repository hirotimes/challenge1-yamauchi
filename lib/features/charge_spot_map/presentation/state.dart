import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_map_app/features/charge_spot_map/domain/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'state.freezed.dart';

@freezed
class ChargeSpotMapState
    with _$ChargeSpotMapState
    implements _$ChargeSpotMapState {
  const ChargeSpotMapState._();

  const factory ChargeSpotMapState({
    /// GoogleMap用 controller
    required GoogleMapController? mapController,

    /// マップに表示するマーカー
    required Set<Marker>? markers,

    /// 充電スポットリスト
    required List<ChargerSpot> chargerSpots,

    /// カルーセル制御
    required CarouselController carouselController,

    /// マップの初期表示位置
    required CameraPosition initialCameraPosition,
  }) = _ChargeSpotMapState;

  /// マーカーがタップされた際のイベント
  void onMarkerTapped(ChargerSpot spot) {
    if (mapController == null) {
      return;
    }

    final index = chargerSpots.indexOf(spot);
    mapController!.animateCamera(
        CameraUpdate.newLatLng(LatLng(spot.latitude, spot.longitude)));
    carouselController.animateToPage(index);
  }

  /// カルーセルのページが更新された際のイベント
  carouselPageChanged(index) {
    if (mapController == null) {
      return;
    }

    final spot = chargerSpots[index];
    mapController!.animateCamera(
        CameraUpdate.newLatLng(LatLng(spot.latitude, spot.longitude)));
  }
}
