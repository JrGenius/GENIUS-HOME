import 'dart:math';

/// Local AI prediction engine for GENIUS HOME™
/// Uses moving average, linear regression, trend and seasonality analysis.
/// Designed to be replaceable by TensorFlow Lite in a future version.
class PredictionEngine {
  PredictionEngine._();

  /// Compute simple moving average over [window] data points
  static double movingAverage(List<double> values, {int window = 7}) {
    if (values.isEmpty) return 0;
    final w = min(window, values.length);
    final subset = values.sublist(values.length - w);
    return subset.reduce((a, b) => a + b) / subset.length;
  }

  /// Weighted moving average giving more weight to recent values
  static double weightedMovingAverage(List<double> values, {int window = 7}) {
    if (values.isEmpty) return 0;
    final w = min(window, values.length);
    final subset = values.sublist(values.length - w);
    double weightedSum = 0;
    double weightTotal = 0;
    for (int i = 0; i < subset.length; i++) {
      final weight = (i + 1).toDouble();
      weightedSum += subset[i] * weight;
      weightTotal += weight;
    }
    return weightedSum / weightTotal;
  }

  /// Linear regression: returns (slope, intercept)
  static (double slope, double intercept) linearRegression(
    List<double> values,
  ) {
    if (values.length < 2) return (0, values.isEmpty ? 0 : values.first);

    final n = values.length;
    double sumX = 0, sumY = 0, sumXY = 0, sumX2 = 0;

    for (int i = 0; i < n; i++) {
      sumX += i;
      sumY += values[i];
      sumXY += i * values[i];
      sumX2 += i * i;
    }

    final denom = n * sumX2 - sumX * sumX;
    if (denom == 0) return (0, sumY / n);

    final slope = (n * sumXY - sumX * sumY) / denom;
    final intercept = (sumY - slope * sumX) / n;
    return (slope, intercept);
  }

  /// Predict next value using linear regression
  static double predictNext(List<double> values) {
    final (slope, intercept) = linearRegression(values);
    return slope * values.length + intercept;
  }

  /// Predict [count] future values
  static List<double> predictSeries(List<double> values, int count) {
    final (slope, intercept) = linearRegression(values);
    return List.generate(
      count,
      (i) => max(0, slope * (values.length + i) + intercept),
    );
  }

  /// Trend direction: positive, negative, or stable
  static TrendDirection trend(List<double> values) {
    if (values.length < 3) return TrendDirection.stable;
    final (slope, _) = linearRegression(values);
    final avg = values.reduce((a, b) => a + b) / values.length;
    final threshold = avg * 0.02; // 2% of average
    if (slope > threshold) return TrendDirection.increasing;
    if (slope < -threshold) return TrendDirection.decreasing;
    return TrendDirection.stable;
  }

  /// Confidence score (0.0–1.0) based on R² of linear regression
  static double confidence(List<double> values) {
    if (values.length < 3) return 0;

    final (slope, intercept) = linearRegression(values);
    final n = values.length;
    final mean = values.reduce((a, b) => a + b) / n;

    double ssRes = 0, ssTot = 0;
    for (int i = 0; i < n; i++) {
      final predicted = slope * i + intercept;
      ssRes += pow(values[i] - predicted, 2);
      ssTot += pow(values[i] - mean, 2);
    }

    if (ssTot == 0) return 1.0;
    final r2 = 1 - (ssRes / ssTot);
    return r2.clamp(0.0, 1.0);
  }

  /// Estimate daily consumption from a list of periodic readings
  static double dailyConsumption(List<double> readings, int periodDays) {
    if (readings.length < 2 || periodDays <= 0) return 0;
    final total = readings.last - readings.first;
    return total / periodDays;
  }

  /// Estimate remaining days for electricity given current balance (kWh) and daily usage
  static double estimatedRemainingDays(
    double balanceKwh,
    double dailyUsageKwh,
  ) {
    if (dailyUsageKwh <= 0) return double.infinity;
    return balanceKwh / dailyUsageKwh;
  }

  /// Estimate remaining gas percentage based on days used and typical duration
  static double gasPercentRemaining({
    required int daysSinceStart,
    required double typicalDurationDays,
  }) {
    if (typicalDurationDays <= 0) return 0;
    return (1 - daysSinceStart / typicalDurationDays).clamp(0.0, 1.0) * 100;
  }

  /// Estimate gas end date
  static DateTime? estimatedGasEndDate({
    required DateTime startDate,
    required double typicalDurationDays,
  }) {
    if (typicalDurationDays <= 0) return null;
    return startDate.add(Duration(days: typicalDurationDays.round()));
  }

  /// Detect weekly seasonality pattern from daily values (at least 14 days)
  static List<double>? weeklyPattern(List<double> dailyValues) {
    if (dailyValues.length < 14) return null;
    final pattern = List.filled(7, 0.0);
    final counts = List.filled(7, 0);

    for (int i = 0; i < dailyValues.length; i++) {
      final day = i % 7;
      pattern[day] += dailyValues[i];
      counts[day]++;
    }

    for (int i = 0; i < 7; i++) {
      if (counts[i] > 0) pattern[i] /= counts[i];
    }
    return pattern;
  }
}

enum TrendDirection {
  increasing('En hausse'),
  decreasing('En baisse'),
  stable('Stable');

  const TrendDirection(this.label);
  final String label;
}
