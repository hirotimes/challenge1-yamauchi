// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetChargerSpotsResponseImpl _$$GetChargerSpotsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetChargerSpotsResponseImpl(
      status: $enumDecode(_$GetChargerSpotsStatusEnumMap, json['status']),
      spots: (json['spots'] as List<dynamic>)
          .map((e) => ChargerSpot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetChargerSpotsResponseImplToJson(
        _$GetChargerSpotsResponseImpl instance) =>
    <String, dynamic>{
      'status': _$GetChargerSpotsStatusEnumMap[instance.status]!,
      'spots': instance.spots,
    };

const _$GetChargerSpotsStatusEnumMap = {
  GetChargerSpotsStatus.ok: 'ok',
  GetChargerSpotsStatus.ngTooManySpots: 'ngTooManySpots',
};
