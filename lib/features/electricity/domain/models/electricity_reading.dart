import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/enums.dart';

part 'electricity_reading.freezed.dart';
part 'electricity_reading.g.dart';

@freezed
abstract class ElectricityReading with _$ElectricityReading {
  const factory ElectricityReading({
    required String id,
    required String houseId,
    required DateTime date,
    required double valueKwh,
    required MeterType meterType,
    double? costFcfa,
    String? note,
    required DateTime createdAt,
  }) = _ElectricityReading;

  factory ElectricityReading.fromJson(Map<String, dynamic> json) =>
      _$ElectricityReadingFromJson(json);
}
