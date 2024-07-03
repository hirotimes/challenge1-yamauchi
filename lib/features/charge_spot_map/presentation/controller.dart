import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map_app/constants/asset_path.dart';
import 'package:flutter_map_app/features/charge_spot_map/presentation/state.dart';
import 'package:flutter_map_app/constants/enums.dart';
import 'package:flutter_map_app/features/charge_spot_map/data/repository.dart';
import 'package:flutter_map_app/features/charge_spot_map/domain/model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controller.g.dart';

/// 東京駅で固定
const position = LatLng(35.681236, 139.767125);
const distance = 0.05;

@riverpod
class ChargeSpotMapController extends _$ChargeSpotMapController {
  ChargeSpotMapController();

  final ChargerSpotsRepository _repository = ChargerSpotsRepository();

  @override
  FutureOr<ChargeSpotMapState> build(BuildContext context) async {
    // 現在地を取得
    // 本来はこちらを使用する
    // final Position position = await _determinePosition();

    // テスト用で、東京駅の座標
    final double swLat = position.latitude - distance; // 南西の緯度
    final double swLng = position.longitude - distance; // 南西の経度
    final double neLat = position.latitude + distance; // 北東の緯度
    final double neLng = position.longitude + distance; // 北東の経度

    final CameraPosition initialPosition = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 12,
    );

    final chargerSpotsResponse = await _repository.getChargerSpots(
      swLat: swLat,
      swLng: swLng,
      neLat: neLat,
      neLng: neLng,
    );

    if (chargerSpotsResponse.status == GetChargerSpotsStatus.ok) {
      final List<Marker> markers =
          await _loadChargerSpots(chargerSpotsResponse.spots);

      return ChargeSpotMapState(
        mapController: null,
        markers: markers.toSet(),
        chargerSpots: chargerSpotsResponse.spots,
        carouselController: CarouselController(),
        initialCameraPosition: initialPosition,
      );
    }

    return ChargeSpotMapState(
      mapController: null,
      markers: {},
      chargerSpots: [],
      carouselController: CarouselController(),
      initialCameraPosition: initialPosition,
    );
  }

  /// 現在地を取得
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // 位置情報サービスが有効かどうかを確認
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // 位置情報サービスが無効の場合のエラーメッセージ
      throw Exception('Location services are disabled.');
    }

    // 位置情報の権限を確認
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // 権限が拒否された場合のエラーメッセージ
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // 権限が拒否された場合のエラーメッセージ
      throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // 現在地を取得
    return await Geolocator.getCurrentPosition();
  }

  /// 充電スポットの取得
  Future<List<Marker>> _loadChargerSpots(List<ChargerSpot> spots) async {
    // 充電スポットごとに非同期でマーカーを作成する
    final List<Future<Marker>> markerFutures = spots.map((spot) async {
      // カスタムマーカーを作成
      final BitmapDescriptor customMarker =
          await _createCustomMarker(spot.chargerDevices.length);
      return Marker(
        markerId: MarkerId(spot.uuid),
        position: LatLng(spot.latitude, spot.longitude),
        icon: customMarker,
        onTap: () {
          final stateValue = state.value;
          if (stateValue == null) {
            return;
          }
          stateValue.onMarkerTapped(spot);
        },
      );
    }).toList();

    final List<Marker> markers = await Future.wait(markerFutures);

    return markers;
  }

  /// 地図に表示するマーカーを作成
  Future<BitmapDescriptor> _createCustomMarker(int count) async {
    //アセットからアイコンを取得
    final Uint8List markerIcon = await _getBytesFromAsset(imagePathMarker, 50);

    // Canvasの準備
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = Colors.black;
    final TextPainter textPainter =
        TextPainter(textDirection: TextDirection.ltr);

    // テキストの描画
    final ui.Image markerImage = await decodeImageFromList(markerIcon);
    canvas.drawImage(markerImage, const Offset(0, 0), paint);
    textPainter.text = TextSpan(
      text: '$count',
      style: const TextStyle(
          fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.bold),
    );
    textPainter.layout();
    textPainter.paint(
        canvas, Offset((markerImage.width / 2) - (textPainter.width / 2), 18));

    // 画像の生成
    final ui.Image img = await pictureRecorder
        .endRecording()
        .toImage(markerImage.width, markerImage.height);
    final ByteData? byteData =
        await img.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List uint8List = byteData!.buffer.asUint8List();

    //  マーカーの返却
    return BitmapDescriptor.bytes(uint8List);
  }

// 画像をバイトデータに変換
  Future<Uint8List> _getBytesFromAsset(String path, int width) async {
    // アセットから画像を読み込む
    final ByteData data = await rootBundle.load(path);

    // 読み込んだ画像をデコードし、指定された幅にリサイズする
    final ui.Codec codec = await ui
        .instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    final ui.FrameInfo fi = await codec.getNextFrame();

    // リサイズした画像をバイトデータに変換して返す
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  /// GoogleMapControllerをProviderにセット
  void onMapCreated(GoogleMapController controller) {
    final stateValue = state.value;
    if (stateValue == null) {
      return;
    }
    final data = stateValue.copyWith(mapController: controller);

    state = AsyncData(data);
  }

  /// 営業日か営業時間外を取得
  String businessStatus(ChargerSpot spot) {
    return spot.businessStatus();
  }

  /// 充電出力を取得
  String getChargePower(ChargerSpot spot) {
    return spot.getChargePower();
  }

  /// 定休日を取得
  String getRegularHoliday(ChargerSpot spot) {
    return spot.getRegularHoliday();
  }

  /// 取得時点の曜日の営業時間を取得
  String getTodayServiceTime(ChargerSpot spot) {
    return spot.getTodayServiceTime();
  }
}
