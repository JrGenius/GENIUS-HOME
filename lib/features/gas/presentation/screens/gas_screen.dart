import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../domain/models/gas_bottle.dart';
import '../../services/gas_service.dart';
import '../../../settings/application/settings_controller.dart';

/// Gas tracking screen — premium bottle management and estimation
class GasScreen extends ConsumerWidget {
  const GasScreen({super.key});

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

    final repo = ref.watch(gasRepositoryProvider);
    final inhabitants =
        ref.watch(currentHouseProvider).valueOrNull?.inhabitants ?? 4;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: StreamBuilder<List<GasBottle>>(
          stream: repo.watchByHouseId(houseId),
          builder: (context, snapshot) {
            final bottles = snapshot.data ?? [];
            final active = bottles.where((b) => b.isActive).toList();
            final history = bottles.where((b) => !b.isActive).toList();

            return ListView(
              padding: const EdgeInsets.fromLTRB(
                AppTheme.spacingLg,
                AppTheme.spacingXl,
                AppTheme.spacingLg,
                120,
              ),
              children: [
                Text('Gaz', style: context.textTheme.headlineLarge),
                const SizedBox(height: 4),
                Text(
                  'Suivi de votre bouteille de gaz',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                ),
                const SizedBox(height: AppTheme.spacingXl),

                if (active.isNotEmpty)
                  _ActiveBottleCard(
                    bottle: active.first,
                    inhabitants: inhabitants,
                    onMarkEmpty: () async {
                      final updated = active.first.copyWith(isActive: false);
                      await ref.read(gasRepositoryProvider).update(updated);
                    },
                  )
                else
                  _EmptyBottleCard(
                    onAdd: () => _showAddBottle(context, ref, houseId),
                  ),

                const SizedBox(height: AppTheme.spacingLg),

                if (bottles.length >= 2) ...[
                  _CostCard(bottles: bottles),
                  const SizedBox(height: AppTheme.spacingLg),
                ],

                if (history.isNotEmpty) ...[
                  SectionHeader(title: 'Historique'),
                  ...history.map(
                    (b) => Padding(
                      padding: const EdgeInsets.only(
                        bottom: AppTheme.spacingSm,
                      ),
                      child: _HistoryTile(bottle: b),
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddBottle(context, ref, houseId),
        backgroundColor: AppColors.gasOrange,
        foregroundColor: Colors.white,
        elevation: 0,
        child: const Icon(Icons.add_rounded),
      ),
    );
  }

  void _showAddBottle(BuildContext context, WidgetRef ref, String houseId) {
    final priceCtrl = TextEditingController();
    var type = GasBottleType.kg12;

    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Nouvelle bouteille'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: GasBottleType.values.map((t) {
                    return ChoiceChip(
                      label: Text(t.label),
                      selected: t == type,
                      onSelected: (_) => setDialogState(() => type = t),
                    );
                  }).toList(),
                ),
                const SizedBox(height: AppTheme.spacingMd),
                TextField(
                  controller: priceCtrl,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Prix payé',
                    suffixText: 'FCFA',
                  ),
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
                final price = double.tryParse(priceCtrl.text);
                if (price == null) return;
                final bottle = GasBottle(
                  id: const Uuid().v4(),
                  houseId: houseId,
                  startDate: DateTime.now(),
                  type: type,
                  priceFcfa: price,
                  createdAt: DateTime.now(),
                );
                await ref.read(gasRepositoryProvider).replaceActive(bottle);
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

class _ActiveBottleCard extends StatelessWidget {
  const _ActiveBottleCard({
    required this.bottle,
    required this.inhabitants,
    required this.onMarkEmpty,
  });
  final GasBottle bottle;
  final int inhabitants;
  final VoidCallback onMarkEmpty;

  @override
  Widget build(BuildContext context) {
    final percent = GasService.percentRemaining(
      bottle,
      inhabitants: inhabitants,
    );
    final daysLeft = GasService.daysRemaining(bottle, inhabitants: inhabitants);
    final endDate = GasService.estimatedEndDate(
      bottle,
      inhabitants: inhabitants,
    );

    final progressColor = percent > 30
        ? AppColors.economy
        : percent > 10
        ? AppColors.warning
        : AppColors.critical;

    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.gasOrange.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                ),
                child: Icon(
                  Icons.local_fire_department_rounded,
                  color: AppColors.gasOrange,
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Bouteille en cours',
                  style: context.textTheme.titleMedium,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.gasOrange.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                ),
                child: Text(
                  bottle.type.label,
                  style: context.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.gasOrange,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingLg),

          // Big percentage
          Center(
            child: AnimatedValue(
              value: percent,
              suffix: '%',
              fractionDigits: 0,
              style: context.textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.w800,
                color: progressColor,
              ),
            ),
          ),
          const SizedBox(height: AppTheme.spacingMd),

          // Progress bar
          TweenAnimationBuilder<double>(
            tween: Tween(end: percent / 100),
            duration: AppTheme.slow,
            curve: AppTheme.springCurve,
            builder: (_, v, __) => ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: v,
                minHeight: 8,
                color: progressColor,
                backgroundColor: progressColor.withValues(alpha: 0.1),
              ),
            ),
          ),
          const SizedBox(height: AppTheme.spacingMd),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Formatters.daysRemaining(daysLeft),
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (endDate != null)
                Text(
                  Formatters.shortDate(endDate),
                  style: context.textTheme.bodySmall,
                ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingLg),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: onMarkEmpty,
              icon: const Icon(Icons.swap_horiz_rounded),
              label: const Text('Bouteille terminée'),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyBottleCard extends StatelessWidget {
  const _EmptyBottleCard({required this.onAdd});
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(AppTheme.spacingXl),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.gasOrange.withValues(alpha: 0.08),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.local_fire_department_rounded,
              size: 36,
              color: AppColors.gasOrange.withValues(alpha: 0.5),
            ),
          ),
          const SizedBox(height: AppTheme.spacingMd),
          Text('Aucune bouteille active', style: context.textTheme.titleMedium),
          const SizedBox(height: AppTheme.spacingSm),
          Text(
            'Enregistrez votre bouteille pour démarrer le suivi.',
            textAlign: TextAlign.center,
            style: context.textTheme.bodySmall,
          ),
          const SizedBox(height: AppTheme.spacingLg),
          FilledButton.icon(
            onPressed: onAdd,
            icon: const Icon(Icons.add_rounded),
            label: const Text('Ajouter'),
            style: FilledButton.styleFrom(backgroundColor: AppColors.gasOrange),
          ),
        ],
      ),
    );
  }
}

class _CostCard extends StatelessWidget {
  const _CostCard({required this.bottles});
  final List<GasBottle> bottles;

  @override
  Widget build(BuildContext context) {
    final monthlyCost = GasService.averageMonthlyCost(bottles);
    return GlassCard(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.economy.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppTheme.radiusSm),
            ),
            child: Icon(
              Icons.payments_rounded,
              color: AppColors.economy,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Coût moyen mensuel', style: context.textTheme.labelSmall),
                const SizedBox(height: 4),
                AnimatedValue(
                  value: monthlyCost,
                  suffix: ' FCFA',
                  fractionDigits: 0,
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
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

class _HistoryTile extends StatelessWidget {
  const _HistoryTile({required this.bottle});
  final GasBottle bottle;

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
              color: AppColors.grey200.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.local_fire_department_rounded,
              color: AppColors.grey400,
              size: 18,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bottle.type.label,
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  Formatters.shortDate(bottle.startDate),
                  style: context.textTheme.labelSmall,
                ),
              ],
            ),
          ),
          Text(
            Formatters.currency(bottle.priceFcfa),
            style: context.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
