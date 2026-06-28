import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../application/settings_controller.dart';

/// Settings screen — theme, profile, about
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsControllerProvider);
    final userName = settings.userName ?? '';
    final themeMode = settings.themeMode;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            AppTheme.spacingLg,
            AppTheme.spacingXl,
            AppTheme.spacingLg,
            120,
          ),
          children: [
            Text('Réglages', style: context.textTheme.headlineLarge),
            const SizedBox(height: AppTheme.spacingXl),

            // Profile
            GlassCard(
              child: Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          AppColors.geniusBlueSoft.withValues(alpha: 0.2),
                          AppColors.geniusBlueGlow.withValues(alpha: 0.1),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        userName.isNotEmpty ? userName[0].toUpperCase() : '?',
                        style: context.textTheme.headlineSmall?.copyWith(
                          color: AppColors.geniusBlueSoft,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppTheme.spacingMd),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName.isNotEmpty ? userName : 'Utilisateur',
                          style: context.textTheme.titleMedium,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          AppConstants.appName,
                          style: context.textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _editUserName(context, ref, userName),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: context.colorScheme.onSurface.withValues(
                          alpha: 0.05,
                        ),
                        borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                      ),
                      child: Icon(
                        Icons.edit_rounded,
                        size: 18,
                        color: context.colorScheme.onSurface.withValues(
                          alpha: 0.4,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppTheme.spacingLg),

            // Appearance
            SectionHeader(title: 'Apparence'),
            GlassCard(
              padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingSm),
              child: Column(
                children: [
                  _ThemeTile(
                    title: 'Système',
                    icon: Icons.brightness_auto_rounded,
                    selected: themeMode == 'system',
                    onTap: () => _setTheme(ref, 'system'),
                  ),
                  _ThemeTile(
                    title: 'Clair',
                    icon: Icons.light_mode_rounded,
                    selected: themeMode == 'light',
                    onTap: () => _setTheme(ref, 'light'),
                  ),
                  _ThemeTile(
                    title: 'Sombre',
                    icon: Icons.dark_mode_rounded,
                    selected: themeMode == 'dark',
                    onTap: () => _setTheme(ref, 'dark'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppTheme.spacingLg),

            // Electricity rate
            SectionHeader(title: 'Électricité'),
            GlassCard(
              onTap: () => _editRate(context, ref),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.energyYellow.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.bolt_rounded,
                      color: AppColors.energyYellow,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tarif kWh', style: context.textTheme.titleSmall),
                        const SizedBox(height: 2),
                        Text(
                          '${settings.electricityRateFcfa} FCFA/kWh',
                          style: context.textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                    color: context.colorScheme.onSurface.withValues(alpha: 0.3),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppTheme.spacingLg),

            // About
            SectionHeader(title: 'À propos'),
            GlassCard(
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        size: 18,
                        color: context.colorScheme.onSurface.withValues(
                          alpha: 0.4,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Text('Version', style: context.textTheme.titleSmall),
                      const Spacer(),
                      FutureBuilder<PackageInfo>(
                        future: PackageInfo.fromPlatform(),
                        builder: (_, snap) => Text(
                          snap.data?.version ?? AppConstants.appVersion,
                          style: context.textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppTheme.spacingSm,
                    ),
                    child: Divider(
                      color: context.colorScheme.onSurface.withValues(
                        alpha: 0.06,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.business_rounded,
                        size: 18,
                        color: context.colorScheme.onSurface.withValues(
                          alpha: 0.4,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Text(
                        'Développé par',
                        style: context.textTheme.titleSmall,
                      ),
                      const Spacer(),
                      Text(
                        AppConstants.companyName,
                        style: context.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _setTheme(WidgetRef ref, String mode) {
    ref.read(settingsControllerProvider.notifier).setThemeMode(mode);
  }

  void _editUserName(BuildContext context, WidgetRef ref, String current) {
    final ctrl = TextEditingController(text: current);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Votre nom'),
        content: TextField(
          controller: ctrl,
          textCapitalization: TextCapitalization.words,
          decoration: const InputDecoration(hintText: 'Prénom'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          FilledButton(
            onPressed: () async {
              final name = ctrl.text.trim();
              if (name.isNotEmpty) {
                await ref
                    .read(settingsControllerProvider.notifier)
                    .setUserName(name);
              }
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text('Enregistrer'),
          ),
        ],
      ),
    );
  }

  void _editRate(BuildContext context, WidgetRef ref) {
    final current = ref.read(settingsControllerProvider).electricityRateFcfa;
    final ctrl = TextEditingController(text: current.toString());

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Tarif électricité'),
        content: TextField(
          controller: ctrl,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: 'Prix par kWh',
            suffixText: 'FCFA',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          FilledButton(
            onPressed: () async {
              final rate = double.tryParse(ctrl.text);
              if (rate != null && rate > 0) {
                await ref
                    .read(settingsControllerProvider.notifier)
                    .setElectricityRate(rate);
              }
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text('Enregistrer'),
          ),
        ],
      ),
    );
  }
}

class _ThemeTile extends StatelessWidget {
  const _ThemeTile({
    required this.title,
    required this.icon,
    required this.selected,
    required this.onTap,
  });
  final String title;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.spacingLg,
          vertical: 12,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: selected
                  ? AppColors.geniusBlueSoft
                  : context.colorScheme.onSurface.withValues(alpha: 0.4),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
            if (selected)
              Icon(
                Icons.check_circle_rounded,
                color: AppColors.geniusBlueSoft,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
