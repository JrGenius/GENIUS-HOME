import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../widgets/onboarding_counter.dart';
import '../widgets/onboarding_page_wrapper.dart';

/// Écran 5 — Nombre d'habitants
class InhabitantsPage extends StatelessWidget {
  const InhabitantsPage({
    super.key,
    required this.value,
    required this.onChanged,
  });
  final int value;
  final ValueChanged<int> onChanged;

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
                'assets/images/onboarding/persons.png',
                height: 160,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 28),
            const Text(
              "Nombre d'habitants",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.onbTextPrimary,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Combien de personnes\nvivent chez vous ?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: AppColors.onbTextSub,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 36),
            OnboardingCounter(value: value, onChanged: onChanged),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
