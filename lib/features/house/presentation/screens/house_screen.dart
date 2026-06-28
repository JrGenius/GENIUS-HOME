import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../domain/models/house.dart';
import '../widgets/house_form_dialog.dart';
import '../../../room/presentation/screens/rooms_screen.dart';
import '../../../settings/application/settings_controller.dart';

/// House management screen — list of houses with CRUD
class HouseScreen extends ConsumerWidget {
  const HouseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(houseRepositoryProvider);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                AppTheme.spacingLg,
                AppTheme.spacingXl,
                AppTheme.spacingLg,
                0,
              ),
              child: Text('Maison', style: context.textTheme.headlineLarge),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppTheme.spacingLg),
              child: Text(
                'Gérez votre domicile et ses pièces',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
            ),
            const SizedBox(height: AppTheme.spacingLg),
            Expanded(
              child: StreamBuilder<List<House>>(
                stream: repo.watchAll(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final houses = snapshot.data ?? [];
                  if (houses.isEmpty) {
                    return _EmptyState(
                      onAdd: () => _showAddDialog(context, ref),
                    );
                  }
                  return ListView.separated(
                    padding: EdgeInsets.fromLTRB(
                      AppTheme.spacingLg,
                      0,
                      AppTheme.spacingLg,
                      120,
                    ),
                    itemCount: houses.length,
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: AppTheme.spacingMd),
                    itemBuilder: (context, i) => _HouseCard(
                      house: houses[i],
                      onTap: () async {
                        await ref
                            .read(settingsControllerProvider.notifier)
                            .selectHouse(houses[i].id);
                        if (context.mounted) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => RoomsScreen(house: houses[i]),
                            ),
                          );
                        }
                      },
                      onEdit: () => _showEditDialog(context, ref, houses[i]),
                      onDelete: () => _confirmDelete(context, ref, houses[i]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(context, ref),
        backgroundColor: AppColors.geniusBlueSoft,
        foregroundColor: Colors.white,
        elevation: 0,
        child: const Icon(Icons.add_rounded),
      ),
    );
  }

  void _showAddDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (_) => HouseFormDialog(
        onSave: (name, inhabitants, rooms) async {
          final house = House(
            id: const Uuid().v4(),
            name: name,
            inhabitants: inhabitants,
            roomCount: rooms,
            createdAt: DateTime.now(),
          );
          await ref.read(houseRepositoryProvider).insert(house);
          await ref
              .read(settingsControllerProvider.notifier)
              .selectHouse(house.id);
        },
      ),
    );
  }

  void _showEditDialog(BuildContext context, WidgetRef ref, House house) {
    showDialog(
      context: context,
      builder: (_) => HouseFormDialog(
        initialName: house.name,
        initialInhabitants: house.inhabitants,
        initialRooms: house.roomCount,
        onSave: (name, inhabitants, rooms) async {
          final updated = house.copyWith(
            name: name,
            inhabitants: inhabitants,
            roomCount: rooms,
            updatedAt: DateTime.now(),
          );
          await ref.read(houseRepositoryProvider).update(updated);
        },
      ),
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, House house) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Supprimer la maison ?'),
        content: Text('« ${house.name} » sera supprimée définitivement.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          FilledButton(
            onPressed: () async {
              await ref.read(houseRepositoryProvider).delete(house.id);
              if (ref.read(currentHouseIdProvider) == house.id) {
                await ref
                    .read(settingsControllerProvider.notifier)
                    .selectHouse(null);
              }
              if (context.mounted) Navigator.pop(context);
            },
            style: FilledButton.styleFrom(
              backgroundColor: context.colorScheme.error,
            ),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.onAdd});
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
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
                Icons.home_work_rounded,
                size: 44,
                color: AppColors.geniusBlueSoft.withValues(alpha: 0.5),
              ),
            ),
            const SizedBox(height: AppTheme.spacingLg),
            Text('Aucune maison', style: context.textTheme.headlineSmall),
            const SizedBox(height: AppTheme.spacingSm),
            Text(
              'Ajoutez votre première maison pour commencer.',
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
            const SizedBox(height: AppTheme.spacingXl),
            FilledButton.icon(
              onPressed: onAdd,
              icon: const Icon(Icons.add_rounded),
              label: const Text('Ajouter'),
            ),
          ],
        ),
      ),
    );
  }
}

class _HouseCard extends StatelessWidget {
  const _HouseCard({
    required this.house,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  });
  final House house;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return AnimatedGlassCard(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.geniusBlueSoft.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppTheme.radiusSm),
            ),
            child: Icon(
              Icons.home_work_rounded,
              color: AppColors.geniusBlueSoft,
              size: 24,
            ),
          ),
          const SizedBox(width: AppTheme.spacingMd),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(house.name, style: context.textTheme.titleMedium),
                const SizedBox(height: 2),
                Text(
                  '${house.roomCount} pièces · ${house.inhabitants} habitants',
                  style: context.textTheme.labelSmall,
                ),
              ],
            ),
          ),
          PopupMenuButton<String>(
            icon: Icon(
              Icons.more_horiz_rounded,
              size: 20,
              color: context.colorScheme.onSurface.withValues(alpha: 0.3),
            ),
            onSelected: (v) {
              if (v == 'edit') onEdit();
              if (v == 'delete') onDelete();
            },
            itemBuilder: (_) => [
              const PopupMenuItem(value: 'edit', child: Text('Modifier')),
              const PopupMenuItem(value: 'delete', child: Text('Supprimer')),
            ],
          ),
        ],
      ),
    );
  }
}
