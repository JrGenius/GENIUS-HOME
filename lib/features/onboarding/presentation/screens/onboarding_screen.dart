import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/enums.dart';
import '../../application/onboarding_controller.dart';
import '../pages/gas_page.dart';
import '../pages/house_name_page.dart';
import '../pages/inhabitants_page.dart';
import '../pages/meter_page.dart';
import '../pages/ready_page.dart';
import '../pages/rooms_page.dart';
import '../pages/user_name_page.dart';
import '../pages/welcome_page.dart';
import '../widgets/onboarding_button.dart';
import '../widgets/onboarding_progress.dart';
import '../widgets/onboarding_scaffold.dart';

/// Multi-step onboarding — dark glass premium, Ivorian-friendly
/// 8 screens: Welcome → Gas → Meter → Rooms → Inhabitants → House name → Name → Ready
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});
  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _ctrl = PageController();
  int _page = 0;
  static const _total = 8;

  String _userName = '';
  String _houseName = '';
  int _inhabitants = 4;
  int _roomCount = 4;
  MeterType _meterType = MeterType.prepaid;
  GasBottleType _gasType = GasBottleType.kg12;
  double _electricityRateFcfaPerKwh = AppConstants.defaultElectricityRate;

  void _next() {
    if (_page < _total - 1) {
      _ctrl.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _finish();
    }
  }

  void _back() {
    if (_page > 0) {
      _ctrl.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _finish() async {
    final completed = await ref
        .read(onboardingControllerProvider.notifier)
        .complete(
          OnboardingCommand(
            userName: _userName,
            houseName: _houseName,
            inhabitants: _inhabitants,
            roomCount: _roomCount,
            meterType: _meterType,
            gasBottleType: _gasType,
            electricityRateFcfaPerKwh: _electricityRateFcfaPerKwh,
          ),
        );
    if (!mounted) return;
    if (completed) {
      context.go('/');
      return;
    }
    final error = ref.read(onboardingControllerProvider).error;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(error?.toString() ?? 'Configuration impossible.')),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLast = _page == _total - 1;
    final isSaving = ref.watch(onboardingControllerProvider).isLoading;

    return OnboardingScaffold(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            // ─── Full-bleed Page view (draws behind top/bottom bars) ───
            Positioned.fill(
              child: PageView(
                controller: _ctrl,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (i) => setState(() => _page = i),
                children: [
                  const WelcomePage(),
                  GasPage(
                    selected: _gasType,
                    onChanged: (v) => setState(() => _gasType = v),
                  ),
                  MeterPage(
                    selected: _meterType,
                    onChanged: (v) => setState(() => _meterType = v),
                    electricityRateFcfaPerKwh: _electricityRateFcfaPerKwh,
                    onRateChanged: (v) =>
                        setState(() => _electricityRateFcfaPerKwh = v),
                  ),
                  RoomsPage(
                    value: _roomCount,
                    onChanged: (v) => setState(() => _roomCount = v),
                  ),
                  InhabitantsPage(
                    value: _inhabitants,
                    onChanged: (v) => setState(() => _inhabitants = v),
                  ),
                  HouseNamePage(onChanged: (v) => _houseName = v),
                  UserNamePage(onChanged: (v) => _userName = v),
                  const ReadyPage(),
                ],
              ),
            ),

            // ─── Floating Progress Bar (Top) ────────────────────────
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                bottom: false,
                child: OnboardingProgress(current: _page, total: _total),
              ),
            ),

            // ─── Floating Navigation Buttons (Bottom) ───────────────
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                  child: isLast
                      ? OnboardingButton(
                          label: 'Découvrir mon espace',
                          onPressed: isSaving ? null : _finish,
                        )
                      : _page == 0
                      ? OnboardingButton(label: 'Commencer', onPressed: _next)
                      : Row(
                          children: [
                            Expanded(
                              child: OnboardingBackButton(onPressed: _back),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: OnboardingButton(
                                label: 'Suivant',
                                onPressed: _next,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
