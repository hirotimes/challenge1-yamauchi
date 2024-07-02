// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChargerSpotImpl _$$ChargerSpotImplFromJson(Map<String, dynamic> json) =>
    _$ChargerSpotImpl(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      chargerDevices: (json['charger_devices'] as List<dynamic>)
          .map((e) => ChargerDevice.fromJson(e as Map<String, dynamic>))
          .toList(),
      serviceTimes: (json['service_times'] as List<dynamic>)
          .map((e) => ServiceTime.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$ChargerSpotImplToJson(_$ChargerSpotImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'charger_devices': instance.chargerDevices,
      'service_times': instance.serviceTimes,
      'imageUrl': instance.imageUrl,
    };

_$ChargerDeviceImpl _$$ChargerDeviceImplFromJson(Map<String, dynamic> json) =>
    _$ChargerDeviceImpl(
      uuid: json['uuid'] as String,
      power: json['power'] as num,
    );

Map<String, dynamic> _$$ChargerDeviceImplToJson(_$ChargerDeviceImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'power': instance.power,
    };

_$ServiceTimeImpl _$$ServiceTimeImplFromJson(Map<String, dynamic> json) =>
    _$ServiceTimeImpl(
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      businessDay: json['business_day'] as bool,
      day: $enumDecode(_$ServiceTimeDayEnumMap, json['day']),
    );

Map<String, dynamic> _$$ServiceTimeImplToJson(_$ServiceTimeImpl instance) =>
    <String, dynamic>{
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'business_day': instance.businessDay,
      'day': _$ServiceTimeDayEnumMap[instance.day]!,
    };

const _$ServiceTimeDayEnumMap = {
  ServiceTimeDay.sunday: 'sunday',
  ServiceTimeDay.monday: 'monday',
  ServiceTimeDay.tuesday: 'tuesday',
  ServiceTimeDay.wednesday: 'wednesday',
  ServiceTimeDay.thursday: 'thursday',
  ServiceTimeDay.friday: 'friday',
  ServiceTimeDay.saturday: 'saturday',
  ServiceTimeDay.holiday: 'holiday',
  ServiceTimeDay.weekday: 'weekday',
};
