import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Shared scaffold for all onboarding pages — dark gradient background
class OnboardingScaffold extends StatelessWidget {
  const OnboardingScaffold({super.key, required this.child});
  final Widget child;

  static const gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.onbBgTop, AppColors.onbBgBottom],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: gradient),
      child: child,
    );
  }
}
