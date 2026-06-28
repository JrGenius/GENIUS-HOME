import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/data/device_catalog.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../room/domain/models/room.dart';
import '../../domain/models/device.dart';

/// Device management screen for a given room
class DevicesScreen extends ConsumerWidget {
  const DevicesScreen({super.key, required this.room});
  final Room room;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(deviceRepositoryProvider);

    return Scaffold(
      appBar: AppBar(title: Text(room.name)),
      body: StreamBuilder<List<Device>>(
        stream: repo.watchByRoomId(room.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final devices = snapshot.data ?? [];
          if (devices.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(AppTheme.spacingXxl),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.geniusBlueSoft.withValues(alpha: 0.08),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.devices_rounded,
                        size: 44,
                        color: AppColors.geniusBlueSoft.withValues(alpha: 0.5),
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingLg),
                    Text(
                      'Aucun appareil',
                      style: context.textTheme.headlineSmall,
                    ),
                    const SizedBox(height: AppTheme.spacingSm),
                    Text(
                      'Ajoutez un appareil depuis le catalogue.',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.onSurface.withValues(
                          alpha: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return ListView.separated(
            padding: EdgeInsets.fromLTRB(
              AppTheme.spacingLg,
              AppTheme.spacingMd,
              AppTheme.spacingLg,
              120,
            ),
            itemCount: devices.length,
            separatorBuilder: (_, __) =>
                const SizedBox(height: AppTheme.spacingSm),
            itemBuilder: (context, i) => _DeviceCard(
              device: devices[i],
              onDelete: () async {
                await ref.read(deviceRepositoryProvider).delete(devices[i].id);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCatalogPicker(context, ref),
        backgroundColor: AppColors.geniusBlueSoft,
        foregroundColor: Colors.white,
        elevation: 0,
        child: const Icon(Icons.add_rounded),
      ),
    );
  }

  void _showCatalogPicker(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => _CatalogPickerSheet(
        onSelect: (entry) async {
          final device = Device(
            id: const Uuid().v4(),
            roomId: room.id,
            name: entry.name,
            category: entry.category,
            powerWatts: entry.powerWatts,
            avgUsageHoursPerDay: entry.avgUsageHoursPerDay,
            standbyWatts: entry.standbyWatts,
            createdAt: DateTime.now(),
          );
          await ref.read(deviceRepositoryProvider).insert(device);
        },
      ),
    );
  }
}

class _DeviceCard extends StatelessWidget {
  const _DeviceCard({required this.device, required this.onDelete});
  final Device device;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingLg,
        vertical: AppTheme.spacingMd,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.geniusBlueSoft.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.electrical_services_rounded,
              color: AppColors.geniusBlueSoft,
              size: 20,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  device.name,
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${Formatters.watts(device.powerWatts)} · ${device.category.label}',
                  style: context.textTheme.labelSmall,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onDelete,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.critical.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.delete_outline_rounded,
                color: AppColors.critical,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CatalogPickerSheet extends StatefulWidget {
  const _CatalogPickerSheet({required this.onSelect});
  final Future<void> Function(DeviceCatalogEntry) onSelect;

  @override
  State<_CatalogPickerSheet> createState() => _CatalogPickerSheetState();
}

class _CatalogPickerSheetState extends State<_CatalogPickerSheet> {
  String _search = '';

  @override
  Widget build(BuildContext context) {
    final filtered = _search.isEmpty
        ? DeviceCatalog.entries
        : DeviceCatalog.search(_search);

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, controller) => Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              AppTheme.spacingLg,
              AppTheme.spacingMd,
              AppTheme.spacingLg,
              AppTheme.spacingSm,
            ),
            child: TextField(
              onChanged: (v) => setState(() => _search = v),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search_rounded),
                hintText: 'Rechercher un appareil…',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: controller,
              padding: EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
              itemCount: filtered.length,
              itemBuilder: (context, i) {
                final entry = filtered[i];
                return ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColors.geniusBlueSoft.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.electrical_services_rounded,
                      color: AppColors.geniusBlueSoft,
                      size: 20,
                    ),
                  ),
                  title: Text(entry.name, style: context.textTheme.titleSmall),
                  subtitle: Text(
                    '${entry.powerWatts.toStringAsFixed(0)} W · ${entry.category.label}',
                    style: context.textTheme.labelSmall,
                  ),
                  onTap: () async {
                    await widget.onSelect(entry);
                    if (context.mounted) Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
