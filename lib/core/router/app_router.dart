import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/electricity/presentation/screens/electricity_screen.dart';
import '../../features/gas/presentation/screens/gas_screen.dart';
import '../../features/house/presentation/screens/house_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';
import '../../features/settings/application/settings_controller.dart';
import 'shell_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final onboardingDone = ref.watch(
    settingsControllerProvider.select(
      (settings) => settings.onboardingCompleted,
    ),
  );

  return GoRouter(
    initialLocation: onboardingDone ? '/' : '/onboarding',
    redirect: (context, state) {
      final isOnboarding = state.matchedLocation == '/onboarding';
      if (!onboardingDone && !isOnboarding) return '/onboarding';
      if (onboardingDone && isOnboarding) return '/';
      return null;
    },
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) => ShellScreen(child: child),
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const DashboardScreen(),
          ),
          GoRoute(
            path: '/electricity',
            builder: (context, state) => const ElectricityScreen(),
          ),
          GoRoute(path: '/gas', builder: (context, state) => const GasScreen()),
          GoRoute(
            path: '/house',
            builder: (context, state) => const HouseScreen(),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),
    ],
  );
});
