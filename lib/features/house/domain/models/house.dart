import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/enums.dart';

part 'house.freezed.dart';
part 'house.g.dart';

@freezed
abstract class House with _$House {
  const factory House({
    required String id,
    required String name,
    String? photoPath,
    @Default(4) int roomCount,
    @Default(4) int inhabitants,
    @Default(MeterType.prepaid) MeterType meterType,
    @Default(GasBottleType.kg12) GasBottleType preferredGasBottleType,
    String? address,
    double? latitude,
    double? longitude,
    double? surfaceM2,
    String? timezone,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _House;

  factory House.fromJson(Map<String, dynamic> json) => _$HouseFromJson(json);
}
