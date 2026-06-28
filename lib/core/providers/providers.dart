import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/device/repositories/device_repository.dart';
import '../../features/electricity/repositories/electricity_repository.dart';
import '../../features/gas/repositories/gas_repository.dart';
import '../../features/house/repositories/house_repository.dart';
import '../../features/room/repositories/room_repository.dart';
import '../../features/settings/repositories/settings_repository.dart';
import '../database/app_database.dart';

/// Drift database singleton provider
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase(
    driftDatabase(
      name: 'genius_home',
      web: DriftWebOptions(
        sqlite3Wasm: Uri.parse('sqlite3.wasm'),
        driftWorker: Uri.parse('drift_worker.dart.js'),
      ),
    ),
  );
  ref.onDispose(() => db.close());
  return db;
});

/// SharedPreferences provider (must be overridden with actual value at startup)
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('Override sharedPreferencesProvider at startup');
});

/// Whether onboarding has been completed
final onboardingCompletedProvider = Provider<bool>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return prefs.getBool('onboarding_completed') ?? false;
});

/// Current user name
final userNameProvider = Provider<String?>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return prefs.getString('user_name');
});

// ──────────────────────────── Repository Providers ────────────────────────────

final houseRepositoryProvider = Provider<HouseRepository>((ref) {
  return DriftHouseRepository(ref.watch(databaseProvider));
});

final roomRepositoryProvider = Provider<RoomRepository>((ref) {
  return DriftRoomRepository(ref.watch(databaseProvider));
});

final deviceRepositoryProvider = Provider<DeviceRepository>((ref) {
  return DriftDeviceRepository(ref.watch(databaseProvider));
});

final electricityRepositoryProvider = Provider<ElectricityRepository>((ref) {
  return DriftElectricityRepository(ref.watch(databaseProvider));
});

final gasRepositoryProvider = Provider<GasRepository>((ref) {
  return DriftGasRepository(ref.watch(databaseProvider));
});

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return PrefsSettingsRepository(ref.watch(sharedPreferencesProvider));
});
