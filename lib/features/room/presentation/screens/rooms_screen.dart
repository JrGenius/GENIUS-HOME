import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../house/domain/models/house.dart';
import '../../domain/models/room.dart';
import '../../../device/presentation/screens/devices_screen.dart';

/// Room management screen for a given house
class RoomsScreen extends ConsumerWidget {
  const RoomsScreen({super.key, required this.house});
  final House house;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(roomRepositoryProvider);

    return Scaffold(
      appBar: AppBar(title: Text(house.name)),
      body: StreamBuilder<List<Room>>(
        stream: repo.watchByHouseId(house.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final rooms = snapshot.data ?? [];
          if (rooms.isEmpty) {
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
                        Icons.meeting_room_rounded,
                        size: 44,
                        color: AppColors.geniusBlueSoft.withValues(alpha: 0.5),
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingLg),
                    Text(
                      'Aucune pièce',
                      style: context.textTheme.headlineSmall,
                    ),
                    const SizedBox(height: AppTheme.spacingSm),
                    Text(
                      'Ajoutez une pièce pour commencer.',
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
            itemCount: rooms.length,
            separatorBuilder: (_, __) =>
                const SizedBox(height: AppTheme.spacingMd),
            itemBuilder: (context, i) => _RoomCard(
              room: rooms[i],
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => DevicesScreen(room: rooms[i]),
                ),
              ),
              onEdit: () => _showEditDialog(context, ref, rooms[i]),
              onDelete: () => _confirmDelete(context, ref, rooms[i]),
            ),
          );
        },
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
    final nameCtrl = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Nouvelle pièce'),
        content: TextField(
          controller: nameCtrl,
          textCapitalization: TextCapitalization.words,
          decoration: const InputDecoration(
            labelText: 'Nom de la pièce',
            hintText: 'Ex: Salon, Cuisine…',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          FilledButton(
            onPressed: () async {
              final name = nameCtrl.text.trim();
              if (name.isEmpty) return;
              final room = Room(
                id: const Uuid().v4(),
                houseId: house.id,
                name: name,
                createdAt: DateTime.now(),
              );
              await ref.read(roomRepositoryProvider).insert(room);
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text('Ajouter'),
          ),
        ],
      ),
    );
  }

  void _showEditDialog(BuildContext context, WidgetRef ref, Room room) {
    final nameCtrl = TextEditingController(text: room.name);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Modifier la pièce'),
        content: TextField(
          controller: nameCtrl,
          textCapitalization: TextCapitalization.words,
          decoration: const InputDecoration(labelText: 'Nom'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          FilledButton(
            onPressed: () async {
              final name = nameCtrl.text.trim();
              if (name.isEmpty) return;
              await ref
                  .read(roomRepositoryProvider)
                  .update(room.copyWith(name: name));
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text('Enregistrer'),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, Room room) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Supprimer la pièce ?'),
        content: Text('« ${room.name} » sera supprimée.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          FilledButton(
            onPressed: () async {
              await ref.read(roomRepositoryProvider).delete(room.id);
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

class _RoomCard extends StatelessWidget {
  const _RoomCard({
    required this.room,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  });
  final Room room;
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
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.geniusBlueSoft.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppTheme.radiusSm),
            ),
            child: Icon(
              Icons.meeting_room_rounded,
              color: AppColors.geniusBlueSoft,
              size: 22,
            ),
          ),
          const SizedBox(width: AppTheme.spacingMd),
          Expanded(
            child: Text(room.name, style: context.textTheme.titleMedium),
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
