import 'package:flutter_test/flutter_test.dart';
import 'package:geniushome/core/services/prediction_engine.dart';

void main() {
  group('PredictionEngine', () {
    test('computes recent moving and weighted averages', () {
      expect(
        PredictionEngine.movingAverage([1, 2, 3, 4], window: 3),
        closeTo(3, 0.0001),
      );
      expect(
        PredictionEngine.weightedMovingAverage([1, 2, 3]),
        closeTo(14 / 6, 0.0001),
      );
    });

    test('predicts a linear series and its confidence', () {
      const values = [2.0, 4.0, 6.0, 8.0];
      expect(PredictionEngine.predictNext(values), closeTo(10, 0.0001));
      expect(PredictionEngine.predictSeries(values, 2), [10, 12]);
      expect(PredictionEngine.confidence(values), closeTo(1, 0.0001));
      expect(PredictionEngine.trend(values), TrendDirection.increasing);
    });

    test('clamps gas remaining percentage', () {
      expect(
        PredictionEngine.gasPercentRemaining(
          daysSinceStart: 40,
          typicalDurationDays: 20,
        ),
        0,
      );
    });
  });
}
