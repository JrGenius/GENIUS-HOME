import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/providers.dart';
import '../../house/domain/models/house.dart';
import '../domain/models/app_settings.dart';
import '../repositories/settings_repository.dart';

final settingsControllerProvider =
    StateNotifierProvider<SettingsController, AppSettings>((ref) {
      return SettingsController(ref.watch(settingsRepositoryProvider));
    });

final currentHouseIdProvider = Provider<String?>(
  (ref) => ref.watch(
    settingsControllerProvider.select((settings) => settings.currentHouseId),
  ),
);

final currentUserNameProvider = Provider<String?>(
  (ref) => ref.watch(
    settingsControllerProvider.select((settings) => settings.userName),
  ),
);

final currentHouseProvider = StreamProvider<House?>((ref) {
  final houseId = ref.watch(currentHouseIdProvider);
  if (houseId == null) return Stream.value(null);
  return ref
      .watch(houseRepositoryProvider)
      .watchAll()
      .map(
        (houses) => houses.where((house) => house.id == houseId).firstOrNull,
      );
});

/// Reactive application state for preferences-backed settings.
class SettingsController extends StateNotifier<AppSettings> {
  SettingsController(this._repository) : super(_repository.load());

  final SettingsRepository _repository;

  Future<void> update(AppSettings Function(AppSettings current) change) async {
    final updated = change(state);
    await _repository.save(updated);
    state = updated;
  }

  Future<void> selectHouse(String? houseId) {
    return update((settings) => settings.copyWith(currentHouseId: houseId));
  }

  Future<void> setUserName(String? name) {
    return update((settings) => settings.copyWith(userName: name));
  }

  Future<void> setThemeMode(String mode) {
    return update((settings) => settings.copyWith(themeMode: mode));
  }

  Future<void> setElectricityRate(double rate) {
    return update((settings) => settings.copyWith(electricityRateFcfa: rate));
  }
}
