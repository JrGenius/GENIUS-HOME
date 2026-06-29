import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Full-width illustration blended into the warm onboarding canvas.
///
/// The image is deliberately not rendered as a card: it becomes part of the
/// page background and fades to white before interactive content starts.
class OnboardingIllustratedPage extends StatelessWidget {
  const OnboardingIllustratedPage({
    super.key,
    required this.assetPath,
    required this.child,
    this.imageAlignment = Alignment.topCenter,
    this.imageHeightFactor = 0.52,
  });

  final String assetPath;
  final Widget child;
  final Alignment imageAlignment;
  final double imageHeightFactor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final imageHeight = constraints.maxHeight * imageHeightFactor;

        return Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: double.infinity,
                height: imageHeight,
                child: ShaderMask(
                  blendMode: BlendMode.dstIn,
                  shaderCallback: (bounds) => const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.white,
                      Color(0xB8FFFFFF),
                      Color(0x00FFFFFF),
                    ],
                    stops: [0, 0.5, 0.68, 0.9],
                  ).createShader(bounds),
                  child: Image.asset(
                    assetPath,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    alignment: imageAlignment,
                  ),
                ),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    AppColors.onbBgTop.withValues(alpha: 0.98),
                    AppColors.onbBgBottom,
                  ],
                  stops: const [0, 0.25, 0.46, 1],
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 36,     // safe distance from floating progress bar
                  bottom: 80,  // safe distance from floating bottom buttons
                ),
                child: child,
              ),
            ),
          ],
        );
      },
    );
  }
}
