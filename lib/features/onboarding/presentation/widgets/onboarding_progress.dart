import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Glowing progress bar for onboarding — visible at top
class OnboardingProgress extends StatelessWidget {
  const OnboardingProgress({
    super.key,
    required this.current,
    required this.total,
  });
  final int current;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        children: List.generate(total, (i) {
          final active = i <= current;
          return Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeOut,
              height: 4,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: active ? AppColors.onbBlueBright : AppColors.onbGlass,
                boxShadow: active
                    ? [
                        BoxShadow(
                          color: AppColors.onbBlueBright.withValues(alpha: 0.4),
                          blurRadius: 6,
                        ),
                      ]
                    : null,
              ),
            ),
          );
        }),
      ),
    );
  }
}
