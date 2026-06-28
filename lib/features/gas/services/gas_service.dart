import '../../../core/constants/enums.dart';
import '../../../core/services/prediction_engine.dart';
import '../../../core/services/clock.dart';
import '../domain/models/gas_bottle.dart';

/// Service for gas bottle consumption estimation
class GasService {
  GasService._();

  /// Typical duration in days for each bottle type (African household averages)
  static double typicalDuration(GasBottleType type, {int inhabitants = 4}) {
    final baseWeeks = switch (type) {
      GasBottleType.kg6 => 2.0,
      GasBottleType.kg12 => 4.0,
      GasBottleType.kg25 => 8.0,
      GasBottleType.kg35 => 12.0,
      GasBottleType.kg50 => 16.0,
    };
    // Adjust for household size: more people = shorter duration
    final factor = 4.0 / inhabitants.clamp(1, 20);
    return baseWeeks * 7 * factor;
  }

  /// Estimated percentage remaining for a bottle
  static double percentRemaining(
    GasBottle bottle, {
    int inhabitants = 4,
    Clock clock = const SystemClock(),
  }) {
    final daysSince = clock.now().difference(bottle.startDate).inDays;
    final typical = typicalDuration(bottle.type, inhabitants: inhabitants);
    return PredictionEngine.gasPercentRemaining(
      daysSinceStart: daysSince,
      typicalDurationDays: typical,
    );
  }

  /// Estimated end date for a bottle
  static DateTime? estimatedEndDate(GasBottle bottle, {int inhabitants = 4}) {
    final typical = typicalDuration(bottle.type, inhabitants: inhabitants);
    return PredictionEngine.estimatedGasEndDate(
      startDate: bottle.startDate,
      typicalDurationDays: typical,
    );
  }

  /// Days remaining
  static int daysRemaining(
    GasBottle bottle, {
    int inhabitants = 4,
    Clock clock = const SystemClock(),
  }) {
    final end = estimatedEndDate(bottle, inhabitants: inhabitants);
    if (end == null) return 0;
    final remaining = end.difference(clock.now()).inDays;
    return remaining < 0 ? 0 : remaining;
  }

  /// Learn average duration from historical bottles
  static double learnedDuration(List<GasBottle> history) {
    final completed = history.where((b) => !b.isActive).toList();
    if (completed.length < 2) return 0;

    final durations = <double>[];
    for (int i = 1; i < completed.length; i++) {
      final dur = completed[i].startDate
          .difference(completed[i - 1].startDate)
          .inDays
          .toDouble();
      if (dur > 0) durations.add(dur);
    }
    if (durations.isEmpty) return 0;
    return PredictionEngine.weightedMovingAverage(durations);
  }

  /// Trend direction for gas usage (from historical durations)
  static TrendDirection usageTrend(List<GasBottle> history) {
    final completed = history.where((b) => !b.isActive).toList();
    if (completed.length < 3) return TrendDirection.stable;

    final durations = <double>[];
    for (int i = 1; i < completed.length; i++) {
      final dur = completed[i].startDate
          .difference(completed[i - 1].startDate)
          .inDays
          .toDouble();
      if (dur > 0) durations.add(dur);
    }
    // Shorter durations mean higher consumption → invert trend
    final inverted = durations.map((d) => 1.0 / d).toList();
    return PredictionEngine.trend(inverted);
  }

  /// Average monthly cost from history
  static double averageMonthlyCost(
    List<GasBottle> history, {
    Clock clock = const SystemClock(),
  }) {
    if (history.isEmpty) return 0;
    final totalCost = history.fold<double>(0, (sum, b) => sum + b.priceFcfa);
    final sorted = [...history]
      ..sort((a, b) => a.startDate.compareTo(b.startDate));
    final totalDays = clock.now().difference(sorted.first.startDate).inDays;
    if (totalDays <= 0) return 0;
    return (totalCost / totalDays) * 30;
  }
}
