import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../widgets/onboarding_illustrated_page.dart';
import '../widgets/onboarding_page_wrapper.dart';

/// Écran 8 — Tout est prêt ! 🎉
class ReadyPage extends StatelessWidget {
  const ReadyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingPageWrapper(
      child: OnboardingIllustratedPage(
        assetPath: 'assets/images/onboarding/ready.png',
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const Spacer(flex: 5),
              const Text(
                'Tout est prêt ! 🎉',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: AppColors.onbTextPrimary,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Votre maison est configurée.\nGenius Home est prêt à\nvous accompagner.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.onbTextSub,
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
