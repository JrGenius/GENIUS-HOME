/// Application-wide constants for GENIUS HOME™
class AppConstants {
  AppConstants._();

  static const String appName = 'GENIUS HOME™';
  static const String appVersion = '1.0.0';
  static const String companyName = 'GENIUS GROUPS SAS';

  // Currency
  static const String defaultCurrency = 'FCFA';
  static const String currencySymbol = 'FCFA';

  // Energy units
  static const String kwhUnit = 'kWh';
  static const String wattsUnit = 'W';

  // Defaults
  static const int defaultRoomCount = 4;
  static const int defaultInhabitants = 4;
  static const double defaultElectricityRate = 99.0; // FCFA/kWh

  // SharedPreferences keys
  static const String keyOnboardingCompleted = 'onboarding_completed';
  static const String keyThemeMode = 'theme_mode';
  static const String keyLocale = 'locale';
  static const String keyHouseId = 'current_house_id';
  static const String keyUserName = 'user_name';
  static const String keyElectricityRate = 'electricity_rate';
}
