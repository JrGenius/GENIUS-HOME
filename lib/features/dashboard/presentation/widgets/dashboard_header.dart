import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';

/// Greeting header kept independent from dashboard data orchestration.
class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key, required this.userName, required this.now});

  final String userName;
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    final greeting = switch (now.hour) {
      < 12 => 'Bonjour',
      < 18 => 'Bon après-midi',
      _ => 'Bonsoir',
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$greeting $userName 👋', style: context.textTheme.headlineLarge),
        const SizedBox(height: 4),
        Text(
          'Voici ce qui se passe dans votre maison aujourd\'hui.',
          style: context.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
