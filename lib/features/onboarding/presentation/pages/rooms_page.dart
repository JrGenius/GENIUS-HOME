import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../widgets/onboarding_counter.dart';
import '../widgets/onboarding_illustrated_page.dart';
import '../widgets/onboarding_page_wrapper.dart';

/// Écran 4 — Nombre de pièces
class RoomsPage extends StatelessWidget {
  const RoomsPage({super.key, required this.value, required this.onChanged});
  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return OnboardingPageWrapper(
      child: OnboardingIllustratedPage(
        assetPath: 'assets/images/onboarding/salon.png',
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const Spacer(flex: 5),
              const Text(
                'Nombre de pièces',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: AppColors.onbTextPrimary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Combien de pièces\ndans votre maison ?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.onbTextSub,
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 36),
              OnboardingCounter(value: value, onChanged: onChanged),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
