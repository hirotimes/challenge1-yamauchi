import 'package:flutter_map_app/common_widgets/loading.dart';
import 'package:flutter_map_app/constants/asset_path.dart';
import 'package:flutter_map_app/constants/style.dart';
import 'package:flutter_map_app/features/charge_spot_map/domain/model.dart';
import 'package:flutter_map_app/features/charge_spot_map/presentation/controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ChargeSpotMapPage extends ConsumerWidget {
  const ChargeSpotMapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // プロバイダから取得
    final provider = chargeSpotMapControllerProvider(context);
    final state = ref.watch(provider);
    final stateValue = state.value;
    final controller = ref.read(provider.notifier);

    // 必須チェック
    if (stateValue == null) {
      return const ChargeSpotLoading();
    }

    return Scaffold(
      body: Stack(
        children: [
          if (stateValue.markers != null)
            GoogleMap(
              onMapCreated: controller.onMapCreated,
              initialCameraPosition: stateValue.initialCameraPosition,
              markers: stateValue.markers!,
              myLocationEnabled: false,
            ),
          Positioned(
            bottom: kPaddingLarge,
            left: 0.0,
            right: 0.0,
            child: _BuildCarousel(provider),
          ),
        ],
      ),
    );
  }
}

/// 充電スポットの詳細をカードで表示
class _BuildCarousel extends ConsumerWidget {
  const _BuildCarousel(this.provider);

  /// プロバイダ
  final ChargeSpotMapControllerProvider provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // プロバイダから取得
    final state = ref.watch(provider);
    final stateValue = state.value;
    final controller = ref.read(provider.notifier);
    // 必須チェック
    if (stateValue == null) {
      return const ChargeSpotLoading();
    }

    return CarouselSlider(
      options: CarouselOptions(
        height: kCarouselHeight,
        enableInfiniteScroll: false,
        onPageChanged: (index, reason) => stateValue.carouselPageChanged(index),
      ),
      carouselController: stateValue.carouselController,
      items: stateValue.chargerSpots.map((spot) {
        final powers = controller.getChargePower(spot);
        final todayServiceTime = controller.getTodayServiceTime(spot);
        final isServiceTime = controller.businessStatus(spot);
        final regularHoliday = controller.getRegularHoliday(spot);

        return Builder(
          builder: (BuildContext context) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kCardBorderRadius),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(kCardBorderRadius),
                    ),
                    child: SizedBox(
                      height: kThumbnailHeight,
                      child: _Thumbnail(spot: spot),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kPaddingLarge),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(kPaddingMedium),
                                child: Text(
                                  spot.name,
                                  style: const TextStyle(
                                    fontSize: kTitleFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        _InfoRow(
                          title: '充電器数',
                          value: '${spot.chargerDevices.length}',
                          icon: Icons.power,
                        ),
                        _InfoRow(
                          title: '充電出力',
                          value: powers,
                          icon: Icons.electric_bolt,
                        ),
                        _InfoRow(
                          title: isServiceTime,
                          value: todayServiceTime,
                          icon: Icons.access_time,
                          labelColor: isServiceTime == '営業中'
                              ? Colors.greenAccent
                              : Colors.grey,
                        ),
                        _InfoRow(
                          title: '定休日',
                          value: regularHoliday,
                          icon: Icons.calendar_today,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(kPaddingSmall),
                              child: Text(
                                '地図アプリで経路を見る',
                                style: TextStyle(
                                  color: Colors.greenAccent,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.greenAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

/// カードの要素
class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.title,
    required this.value,
    required this.icon,
    this.labelColor = Colors.black,
  });

  final String title;
  final String value;
  final IconData icon;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPaddingSmall),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.yellow,
            size: kIconSize,
          ),
          SizedBox(
            width: 80,
            child: Text(
              title,
              style: TextStyle(fontSize: kInfoRowFontSize, color: labelColor),
            ),
          ),
          Text(value),
        ],
      ),
    );
  }
}

/// カードに表示する画像
class _Thumbnail extends StatelessWidget {
  const _Thumbnail({required this.spot});

  final ChargerSpot spot;

  @override
  Widget build(BuildContext context) {
    return spot.imageUrl != null && spot.imageUrl!.isNotEmpty
        ? Image.network(
            spot.imageUrl!,
            width: double.infinity,
            fit: BoxFit.cover,
            height: kThumbnailHeight,
            errorBuilder: (context, error, stackTrace) => Image.asset(
              imagePathCar,
              width: double.infinity,
              height: kErrorImageHeight,
              fit: BoxFit.cover,
            ),
          )
        : Image.asset(
            imagePathCar,
            width: double.infinity,
            height: kErrorImageHeight,
            fit: BoxFit.cover,
          );
  }
}
