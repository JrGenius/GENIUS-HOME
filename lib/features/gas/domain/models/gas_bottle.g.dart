// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gas_bottle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GasBottle _$GasBottleFromJson(Map<String, dynamic> json) => _GasBottle(
  id: json['id'] as String,
  houseId: json['houseId'] as String,
  startDate: DateTime.parse(json['startDate'] as String),
  type: $enumDecode(_$GasBottleTypeEnumMap, json['type']),
  priceFcfa: (json['priceFcfa'] as num).toDouble(),
  isActive: json['isActive'] as bool? ?? true,
  estimatedEndDate: json['estimatedEndDate'] == null
      ? null
      : DateTime.parse(json['estimatedEndDate'] as String),
  percentRemaining: (json['percentRemaining'] as num?)?.toDouble(),
  note: json['note'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$GasBottleToJson(_GasBottle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'houseId': instance.houseId,
      'startDate': instance.startDate.toIso8601String(),
      'type': _$GasBottleTypeEnumMap[instance.type]!,
      'priceFcfa': instance.priceFcfa,
      'isActive': instance.isActive,
      'estimatedEndDate': instance.estimatedEndDate?.toIso8601String(),
      'percentRemaining': instance.percentRemaining,
      'note': instance.note,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$GasBottleTypeEnumMap = {
  GasBottleType.kg6: 'kg6',
  GasBottleType.kg12: 'kg12',
  GasBottleType.kg25: 'kg25',
  GasBottleType.kg35: 'kg35',
  GasBottleType.kg50: 'kg50',
};
