import 'package:flutter/material.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/onboarding_glass_card.dart';
import '../widgets/onboarding_page_wrapper.dart';

/// Écran 3 — Type de compteur
class MeterPage extends StatelessWidget {
  const MeterPage({super.key, required this.selected, required this.onChanged});
  final MeterType selected;
  final ValueChanged<MeterType> onChanged;

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
                'assets/images/onboarding/compteur.png',
                height: 150,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 28),
            const Text(
              'Type de compteur',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.onbTextPrimary,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Quel type de compteur\nutilisez-vous ?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: AppColors.onbTextSub,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 28),
            // Options
            OnboardingGlassCard(
              selected: selected == MeterType.prepaid,
              onTap: () => onChanged(MeterType.prepaid),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.onbBlueBright.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.credit_card_rounded,
                      size: 22,
                      color: AppColors.onbBlueBright,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Prépayé',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.onbTextPrimary,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Vous rechargez votre crédit\nà l'avance.",
                          style: TextStyle(
                            fontSize: 11,
                            color: AppColors.onbTextSub,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (selected == MeterType.prepaid) _CheckCircle(),
                ],
              ),
            ),
            const SizedBox(height: 12),
            OnboardingGlassCard(
              selected: selected == MeterType.postpaid,
              onTap: () => onChanged(MeterType.postpaid),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.onbOrange.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.receipt_long_rounded,
                      size: 22,
                      color: AppColors.onbOrange,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Postpayé',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.onbTextPrimary,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Vous payez après\nconsommation.',
                          style: TextStyle(
                            fontSize: 11,
                            color: AppColors.onbTextSub,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (selected == MeterType.postpaid) _CheckCircle(),
                ],
              ),
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}

class _CheckCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.onbBlueBright,
      ),
      child: const Icon(Icons.check_rounded, size: 14, color: Colors.white),
    );
  }
}
