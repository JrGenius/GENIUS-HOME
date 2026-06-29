import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Glass card for onboarding selections — frosted semi-transparent
class OnboardingGlassCard extends StatelessWidget {
  const OnboardingGlassCard({
    super.key,
    required this.child,
    this.selected = false,
    this.onTap,
    this.padding,
  });
  final Widget child;
  final bool selected;
  final VoidCallback? onTap;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final borderColor = selected
        ? AppColors.onbBlueBright
        : AppColors.onbGlassBorder;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        padding: padding ?? const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFF3F7FF) : AppColors.onbGlass,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: selected ? 2 : 1),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: AppColors.onbBlueBright.withValues(alpha: 0.12),
                    blurRadius: 18,
                    offset: const Offset(0, 6),
                  ),
                ]
              : const [
                  BoxShadow(
                    color: Color(0x0F17345C),
                    blurRadius: 18,
                    offset: Offset(0, 6),
                  ),
                ],
        ),
        child: child,
      ),
    );
  }
}
