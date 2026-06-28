import 'package:flutter/material.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/onboarding_page_wrapper.dart';

/// Écran 2 — Votre bouteille de gaz
class GasPage extends StatelessWidget {
  const GasPage({super.key, required this.selected, required this.onChanged});
  final GasBottleType selected;
  final ValueChanged<GasBottleType> onChanged;

  @override
  Widget build(BuildContext context) {
    return OnboardingPageWrapper(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [
            const Spacer(flex: 2),
            // Illustration
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/onboarding/gaz.png',
                height: 160,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 28),
            const Text(
              'Votre bouteille de gaz',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.onbTextPrimary,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Quelle est la taille\nde votre bouteille ?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: AppColors.onbTextSub,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 28),
            // Grid of bottle sizes
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: GasBottleType.values.map((t) {
                final sel = t == selected;
                return GestureDetector(
                  onTap: () => onChanged(t),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: 85,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: sel
                          ? AppColors.onbBlue.withValues(alpha: 0.2)
                          : AppColors.onbGlass,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: sel
                            ? AppColors.onbBlueBright
                            : AppColors.onbGlassBorder,
                        width: sel ? 2 : 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.propane_tank_rounded,
                          size: 26,
                          color: sel
                              ? AppColors.onbBlueBright
                              : AppColors.onbTextSub,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          t.label,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: sel ? FontWeight.w700 : FontWeight.w500,
                            color: sel
                                ? AppColors.onbBlueBright
                                : AppColors.onbTextPrimary,
                          ),
                        ),
                        if (sel) ...[
                          const SizedBox(height: 4),
                          Container(
                            width: 18,
                            height: 18,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.onbBlueBright,
                            ),
                            child: const Icon(
                              Icons.check_rounded,
                              size: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
