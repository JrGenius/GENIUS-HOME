import 'package:flutter/material.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/onboarding_glass_card.dart';
import '../widgets/onboarding_illustrated_page.dart';
import '../widgets/onboarding_page_wrapper.dart';

/// Écran 3 — Type de compteur
class MeterPage extends StatefulWidget {
  const MeterPage({
    super.key,
    required this.selected,
    required this.onChanged,
    required this.electricityRateFcfaPerKwh,
    required this.onRateChanged,
  });

  final MeterType selected;
  final ValueChanged<MeterType> onChanged;
  final double electricityRateFcfaPerKwh;
  final ValueChanged<double> onRateChanged;

  @override
  State<MeterPage> createState() => _MeterPageState();
}

class _MeterPageState extends State<MeterPage> {
  late final TextEditingController _rateController;

  @override
  void initState() {
    super.initState();
    _rateController = TextEditingController(
      text: widget.electricityRateFcfaPerKwh.toStringAsFixed(0),
    );
  }

  @override
  void dispose() {
    _rateController.dispose();
    super.dispose();
  }

  void _onRateTextChanged(String value) {
    final rate = double.tryParse(value.replaceAll(',', '.'));
    if (rate != null && rate > 0) {
      widget.onRateChanged(rate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingPageWrapper(
      child: OnboardingIllustratedPage(
        assetPath: 'assets/images/onboarding/compteur.png',
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const Spacer(flex: 20),
              const Text(
                'Type de compteur',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: AppColors.onbTextPrimary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Quel type de compteur\nutilisez-vous ?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.onbTextSub,
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 28),
              // Options
              OnboardingGlassCard(
                selected: widget.selected == MeterType.prepaid,
                onTap: () => widget.onChanged(MeterType.prepaid),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(
                        'assets/images/icons/conpteur.png',
                        width: 62,
                        height: 62,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Prépayé',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.onbTextPrimary,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Vous rechargez votre crédit\nà l'avance.",
                            style: TextStyle(
                              fontSize: 11,
                              color: AppColors.onbTextSub,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (widget.selected == MeterType.prepaid) _CheckCircle(),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              OnboardingGlassCard(
                selected: widget.selected == MeterType.postpaid,
                onTap: () => widget.onChanged(MeterType.postpaid),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(
                        'assets/images/icons/conpteur.png',
                        width: 62,
                        height: 62,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Postpayé',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.onbTextPrimary,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Vous payez après\nconsommation.',
                            style: TextStyle(
                              fontSize: 11,
                              color: AppColors.onbTextSub,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (widget.selected == MeterType.postpaid) _CheckCircle(),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              OnboardingGlassCard(
                selected: false,
                child: TextField(
                  controller: _rateController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  onChanged: _onRateTextChanged,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Prix du kWh de ce compteur',
                    suffixText: 'FCFA/kWh',
                  ),
                  style: const TextStyle(
                    color: AppColors.onbTextPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}

class _CheckCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.onbBlueBright,
      ),
      child: const Icon(Icons.check_rounded, size: 14, color: Colors.white),
    );
  }
}
