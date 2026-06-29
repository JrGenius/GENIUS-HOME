// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_House _$HouseFromJson(Map<String, dynamic> json) => _House(
  id: json['id'] as String,
  name: json['name'] as String,
  photoPath: json['photoPath'] as String?,
  roomCount: (json['roomCount'] as num?)?.toInt() ?? 4,
  inhabitants: (json['inhabitants'] as num?)?.toInt() ?? 4,
  meterType:
      $enumDecodeNullable(_$MeterTypeEnumMap, json['meterType']) ??
      MeterType.prepaid,
  preferredGasBottleType:
      $enumDecodeNullable(
        _$GasBottleTypeEnumMap,
        json['preferredGasBottleType'],
      ) ??
      GasBottleType.kg12,
  electricityRateFcfaPerKwh:
      (json['electricityRateFcfaPerKwh'] as num?)?.toDouble() ??
      AppConstants.defaultElectricityRate,
  address: json['address'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  surfaceM2: (json['surfaceM2'] as num?)?.toDouble(),
  timezone: json['timezone'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$HouseToJson(_House instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'photoPath': instance.photoPath,
  'roomCount': instance.roomCount,
  'inhabitants': instance.inhabitants,
  'meterType': _$MeterTypeEnumMap[instance.meterType]!,
  'preferredGasBottleType':
      _$GasBottleTypeEnumMap[instance.preferredGasBottleType]!,
  'electricityRateFcfaPerKwh': instance.electricityRateFcfaPerKwh,
  'address': instance.address,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'surfaceM2': instance.surfaceM2,
  'timezone': instance.timezone,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};

const _$MeterTypeEnumMap = {
  MeterType.prepaid: 'prepaid',
  MeterType.postpaid: 'postpaid',
};

const _$GasBottleTypeEnumMap = {
  GasBottleType.kg6: 'kg6',
  GasBottleType.kg12: 'kg12',
  GasBottleType.kg25: 'kg25',
  GasBottleType.kg35: 'kg35',
  GasBottleType.kg50: 'kg50',
};
