import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../widgets/onboarding_page_wrapper.dart';

/// Écran 6 — Nom de votre maison
class HouseNamePage extends StatelessWidget {
  const HouseNamePage({super.key, required this.onChanged});
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return OnboardingPageWrapper(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [
            const Spacer(flex: 2),
            // Illustration — house image
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/onboarding/salon.png',
                height: 160,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 28),
            const Text(
              'Nom de votre maison',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.onbTextPrimary,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Donnez un nom\nà votre domicile.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: AppColors.onbTextSub,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 32),
            // Input field
            Container(
              decoration: BoxDecoration(
                color: AppColors.onbGlass,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.onbGlassBorder),
              ),
              child: TextField(
                onChanged: onChanged,
                textCapitalization: TextCapitalization.words,
                style: const TextStyle(
                  color: AppColors.onbTextPrimary,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  hintText: 'Maison Abidjan',
                  hintStyle: TextStyle(
                    color: AppColors.onbTextSub.withValues(alpha: 0.5),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  suffixIcon: Icon(
                    Icons.home_rounded,
                    color: AppColors.onbBlueBright.withValues(alpha: 0.6),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
