import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../widgets/onboarding_illustrated_page.dart';
import '../widgets/onboarding_page_wrapper.dart';

/// Écran 1 — Bienvenue chez GENIUS HOME™
/// Premium redesign: full-bleed family image, floating home badge,
/// bold large titles, and airier feature chips.
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return OnboardingPageWrapper(
      child: OnboardingIllustratedPage(
        assetPath: 'assets/images/onboarding/family.png',
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              // Generous spacer to clear the top illustration area
              const Spacer(flex: 20),

              // Floating icon badge at center
              Image.asset('assets/images/logo.png', height: 200),
              const SizedBox(height: 20),

              // Bold Title with increased scale
              const Text(
                'GENIUS HOME™',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: AppColors.onbTextPrimary,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),

              // Subtitle with increased scale and line height
              const Text(
                'Votre maison, plus intelligente\nchaque jour.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.onbTextSub,
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(flex: 2),

              // Feature chips with modern spacing & sizing
              const Row(
                children: [
                  _FeatureChip(
                    icon: Icons.bolt_rounded,
                    label: 'Suivez',
                    sublabel: 'l\'électricité',
                    color: AppColors.energyYellow,
                  ),
                  SizedBox(width: 12),
                  _FeatureChip(
                    icon: Icons.local_fire_department_rounded,
                    label: 'Gérez',
                    sublabel: 'le gaz',
                    color: AppColors.gasOrange,
                  ),
                  SizedBox(width: 12),
                  _FeatureChip(
                    icon: Icons.bar_chart_rounded,
                    label: 'Économisez',
                    sublabel: 'au quotidien',
                    color: AppColors.onbBlueBright,
                  ),
                ],
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
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
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.onbGlass,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.onbGlassBorder),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0A122E5C),
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: 24, color: color),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.onbTextPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              sublabel,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
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
