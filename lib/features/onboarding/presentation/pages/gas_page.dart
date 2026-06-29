import 'package:flutter/material.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/onboarding_illustrated_page.dart';
import '../widgets/onboarding_page_wrapper.dart';

/// Écran 2 — Votre bouteille de gaz
class GasPage extends StatelessWidget {
  const GasPage({super.key, required this.selected, required this.onChanged});
  final GasBottleType selected;
  final ValueChanged<GasBottleType> onChanged;

  @override
  Widget build(BuildContext context) {
    return OnboardingPageWrapper(
      child: OnboardingIllustratedPage(
        assetPath: 'assets/images/onboarding/gaz.png',
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const Spacer(flex: 20),
              const Text(
                'Votre bouteille de gaz',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: AppColors.onbTextPrimary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Quelle est la taille\nde votre bouteille ?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.onbTextSub,
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 28),
              // Grid of bottle sizes
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildCard(context, GasBottleType.kg6),
                      const SizedBox(width: 12),
                      _buildCard(context, GasBottleType.kg12),
                      const SizedBox(width: 12),
                      _buildCard(context, GasBottleType.kg25),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildCard(context, GasBottleType.kg35),
                      const SizedBox(width: 12),
                      _buildCard(context, GasBottleType.kg50),
                    ],
                  ),
                ],
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, GasBottleType t) {
    final sel = t == selected;

    double imgHeight;
    double imgWidth;
    switch (t) {
      case GasBottleType.kg6:
        imgHeight = 36;
        imgWidth = 24;
        break;
      case GasBottleType.kg12:
        imgHeight = 44;
        imgWidth = 28;
        break;
      case GasBottleType.kg25:
        imgHeight = 52;
        imgWidth = 34;
        break;
      case GasBottleType.kg35:
        imgHeight = 56;
        imgWidth = 36;
        break;
      case GasBottleType.kg50:
        imgHeight = 62;
        imgWidth = 40;
        break;
    }

    return GestureDetector(
      onTap: () => onChanged(t),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 96,
        height: 110,
        decoration: BoxDecoration(
          color: sel
              ? AppColors.onbBlue.withValues(alpha: 0.08)
              : AppColors.onbGlass,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: sel ? AppColors.onbBlueBright : AppColors.onbGlassBorder,
            width: sel ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: sel
                  ? AppColors.onbBlueBright.withValues(alpha: 0.1)
                  : const Color(0x0617345C),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            if (sel)
              Positioned(
                top: 8,
                right: 8,
                child: Icon(
                  Icons.check_circle_rounded,
                  size: 18,
                  color: AppColors.onbBlueBright,
                ),
              ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Center(
                        child: Image.asset(
                          'assets/images/icons/gazor.png',
                          height: imgHeight,
                          width: imgWidth,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      t.label,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: sel ? FontWeight.w700 : FontWeight.w600,
                        color: sel
                            ? AppColors.onbBlueBright
                            : AppColors.onbTextPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
