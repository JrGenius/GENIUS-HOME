import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../widgets/onboarding_page_wrapper.dart';

/// Écran 1 — Bienvenue chez GENIUS HOME™
/// Layout matches reference: full-bleed family image, floating icon badge,
/// title, subtitle, feature chips — no empty gaps.
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static const double _iconBadgeSize = 52;

  @override
  Widget build(BuildContext context) {
    return OnboardingPageWrapper(
      child: Column(
        children: [
          // ─── Family illustration (fills top, rounded bottom) ────
          Expanded(
            flex: 5,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Image fills the space
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                    child: Image.asset(
                      'assets/images/onboarding/family.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Floating icon badge at bottom center
                Positioned(
                  bottom: -_iconBadgeSize / 2,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      width: _iconBadgeSize,
                      height: _iconBadgeSize,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [AppColors.onbBlue, AppColors.onbBlueBright],
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.onbBlue.withValues(alpha: 0.4),
                            blurRadius: 16,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.home_rounded,
                        size: 26,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ─── Title area (below image + badge) ─────────────────
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(height: _iconBadgeSize / 2 + 12),
                  const Text(
                    'GENIUS HOME™',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppColors.onbTextPrimary,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Votre maison, plus intelligente\nchaque jour.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.onbTextSub,
                      height: 1.5,
                    ),
                  ),
                  const Spacer(),
                  // ─── Feature chips ────────────────────────────────
                  const Row(
                    children: [
                      _FeatureChip(
                        icon: Icons.bolt_rounded,
                        label: 'Suivez',
                        sublabel: 'l\'électricité',
                        color: AppColors.energyYellow,
                      ),
                      SizedBox(width: 10),
                      _FeatureChip(
                        icon: Icons.local_fire_department_rounded,
                        label: 'Gérez',
                        sublabel: 'le gaz',
                        color: AppColors.gasOrange,
                      ),
                      SizedBox(width: 10),
                      _FeatureChip(
                        icon: Icons.bar_chart_rounded,
                        label: 'Économisez',
                        sublabel: 'au quotidien',
                        color: AppColors.onbBlueBright,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureChip extends StatelessWidget {
  const _FeatureChip({
    required this.icon,
    required this.label,
    required this.sublabel,
    required this.color,
  });
  final IconData icon;
  final String label;
  final String sublabel;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 6),
        decoration: BoxDecoration(
          color: AppColors.onbGlass,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.onbGlassBorder),
        ),
        child: Column(
          children: [
            Icon(icon, size: 22, color: color),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.onbTextPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              sublabel,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
                color: AppColors.onbTextSub,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
