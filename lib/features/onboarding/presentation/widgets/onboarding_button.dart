import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Primary "Suivant →" / "Commencer →" button with glow effect
class OnboardingButton extends StatefulWidget {
  const OnboardingButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.showArrow = true,
  });
  final String label;
  final VoidCallback? onPressed;
  final bool showArrow;

  @override
  State<OnboardingButton> createState() => _OnboardingButtonState();
}

class _OnboardingButtonState extends State<OnboardingButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
    );
    _scale = Tween(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scale,
      builder: (context, child) =>
          Transform.scale(scale: _scale.value, child: child),
      child: GestureDetector(
        onTapDown: widget.onPressed == null ? null : (_) => _ctrl.forward(),
        onTapUp: widget.onPressed == null
            ? null
            : (_) {
                _ctrl.reverse();
                widget.onPressed?.call();
              },
        onTapCancel: () => _ctrl.reverse(),
        child: Opacity(
          opacity: widget.onPressed == null ? 0.55 : 1,
          child: Container(
            height: 52,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.onbBlue, AppColors.onbBlueBright],
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.onbBtnGlow.withValues(alpha: 0.4),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.label,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  if (widget.showArrow) ...[
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward_rounded,
                      size: 18,
                      color: Colors.white,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Secondary "Retour" outlined button
class OnboardingBackButton extends StatelessWidget {
  const OnboardingBackButton({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.onbGlass,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.onbGlassBorder),
        ),
        child: const Center(
          child: Text(
            'Retour',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.onbTextPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
