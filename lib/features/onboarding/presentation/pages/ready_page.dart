import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../widgets/onboarding_page_wrapper.dart';

/// Écran 8 — Tout est prêt ! 🎉
class ReadyPage extends StatelessWidget {
  const ReadyPage({super.key});

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
                'assets/images/onboarding/ready.png',
                height: 180,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Tout est prêt ! 🎉',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: AppColors.onbTextPrimary,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Votre maison est configurée.\nGenius Home est prêt à\nvous accompagner.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.onbTextSub,
                height: 1.5,
              ),
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
