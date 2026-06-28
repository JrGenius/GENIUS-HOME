import '../../../core/constants/app_constants.dart';
import '../../../core/services/prediction_engine.dart';
import '../../../core/services/clock.dart';
import '../domain/models/electricity_reading.dart';

/// Service for electricity consumption calculations and predictions
class ElectricityService {
  ElectricityService._();

  /// Compute daily consumptions from sequential readings
  static List<double> dailyConsumptions(List<ElectricityReading> readings) {
    if (readings.length < 2) return [];
    final sorted = [...readings]..sort((a, b) => a.date.compareTo(b.date));
    final result = <double>[];
    for (int i = 1; i < sorted.length; i++) {
      final diff = sorted[i].valueKwh - sorted[i - 1].valueKwh;
      final days = sorted[i].date.difference(sorted[i - 1].date).inDays;
      if (days > 0 && diff >= 0) {
        final daily = diff / days;
        for (int d = 0; d < days; d++) {
          result.add(daily);
        }
      }
    }
    return result;
  }

  /// Total consumption over a period
  static double totalConsumption(List<ElectricityReading> readings) {
    if (readings.length < 2) return 0;
    final sorted = [...readings]..sort((a, b) => a.date.compareTo(b.date));
    return sorted.last.valueKwh - sorted.first.valueKwh;
  }

  /// Average daily consumption
  static double averageDaily(List<ElectricityReading> readings) {
    final daily = dailyConsumptions(readings);
    if (daily.isEmpty) return 0;
    return daily.reduce((a, b) => a + b) / daily.length;
  }

  /// Average monthly consumption (from daily avg × 30)
  static double averageMonthly(List<ElectricityReading> readings) {
    return averageDaily(readings) * 30;
  }

  /// Average weekly consumption
  static double averageWeekly(List<ElectricityReading> readings) {
    return averageDaily(readings) * 7;
  }

  /// Estimated monthly cost in FCFA
  static double estimatedMonthlyCost(
    List<ElectricityReading> readings, {
    double rate = AppConstants.defaultElectricityRate,
  }) {
    return averageMonthly(readings) * rate;
  }

  /// Predicted daily consumption for the next N days
  static List<double> predictDays(List<ElectricityReading> readings, int days) {
    final daily = dailyConsumptions(readings);
    if (daily.isEmpty) return List.filled(days, 0);
    return PredictionEngine.predictSeries(daily, days);
  }

  /// Estimated remaining days based on current balance
  static double remainingDays(
    List<ElectricityReading> readings,
    double currentBalanceKwh,
  ) {
    final avg = averageDaily(readings);
    return PredictionEngine.estimatedRemainingDays(currentBalanceKwh, avg);
  }

  /// Estimated cutoff date
  static DateTime? estimatedCutoffDate(
    List<ElectricityReading> readings,
    double currentBalanceKwh, {
    Clock clock = const SystemClock(),
  }) {
    final days = remainingDays(readings, currentBalanceKwh);
    if (days.isInfinite || days.isNaN) return null;
    return clock.now().add(Duration(days: days.round()));
  }

  /// Trend direction of consumption
  static TrendDirection consumptionTrend(List<ElectricityReading> readings) {
    final daily = dailyConsumptions(readings);
    return PredictionEngine.trend(daily);
  }

  /// Confidence score for predictions
  static double predictionConfidence(List<ElectricityReading> readings) {
    final daily = dailyConsumptions(readings);
    return PredictionEngine.confidence(daily);
  }
}
