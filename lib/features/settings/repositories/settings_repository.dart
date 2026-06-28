import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/app_constants.dart';
import '../domain/models/app_settings.dart';

/// Abstract interface for app settings
abstract class SettingsRepository {
  AppSettings load();
  Future<void> save(AppSettings settings);
  Future<void> setOnboardingCompleted(bool value);
}

/// SharedPreferences-based implementation of [SettingsRepository]
class PrefsSettingsRepository implements SettingsRepository {
  PrefsSettingsRepository(this._prefs);
  final SharedPreferences _prefs;

  @override
  AppSettings load() {
    return AppSettings(
      onboardingCompleted:
          _prefs.getBool(AppConstants.keyOnboardingCompleted) ?? false,
      themeMode: _prefs.getString(AppConstants.keyThemeMode) ?? 'system',
      locale: _prefs.getString(AppConstants.keyLocale) ?? 'fr',
      userName: _prefs.getString(AppConstants.keyUserName),
      currentHouseId: _prefs.getString(AppConstants.keyHouseId),
      electricityRateFcfa:
          _prefs.getDouble(AppConstants.keyElectricityRate) ??
          AppConstants.defaultElectricityRate,
    );
  }

  @override
  Future<void> save(AppSettings settings) async {
    await _prefs.setBool(
      AppConstants.keyOnboardingCompleted,
      settings.onboardingCompleted,
    );
    await _prefs.setString(AppConstants.keyThemeMode, settings.themeMode);
    await _prefs.setString(AppConstants.keyLocale, settings.locale);
    await _prefs.setDouble(
      AppConstants.keyElectricityRate,
      settings.electricityRateFcfa,
    );
    if (settings.userName != null) {
      await _prefs.setString(AppConstants.keyUserName, settings.userName!);
    } else {
      await _prefs.remove(AppConstants.keyUserName);
    }
    if (settings.currentHouseId != null) {
      await _prefs.setString(AppConstants.keyHouseId, settings.currentHouseId!);
    } else {
      await _prefs.remove(AppConstants.keyHouseId);
    }
  }

  @override
  Future<void> setOnboardingCompleted(bool value) async {
    await _prefs.setBool(AppConstants.keyOnboardingCompleted, value);
  }
}
