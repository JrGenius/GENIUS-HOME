import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Circular counter with – / value / + matching the reference design
class OnboardingCounter extends StatelessWidget {
  const OnboardingCounter({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 1,
    this.max = 20,
  });
  final int value;
  final ValueChanged<int> onChanged;
  final int min;
  final int max;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Minus
        GestureDetector(
          onTap: value > min ? () => onChanged(value - 1) : null,
          child: Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.onbGlass,
              border: Border.all(color: AppColors.onbGlassBorder),
            ),
            child: Icon(
              Icons.remove_rounded,
              size: 22,
              color: value > min
                  ? AppColors.onbTextPrimary
                  : AppColors.onbTextSub.withValues(alpha: 0.3),
            ),
          ),
        ),
        // Value
        SizedBox(
          width: 80,
          child: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, anim) =>
                  ScaleTransition(scale: anim, child: child),
              child: Text(
                '$value',
                key: ValueKey(value),
                style: const TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w800,
                  color: AppColors.onbTextPrimary,
                ),
              ),
            ),
          ),
        ),
        // Plus
        GestureDetector(
          onTap: value < max ? () => onChanged(value + 1) : null,
          child: Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [AppColors.onbBlue, AppColors.onbBlueBright],
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.onbBlueBright.withValues(alpha: 0.3),
                  blurRadius: 10,
                ),
              ],
            ),
            child: const Icon(Icons.add_rounded, size: 22, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
