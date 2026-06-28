// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Device _$DeviceFromJson(Map<String, dynamic> json) => _Device(
  id: json['id'] as String,
  roomId: json['roomId'] as String,
  name: json['name'] as String,
  brand: json['brand'] as String?,
  model: json['model'] as String?,
  photoPath: json['photoPath'] as String?,
  category: $enumDecode(_$DeviceCategoryEnumMap, json['category']),
  powerWatts: (json['powerWatts'] as num).toDouble(),
  avgConsumptionKwh: (json['avgConsumptionKwh'] as num?)?.toDouble() ?? 0,
  avgUsageHoursPerDay: (json['avgUsageHoursPerDay'] as num?)?.toDouble() ?? 0,
  standbyWatts: (json['standbyWatts'] as num?)?.toDouble() ?? 0,
  estimatedMonthlyCostFcfa:
      (json['estimatedMonthlyCostFcfa'] as num?)?.toDouble() ?? 0,
  isActive: json['isActive'] as bool? ?? true,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$DeviceToJson(_Device instance) => <String, dynamic>{
  'id': instance.id,
  'roomId': instance.roomId,
  'name': instance.name,
  'brand': instance.brand,
  'model': instance.model,
  'photoPath': instance.photoPath,
  'category': _$DeviceCategoryEnumMap[instance.category]!,
  'powerWatts': instance.powerWatts,
  'avgConsumptionKwh': instance.avgConsumptionKwh,
  'avgUsageHoursPerDay': instance.avgUsageHoursPerDay,
  'standbyWatts': instance.standbyWatts,
  'estimatedMonthlyCostFcfa': instance.estimatedMonthlyCostFcfa,
  'isActive': instance.isActive,
  'createdAt': instance.createdAt.toIso8601String(),
};

const _$DeviceCategoryEnumMap = {
  DeviceCategory.lighting: 'lighting',
  DeviceCategory.ventilation: 'ventilation',
  DeviceCategory.kitchen: 'kitchen',
  DeviceCategory.multimedia: 'multimedia',
  DeviceCategory.computing: 'computing',
  DeviceCategory.internet: 'internet',
  DeviceCategory.security: 'security',
  DeviceCategory.airConditioning: 'airConditioning',
  DeviceCategory.pumping: 'pumping',
  DeviceCategory.appliance: 'appliance',
  DeviceCategory.charging: 'charging',
  DeviceCategory.gaming: 'gaming',
  DeviceCategory.other: 'other',
};
