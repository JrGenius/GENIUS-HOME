import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/extensions/context_extensions.dart';

/// Reusable dialog for creating or editing a house
class HouseFormDialog extends StatefulWidget {
  const HouseFormDialog({
    super.key,
    this.initialName,
    this.initialInhabitants,
    this.initialRooms,
    this.initialMeterType,
    this.initialGasBottleType,
    this.initialElectricityRateFcfaPerKwh,
    required this.onSave,
  });

  final String? initialName;
  final int? initialInhabitants;
  final int? initialRooms;
  final MeterType? initialMeterType;
  final GasBottleType? initialGasBottleType;
  final double? initialElectricityRateFcfaPerKwh;
  final Future<void> Function(
    String name,
    int inhabitants,
    int rooms,
    MeterType meterType,
    GasBottleType gasBottleType,
    double electricityRateFcfaPerKwh,
  )
  onSave;

  @override
  State<HouseFormDialog> createState() => _HouseFormDialogState();
}

class _HouseFormDialogState extends State<HouseFormDialog> {
  late final TextEditingController _nameCtrl;
  late final TextEditingController _rateCtrl;
  late int _inhabitants;
  late int _rooms;
  late MeterType _meterType;
  late GasBottleType _gasBottleType;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.initialName ?? '');
    _rateCtrl = TextEditingController(
      text:
          (widget.initialElectricityRateFcfaPerKwh ??
                  AppConstants.defaultElectricityRate)
              .toStringAsFixed(0),
    );
    _inhabitants = widget.initialInhabitants ?? 4;
    _rooms = widget.initialRooms ?? 4;
    _meterType = widget.initialMeterType ?? MeterType.prepaid;
    _gasBottleType = widget.initialGasBottleType ?? GasBottleType.kg12;
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _rateCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.initialName != null;
    return AlertDialog(
      title: Text(isEdit ? 'Modifier la maison' : 'Nouvelle maison'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameCtrl,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Nom de la maison',
                hintText: 'Ex: Maison Abidjan',
              ),
            ),
            const SizedBox(height: 20),
            _CounterRow(
              label: 'Habitants',
              value: _inhabitants,
              onChanged: (v) => setState(() => _inhabitants = v),
            ),
            const SizedBox(height: 12),
            _CounterRow(
              label: 'Pièces',
              value: _rooms,
              onChanged: (v) => setState(() => _rooms = v),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Compteur', style: context.textTheme.titleSmall),
            ),
            const SizedBox(height: 8),
            SegmentedButton<MeterType>(
              segments: MeterType.values
                  .map(
                    (type) =>
                        ButtonSegment(value: type, label: Text(type.label)),
                  )
                  .toList(),
              selected: {_meterType},
              onSelectionChanged: (value) =>
                  setState(() => _meterType = value.first),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _rateCtrl,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Prix du kWh',
                suffixText: 'FCFA/kWh',
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<GasBottleType>(
              initialValue: _gasBottleType,
              decoration: const InputDecoration(
                labelText: 'Bouteille de gaz préférée',
              ),
              items: GasBottleType.values
                  .map(
                    (type) =>
                        DropdownMenuItem(value: type, child: Text(type.label)),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => _gasBottleType = value);
                }
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Annuler'),
        ),
        FilledButton(
          onPressed: _saving
              ? null
              : () async {
                  final name = _nameCtrl.text.trim();
                  if (name.isEmpty) return;
                  final electricityRate = double.tryParse(
                    _rateCtrl.text.trim().replaceAll(',', '.'),
                  );
                  if (electricityRate == null || electricityRate <= 0) return;
                  setState(() => _saving = true);
                  await widget.onSave(
                    name,
                    _inhabitants,
                    _rooms,
                    _meterType,
                    _gasBottleType,
                    electricityRate,
                  );
                  if (context.mounted) Navigator.pop(context);
                },
          child: Text(_saving ? 'Enregistrement…' : 'Enregistrer'),
        ),
      ],
    );
  }
}

class _CounterRow extends StatelessWidget {
  const _CounterRow({
    required this.label,
    required this.value,
    required this.onChanged,
  });
  final String label;
  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(label, style: context.textTheme.bodyLarge)),
        IconButton.outlined(
          onPressed: value > 1 ? () => onChanged(value - 1) : null,
          icon: const Icon(Icons.remove, size: 18),
          iconSize: 18,
        ),
        SizedBox(
          width: 40,
          child: Text(
            '$value',
            textAlign: TextAlign.center,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        IconButton.outlined(
          onPressed: () => onChanged(value + 1),
          icon: const Icon(Icons.add, size: 18),
          iconSize: 18,
        ),
      ],
    );
  }
}
