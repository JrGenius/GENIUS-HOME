import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/enums.dart';

part 'device.freezed.dart';
part 'device.g.dart';

@freezed
abstract class Device with _$Device {
  const factory Device({
    required String id,
    required String roomId,
    required String name,
    String? brand,
    String? model,
    String? photoPath,
    required DeviceCategory category,
    required double powerWatts,
    @Default(0) double avgConsumptionKwh,
    @Default(0) double avgUsageHoursPerDay,
    @Default(0) double standbyWatts,
    @Default(0) double estimatedMonthlyCostFcfa,
    @Default(true) bool isActive,
    required DateTime createdAt,
  }) = _Device;

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
}
