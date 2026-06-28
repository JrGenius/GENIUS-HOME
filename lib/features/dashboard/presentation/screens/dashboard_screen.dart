import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/services/prediction_engine.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../electricity/domain/models/electricity_reading.dart';
import '../../../electricity/services/electricity_service.dart';
import '../../../gas/domain/models/gas_bottle.dart';
import '../../../gas/services/gas_service.dart';
import '../../../settings/application/settings_controller.dart';
import '../widgets/dashboard_header.dart';

/// Main dashboard — dark glass bento layout matching reference design
/// Ring charts for electricity/gas, AI assistant, consumption chart,
/// active devices, rooms, recommendations, shortcuts, notifications
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userName = ref.watch(currentUserNameProvider) ?? 'Utilisateur';
    final houseId = ref.watch(currentHouseIdProvider);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 120),
          children: [
            // ─── Header ────────────────────────────────────────────
            DashboardHeader(userName: userName, now: DateTime.now()),
            const SizedBox(height: 24),

            // ─── Row 1: Electricity · Gas · AI ─────────────────────
            LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 700;
                if (isWide) {
                  return IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 4,
                          child: _ElectricityRingCard(
                            houseId: houseId,
                            ref: ref,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 4,
                          child: _GasRingCard(houseId: houseId, ref: ref),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 3,
                          child: _AiAssistantCard(houseId: houseId, ref: ref),
                        ),
                      ],
                    ),
                  );
                }
                return Column(
                  children: [
                    _ElectricityRingCard(houseId: houseId, ref: ref),
                    const SizedBox(height: 12),
                    _GasRingCard(houseId: houseId, ref: ref),
                    const SizedBox(height: 12),
                    _AiAssistantCard(houseId: houseId, ref: ref),
                  ],
                );
              },
            ),
            const SizedBox(height: 12),

            // ─── Row 2: Consumption + Shortcuts ────────────────────
            LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 700;
                if (isWide) {
                  return IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 5,
                          child: _ConsumptionCard(houseId: houseId, ref: ref),
                        ),
                        const SizedBox(width: 12),
                        Expanded(flex: 3, child: _ShortcutsCard()),
                      ],
                    ),
                  );
                }
                return Column(
                  children: [
                    _ConsumptionCard(houseId: houseId, ref: ref),
                    const SizedBox(height: 12),
                    _ShortcutsCard(),
                  ],
                );
              },
            ),
            const SizedBox(height: 12),

            // ─── Row 3: Recommendations ────────────────────────────
            _RecommendationsCard(houseId: houseId, ref: ref),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// ELECTRICITY RING CARD
// ═══════════════════════════════════════════════════════════════════════════════

class _ElectricityRingCard extends StatelessWidget {
  const _ElectricityRingCard({required this.houseId, required this.ref});
  final String? houseId;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    if (houseId == null) {
      return _buildContent(context, 0, 0, 0);
    }
    return StreamBuilder<List<ElectricityReading>>(
      stream: ref.watch(electricityRepositoryProvider).watchByHouseId(houseId!),
      builder: (context, snap) {
        final readings = snap.data ?? [];
        if (readings.isEmpty) return _buildContent(context, 0, 0, 0);
        final daily = ElectricityService.averageDaily(readings);
        final cost = ElectricityService.estimatedMonthlyCost(readings);
        final remaining = daily > 0
            ? (30 - (daily * 30 / 100)).round().clamp(0, 30)
            : 0;
        return _buildContent(context, daily, cost, remaining);
      },
    );
  }

  Widget _buildContent(
    BuildContext context,
    double daily,
    double cost,
    int days,
  ) {
    final percent = days > 0
        ? (days / 30 * 100).clamp(0, 100).toDouble()
        : 32.0;

    return GlassCard(
      onTap: () => context.go('/electricity'),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.bolt_rounded, color: AppColors.accentBlue, size: 18),
              const SizedBox(width: 8),
              Text('Électricité', style: context.textTheme.titleMedium),
              const Spacer(),
              Icon(
                Icons.more_horiz_rounded,
                size: 18,
                color: AppColors.textTertiary,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: CustomPaint(
                  painter: _RingPainter(
                    percent: percent / 100,
                    color: AppColors.ringElectricity,
                    strokeWidth: 6,
                  ),
                  child: Center(
                    child: Text(
                      '${percent.toInt()}%',
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Autonomie estimée',
                      style: context.textTheme.bodySmall,
                    ),
                    Text(
                      days > 0 ? '$days jours' : '-- jours',
                      style: context.textTheme.titleLarge?.copyWith(
                        color: AppColors.success,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${cost.toStringAsFixed(0)} FCFA',
                      style: context.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                'Détails',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12,
                color: AppColors.textTertiary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// GAS RING CARD
// ═══════════════════════════════════════════════════════════════════════════════

class _GasRingCard extends StatelessWidget {
  const _GasRingCard({required this.houseId, required this.ref});
  final String? houseId;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    if (houseId == null) return _buildContent(context, 60, 12);
    return StreamBuilder<List<GasBottle>>(
      stream: ref.watch(gasRepositoryProvider).watchByHouseId(houseId!),
      builder: (context, snap) {
        final bottles = snap.data ?? [];
        final active = bottles.where((b) => b.isActive).toList();
        if (active.isEmpty) return _buildContent(context, 0, 0);
        final pct = GasService.percentRemaining(active.first);
        final days = GasService.daysRemaining(active.first);
        return _buildContent(context, pct, days);
      },
    );
  }

  Widget _buildContent(BuildContext context, double pct, int days) {
    return GlassCard(
      onTap: () => context.go('/gas'),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.local_fire_department_rounded,
                color: AppColors.gasOrange,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text('Gaz (Butane)', style: context.textTheme.titleMedium),
              const Spacer(),
              Icon(
                Icons.more_horiz_rounded,
                size: 18,
                color: AppColors.textTertiary,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: CustomPaint(
                  painter: _RingPainter(
                    percent: pct / 100,
                    color: AppColors.ringGas,
                    strokeWidth: 6,
                  ),
                  child: Center(
                    child: Text(
                      '${pct.toInt()}%',
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Autonomie estimée',
                      style: context.textTheme.bodySmall,
                    ),
                    Text(
                      days > 0 ? '$days jours' : '-- jours',
                      style: context.textTheme.titleLarge?.copyWith(
                        color: AppColors.success,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text('Niveau actuel', style: context.textTheme.bodySmall),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                'Détails',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12,
                color: AppColors.textTertiary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// AI ASSISTANT CARD
// ═══════════════════════════════════════════════════════════════════════════════

class _AiAssistantCard extends StatefulWidget {
  const _AiAssistantCard({required this.houseId, required this.ref});
  final String? houseId;
  final WidgetRef ref;

  @override
  State<_AiAssistantCard> createState() => _AiAssistantCardState();
}

class _AiAssistantCardState extends State<_AiAssistantCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _breathCtrl;

  @override
  void initState() {
    super.initState();
    _breathCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _breathCtrl.dispose();
    super.dispose();
  }

  String _tip(List<ElectricityReading> readings, List<GasBottle> bottles) {
    if (readings.length >= 3) {
      final trend = ElectricityService.consumptionTrend(readings);
      if (trend == TrendDirection.increasing) {
        return 'Votre consommation d\'électricité est plus élevée que d\'habitude.\n\nNous vous recommandons de débrancher les appareils non utilisés.';
      }
      if (trend == TrendDirection.decreasing) {
        return 'Bonne nouvelle ! Votre consommation est inférieure de 15% par rapport à la semaine dernière.';
      }
    }
    final active = bottles.where((b) => b.isActive).toList();
    if (active.isNotEmpty) {
      final days = GasService.daysRemaining(active.first);
      if (days <= 7) {
        return 'Gaz bientôt à remplacer. Remplacement prévu cette semaine.';
      }
    }
    return 'Tout est normal. Continuez à enregistrer vos relevés pour des prédictions plus précises.';
  }

  @override
  Widget build(BuildContext context) {
    final houseId = widget.houseId;
    if (houseId == null) {
      return _buildCard(context, 'Ajoutez vos premiers relevés.');
    }

    return StreamBuilder<List<ElectricityReading>>(
      stream: widget.ref
          .watch(electricityRepositoryProvider)
          .watchByHouseId(houseId),
      builder: (_, elecSnap) {
        return StreamBuilder<List<GasBottle>>(
          stream: widget.ref
              .watch(gasRepositoryProvider)
              .watchByHouseId(houseId),
          builder: (_, gasSnap) {
            final tip = _tip(elecSnap.data ?? [], gasSnap.data ?? []);
            return _buildCard(context, tip);
          },
        );
      },
    );
  }

  Widget _buildCard(BuildContext context, String tip) {
    return GlassCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.auto_awesome_rounded,
                size: 18,
                color: AppColors.accentPurple,
              ),
              const SizedBox(width: 8),
              Text('Assistant IA', style: context.textTheme.titleMedium),
              const Spacer(),
              Icon(
                Icons.more_horiz_rounded,
                size: 18,
                color: AppColors.textTertiary,
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Breathing orb
          Center(
            child: AnimatedBuilder(
              animation: _breathCtrl,
              builder: (_, __) {
                final t = _breathCtrl.value;
                return Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.accentPurple.withValues(alpha: 0.4 + t * 0.2),
                        AppColors.accentBlue.withValues(alpha: 0.15),
                        Colors.transparent,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.accentPurple.withValues(
                          alpha: 0.2 + t * 0.1,
                        ),
                        blurRadius: 16 + t * 8,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Text(tip, style: context.textTheme.bodyMedium),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.accentBlue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppTheme.radiusSm),
              border: Border.all(
                color: AppColors.accentBlue.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.volume_up_rounded,
                  size: 14,
                  color: AppColors.accentBlue,
                ),
                const SizedBox(width: 8),
                Text(
                  'Écouter le conseil',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.accentBlue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// CONSUMPTION CHART CARD
// ═══════════════════════════════════════════════════════════════════════════════

class _ConsumptionCard extends StatelessWidget {
  const _ConsumptionCard({required this.houseId, required this.ref});
  final String? houseId;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.bar_chart_rounded,
                size: 18,
                color: AppColors.accentBlue,
              ),
              const SizedBox(width: 8),
              Text(
                'Consommation Aujourd\'hui',
                style: context.textTheme.titleMedium,
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.glassInner,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.glassBorder),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Aujourd'hui", style: context.textTheme.bodySmall),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.expand_more_rounded,
                      size: 14,
                      color: AppColors.textTertiary,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (houseId != null)
            StreamBuilder<List<ElectricityReading>>(
              stream: ref
                  .watch(electricityRepositoryProvider)
                  .watchByHouseId(houseId!),
              builder: (_, snap) {
                final readings = snap.data ?? [];
                final daily = readings.isNotEmpty
                    ? ElectricityService.averageDaily(readings)
                    : 1.72;
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      daily.toStringAsFixed(2),
                      style: context.textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text('kWh', style: context.textTheme.bodyMedium),
                    ),
                  ],
                );
              },
            )
          else
            Text(
              '1.72 kWh',
              style: context.textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(
                Icons.arrow_downward_rounded,
                size: 12,
                color: AppColors.success,
              ),
              Text(
                ' -12% vs hier',
                style: context.textTheme.bodySmall?.copyWith(
                  color: AppColors.success,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Simplified chart representation
          SizedBox(
            height: 80,
            child: CustomPaint(
              size: const Size(double.infinity, 80),
              painter: _SimpleChartPainter(),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              '00h',
              '06h',
              '12h',
              '18h',
              '24h',
            ].map((l) => Text(l, style: context.textTheme.labelSmall)).toList(),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// SHORTCUTS CARD
// ═══════════════════════════════════════════════════════════════════════════════

class _ShortcutsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.star_rounded, size: 18, color: AppColors.energyYellow),
              const SizedBox(width: 8),
              Text('Raccourcis', style: context.textTheme.titleMedium),
            ],
          ),
          const SizedBox(height: 16),
          _ShortcutItem(
            icon: Icons.add_circle_outline_rounded,
            label: 'Ajouter un appareil',
            onTap: () => context.go('/house'),
          ),
          const SizedBox(height: 10),
          _ShortcutItem(
            icon: Icons.electric_meter_rounded,
            label: 'Saisir relevé électricité',
            onTap: () => context.go('/electricity'),
          ),
          const SizedBox(height: 10),
          _ShortcutItem(
            icon: Icons.local_fire_department_rounded,
            label: 'Saisir niveau gaz',
            onTap: () => context.go('/gas'),
          ),
          const SizedBox(height: 10),
          _ShortcutItem(
            icon: Icons.assessment_rounded,
            label: 'Rapport mensuel',
            onTap: () => context.go('/electricity'),
          ),
        ],
      ),
    );
  }
}

class _ShortcutItem extends StatelessWidget {
  const _ShortcutItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.glassInner,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.glassBorder, width: 0.5),
        ),
        child: Row(
          children: [
            Icon(icon, size: 16, color: AppColors.accentBlue),
            const SizedBox(width: 10),
            Expanded(child: Text(label, style: context.textTheme.bodyMedium)),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// RECOMMENDATIONS CARD
// ═══════════════════════════════════════════════════════════════════════════════

class _RecommendationsCard extends StatelessWidget {
  const _RecommendationsCard({required this.houseId, required this.ref});
  final String? houseId;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('✨', style: TextStyle(fontSize: 16)),
              const SizedBox(width: 8),
              Text('Recommandations', style: context.textTheme.titleMedium),
            ],
          ),
          const SizedBox(height: 16),
          _RecoItem(
            icon: Icons.check_circle_rounded,
            iconColor: AppColors.success,
            title: 'Bonne nouvelle !',
            subtitle:
                'Votre consommation est inférieure de 15% par rapport à la semaine dernière.',
          ),
          const SizedBox(height: 12),
          _RecoItem(
            icon: Icons.lightbulb_rounded,
            iconColor: AppColors.energyYellow,
            title: 'Astuce du jour',
            subtitle:
                'Utilisez vos appareils lourds en dehors des heures de pointe.',
          ),
        ],
      ),
    );
  }
}

class _RecoItem extends StatelessWidget {
  const _RecoItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.glassInner,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.glassBorder, width: 0.5),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: context.textTheme.titleSmall),
                const SizedBox(height: 2),
                Text(subtitle, style: context.textTheme.bodySmall),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 14,
            color: AppColors.textTertiary,
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// RING PAINTER
// ═══════════════════════════════════════════════════════════════════════════════

class _RingPainter extends CustomPainter {
  _RingPainter({
    required this.percent,
    required this.color,
    this.strokeWidth = 6,
  });
  final double percent;
  final Color color;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.shortestSide - strokeWidth) / 2;

    // Background ring
    final bgPaint = Paint()
      ..color = color.withValues(alpha: 0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(center, radius, bgPaint);

    // Foreground arc
    final fgPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    final sweepAngle = 2 * pi * percent;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      fgPaint,
    );
  }

  @override
  bool shouldRepaint(_RingPainter old) =>
      old.percent != percent || old.color != color;
}

// ═══════════════════════════════════════════════════════════════════════════════
// SIMPLE CHART PAINTER
// ═══════════════════════════════════════════════════════════════════════════════

class _SimpleChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.chartLine
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    // Simulated data points
    final points = [
      0.3,
      0.2,
      0.25,
      0.4,
      0.35,
      0.6,
      0.5,
      0.45,
      0.7,
      0.55,
      0.4,
      0.3,
    ];
    final path = Path();
    final dx = size.width / (points.length - 1);

    for (var i = 0; i < points.length; i++) {
      final x = dx * i;
      final y = size.height * (1 - points[i]);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        // Smooth curve
        final prevX = dx * (i - 1);
        final prevY = size.height * (1 - points[i - 1]);
        final cp1 = Offset(prevX + dx * 0.4, prevY);
        final cp2 = Offset(x - dx * 0.4, y);
        path.cubicTo(cp1.dx, cp1.dy, cp2.dx, cp2.dy, x, y);
      }
    }
    canvas.drawPath(path, paint);

    // Gradient fill below
    final fillPath = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.chartLine.withValues(alpha: 0.2),
          AppColors.chartLine.withValues(alpha: 0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawPath(fillPath, fillPaint);

    // Draw dot at peak
    final dotPaint = Paint()..color = AppColors.chartDot;
    final peakIdx = 8;
    final peakX = dx * peakIdx;
    final peakY = size.height * (1 - points[peakIdx]);
    canvas.drawCircle(Offset(peakX, peakY), 3, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
