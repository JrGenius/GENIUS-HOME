import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

/// Dark frosted glass card — the signature element of GENIUS HOME™
/// Semi-transparent dark surface with subtle glowing border
class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius,
    this.blur = 16,
    this.glowBorder = false,
    this.borderColor,
    this.onTap,
  });

  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final double blur;
  final bool glowBorder;
  final Color? borderColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? BorderRadius.circular(AppTheme.radiusMd);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark
        ? AppColors.glassCard.withValues(alpha: 0.85)
        : Colors.white.withValues(alpha: 0.85);

    final border = borderColor ??
        (isDark
            ? (glowBorder ? AppColors.glassBorderGlow : AppColors.glassBorder)
            : (glowBorder ? AppColors.accentBlue.withValues(alpha: 0.5) : const Color(0x1F000000)));

    Widget card = ClipRRect(
      borderRadius: radius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding ?? const EdgeInsets.all(AppTheme.spacingLg),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: radius,
            border: Border.all(color: border, width: 1),
          ),
          child: child,
        ),
      ),
    );

    if (onTap != null) {
      card = GestureDetector(onTap: onTap, child: card);
    }

    if (margin != null) {
      card = Padding(padding: margin!, child: card);
    }

    return card;
  }
}

/// Animated glass card with subtle scale on tap
class AnimatedGlassCard extends StatefulWidget {
  const AnimatedGlassCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
  });

  final Widget child;
  final EdgeInsets? padding;
  final VoidCallback? onTap;

  @override
  State<AnimatedGlassCard> createState() => _AnimatedGlassCardState();
}

class _AnimatedGlassCardState extends State<AnimatedGlassCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: AppTheme.fast);
    _scale = Tween<double>(
      begin: 1.0,
      end: 0.97,
    ).animate(CurvedAnimation(parent: _ctrl, curve: AppTheme.springCurve));
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
      child: GlassCard(
        padding: widget.padding,
        onTap: () {
          _ctrl.forward().then((_) => _ctrl.reverse());
          widget.onTap?.call();
        },
        child: widget.child,
      ),
    );
  }
}

/// Bento grid helper — organizes cards in responsive columns
class BentoGrid extends StatelessWidget {
  const BentoGrid({
    super.key,
    required this.children,
    this.crossAxisCount = 2,
    this.spacing = AppTheme.spacingMd,
    this.childAspectRatio = 1.0,
  });

  final List<Widget> children;
  final int crossAxisCount;
  final double spacing;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: spacing,
      crossAxisSpacing: spacing,
      childAspectRatio: childAspectRatio,
      children: children,
    );
  }
}

/// Animated counter that counts up smoothly
class AnimatedValue extends StatelessWidget {
  const AnimatedValue({
    super.key,
    required this.value,
    this.style,
    this.duration = AppTheme.medium,
    this.suffix = '',
    this.prefix = '',
    this.fractionDigits = 0,
  });

  final double value;
  final TextStyle? style;
  final Duration duration;
  final String suffix;
  final String prefix;
  final int fractionDigits;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(end: value),
      duration: duration,
      curve: AppTheme.springCurve,
      builder: (context, v, _) {
        return Text(
          '$prefix${v.toStringAsFixed(fractionDigits)}$suffix',
          style: style,
        );
      },
    );
  }
}

/// Section heading with consistent spacing
class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, this.action});

  final String title;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: AppTheme.spacingSm,
        top: AppTheme.spacingMd,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
          const Spacer(),
          if (action != null) action!,
        ],
      ),
    );
  }
}
