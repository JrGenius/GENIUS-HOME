import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Shared warm-white canvas for the complete onboarding flow.
class OnboardingScaffold extends StatelessWidget {
  const OnboardingScaffold({super.key, required this.child});
  final Widget child;

  static const gradient = RadialGradient(
    center: Alignment(-0.7, -0.9),
    radius: 1.5,
    colors: [Color(0xFFFFFFFF), Color(0xFFFBFCFF), AppColors.onbBgBottom],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: gradient),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: gradient,
            boxShadow: MediaQuery.sizeOf(context).width > 520
                ? const [
                    BoxShadow(
                      color: Color(0x141B355F),
                      blurRadius: 36,
                      spreadRadius: 4,
                    ),
                  ]
                : null,
          ),
          child: child,
        ),
      ),
    );
  }
}
