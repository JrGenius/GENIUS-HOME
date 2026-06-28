import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/services/prediction_engine.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../domain/models/electricity_reading.dart';
import '../../services/electricity_service.dart';
import '../../../settings/application/settings_controller.dart';

/// Electricity tracking screen with readings, stats, and chart
class ElectricityScreen extends ConsumerWidget {
  const ElectricityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final houseId = ref.watch(currentHouseIdProvider);
    if (houseId == null) {
      return Scaffold(
        body: Center(
          child: Text(
            'Configurez une maison d\'abord.',
            style: context.textTheme.bodyLarge,
          ),
        ),
      );
    }

    final repo = ref.watch(electricityRepositoryProvider);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: StreamBuilder<List<ElectricityReading>>(
          stream: repo.watchByHouseId(houseId),
          builder: (context, snapshot) {
            final readings = snapshot.data ?? [];
            return ListView(
              padding: const EdgeInsets.fromLTRB(
                AppTheme.spacingLg,
                AppTheme.spacingXl,
                AppTheme.spacingLg,
                120,
              ),
              children: [
                Text('Électricité', style: context.textTheme.headlineLarge),
                const SizedBox(height: 4),
                Text(
                  'Suivi de votre consommation',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                ),
                const SizedBox(height: AppTheme.spacingXl),

                _StatsRow(readings: readings),
                const SizedBox(height: AppTheme.spacingLg),

                if (readings.length >= 2) ...[
                  SectionHeader(title: 'Évolution'),
                  _ConsumptionChart(readings: readings),
                  const SizedBox(height: AppTheme.spacingLg),
                ],

                if (readings.length >= 3) ...[
                  _PredictionCard(readings: readings),
                  const SizedBox(height: AppTheme.spacingLg),
                ],

                SectionHeader(title: 'Historique'),
                if (readings.isEmpty)
                  GlassCard(
                    child: Text(
                      'Aucun relevé. Ajoutez votre premier relevé pour démarrer le suivi.',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.onSurface.withValues(
                          alpha: 0.5,
                        ),
                      ),
                    ),
                  )
                else
                  ...readings.map(
                    (r) => Padding(
                      padding: const EdgeInsets.only(
                        bottom: AppTheme.spacingSm,
                      ),
                      child: _ReadingTile(reading: r),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddReading(context, ref, houseId),
        backgroundColor: AppColors.geniusBlueSoft,
        foregroundColor: Colors.white,
        elevation: 0,
        child: const Icon(Icons.add_rounded),
      ),
    );
  }

  void _showAddReading(BuildContext context, WidgetRef ref, String houseId) {
    final valueCtrl = TextEditingController();
    final costCtrl = TextEditingController();
    var meterType = MeterType.prepaid;

    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Nouveau relevé'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: valueCtrl,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Valeur (kWh)',
                    suffixText: 'kWh',
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: costCtrl,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Coût (optionnel)',
                    suffixText: 'FCFA',
                  ),
                ),
                const SizedBox(height: 16),
                SegmentedButton<MeterType>(
                  segments: MeterType.values
                      .map((t) => ButtonSegment(value: t, label: Text(t.label)))
                      .toList(),
                  selected: {meterType},
                  onSelectionChanged: (v) =>
                      setDialogState(() => meterType = v.first),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Annuler'),
            ),
            FilledButton(
              onPressed: () async {
                final value = double.tryParse(valueCtrl.text);
                if (value == null) return;
                final cost = double.tryParse(costCtrl.text);
                final reading = ElectricityReading(
                  id: const Uuid().v4(),
                  houseId: houseId,
                  date: DateTime.now(),
                  valueKwh: value,
                  meterType: meterType,
                  costFcfa: cost,
                  createdAt: DateTime.now(),
                );
                await ref.read(electricityRepositoryProvider).insert(reading);
                if (context.mounted) Navigator.pop(context);
              },
              child: const Text('Ajouter'),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow({required this.readings});
  final List<ElectricityReading> readings;

  @override
  Widget build(BuildContext context) {
    final daily = ElectricityService.averageDaily(readings);
    final monthly = ElectricityService.averageMonthly(readings);
    final cost = ElectricityService.estimatedMonthlyCost(readings);

    return Row(
      children: [
        Expanded(
          child: _StatCard(
            label: 'Moy. jour',
            value: daily,
            suffix: ' kWh',
            color: AppColors.energyYellow,
          ),
        ),
        const SizedBox(width: AppTheme.spacingMd),
        Expanded(
          child: _StatCard(
            label: 'Moy. mois',
            value: monthly,
            suffix: ' kWh',
            color: AppColors.geniusBlueSoft,
          ),
        ),
        const SizedBox(width: AppTheme.spacingMd),
        Expanded(
          child: _StatCard(
            label: 'Coût/mois',
            value: cost,
            suffix: ' F',
            color: AppColors.economy,
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.suffix,
    required this.color,
  });
  final String label;
  final double value;
  final String suffix;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(AppTheme.spacingMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
          const SizedBox(height: AppTheme.spacingSm),
          AnimatedValue(
            value: value,
            suffix: suffix,
            fractionDigits: value < 100 ? 1 : 0,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 2),
          Text(label, style: context.textTheme.labelSmall),
        ],
      ),
    );
  }
}

class _ConsumptionChart extends StatelessWidget {
  const _ConsumptionChart({required this.readings});
  final List<ElectricityReading> readings;

  @override
  Widget build(BuildContext context) {
    final sorted = [...readings]..sort((a, b) => a.date.compareTo(b.date));
    final spots = sorted.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value.valueKwh);
    }).toList();

    return GlassCard(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      child: SizedBox(
        height: 180,
        child: LineChart(
          LineChartData(
            gridData: const FlGridData(show: false),
            titlesData: const FlTitlesData(show: false),
            borderData: FlBorderData(show: false),
            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                getTooltipItems: (spots) => spots.map((s) {
                  return LineTooltipItem(
                    '${s.y.toStringAsFixed(1)} kWh',
                    TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  );
                }).toList(),
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: spots,
                isCurved: true,
                curveSmoothness: 0.35,
                color: AppColors.geniusBlueSoft,
                barWidth: 2.5,
                isStrokeCapRound: true,
                dotData: FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, bar, index) =>
                      FlDotCirclePainter(
                        radius: 3.5,
                        color: AppColors.geniusBlueSoft,
                        strokeWidth: 2,
                        strokeColor: AppColors.white,
                      ),
                ),
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.geniusBlueSoft.withValues(alpha: 0.15),
                      AppColors.geniusBlueSoft.withValues(alpha: 0.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
          duration: AppTheme.medium,
          curve: AppTheme.springCurve,
        ),
      ),
    );
  }
}

class _PredictionCard extends StatelessWidget {
  const _PredictionCard({required this.readings});
  final List<ElectricityReading> readings;

  @override
  Widget build(BuildContext context) {
    final trend = ElectricityService.consumptionTrend(readings);
    final confidence = ElectricityService.predictionConfidence(readings);
    final predicted = PredictionEngine.predictNext(
      ElectricityService.dailyConsumptions(readings),
    );

    final trendColor = switch (trend) {
      TrendDirection.increasing => AppColors.critical,
      TrendDirection.decreasing => AppColors.economy,
      TrendDirection.stable => AppColors.geniusBlueSoft,
    };

    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: trendColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                ),
                child: Icon(
                  Icons.insights_rounded,
                  color: trendColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text('Prédiction IA', style: context.textTheme.titleMedium),
            ],
          ),
          const SizedBox(height: AppTheme.spacingMd),
          _InfoRow('Tendance', trend.label, trendColor),
          _InfoRow('Conso. prédite demain', Formatters.kwh(predicted), null),
          _InfoRow('Confiance', Formatters.percent(confidence * 100), null),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow(this.label, this.value, this.valueColor);
  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ),
          Text(
            value,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _ReadingTile extends StatelessWidget {
  const _ReadingTile({required this.reading});
  final ElectricityReading reading;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingLg,
        vertical: AppTheme.spacingMd,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.energyYellow.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.electric_meter_rounded,
              color: AppColors.energyYellow,
              size: 18,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Formatters.kwh(reading.valueKwh),
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  Formatters.shortDate(reading.date),
                  style: context.textTheme.labelSmall,
                ),
              ],
            ),
          ),
          if (reading.costFcfa != null)
            Text(
              Formatters.currency(reading.costFcfa!),
              style: context.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.economy,
              ),
            ),
        ],
      ),
    );
  }
}
