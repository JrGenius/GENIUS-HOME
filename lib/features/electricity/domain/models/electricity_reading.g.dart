// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electricity_reading.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ElectricityReading _$ElectricityReadingFromJson(Map<String, dynamic> json) =>
    _ElectricityReading(
      id: json['id'] as String,
      houseId: json['houseId'] as String,
      date: DateTime.parse(json['date'] as String),
      valueKwh: (json['valueKwh'] as num).toDouble(),
      meterType: $enumDecode(_$MeterTypeEnumMap, json['meterType']),
      costFcfa: (json['costFcfa'] as num?)?.toDouble(),
      note: json['note'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ElectricityReadingToJson(_ElectricityReading instance) =>
    <String, dynamic>{
      'id': instance.id,
      'houseId': instance.houseId,
      'date': instance.date.toIso8601String(),
      'valueKwh': instance.valueKwh,
      'meterType': _$MeterTypeEnumMap[instance.meterType]!,
      'costFcfa': instance.costFcfa,
      'note': instance.note,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$MeterTypeEnumMap = {
  MeterType.prepaid: 'prepaid',
  MeterType.postpaid: 'postpaid',
};
