import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/enums.dart';

part 'gas_bottle.freezed.dart';
part 'gas_bottle.g.dart';

@freezed
abstract class GasBottle with _$GasBottle {
  const factory GasBottle({
    required String id,
    required String houseId,
    required DateTime startDate,
    required GasBottleType type,
    required double priceFcfa,
    @Default(true) bool isActive,
    DateTime? estimatedEndDate,
    double? percentRemaining,
    String? note,
    required DateTime createdAt,
  }) = _GasBottle;

  factory GasBottle.fromJson(Map<String, dynamic> json) =>
      _$GasBottleFromJson(json);
}
