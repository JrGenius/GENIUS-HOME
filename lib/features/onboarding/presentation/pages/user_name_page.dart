import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../widgets/onboarding_illustrated_page.dart';
import '../widgets/onboarding_page_wrapper.dart';

/// Écran 7 — Comment vous appelez-vous ?
class UserNamePage extends StatelessWidget {
  const UserNamePage({super.key, required this.onChanged});
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return OnboardingPageWrapper(
      child: OnboardingIllustratedPage(
        assetPath: 'assets/images/onboarding/name.png',
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const Spacer(flex: 5),
              const Text(
                'Comment vous\nappelez-vous ?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: AppColors.onbTextPrimary,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Genius Home vous salue\nchaque jour.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.onbTextSub,
                  height: 1.5,
                  fontWeight: FontWeight.w500,
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
                    color: AppColors.onbGlass,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Votre prénom',
                    hintStyle: TextStyle(
                      color: AppColors.onbTextSub.withValues(alpha: 0.5),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    suffixIcon: Icon(
                      Icons.person_rounded,
                      color: AppColors.onbBlueBright.withValues(alpha: 0.6),
                    ),
                  ),
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
