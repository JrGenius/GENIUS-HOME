import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

@freezed
abstract class AppSettings with _$AppSettings {
  const factory AppSettings({
    @Default(false) bool onboardingCompleted,
    @Default('system') String themeMode,
    @Default('fr') String locale,
    @Default(99.0) double electricityRateFcfa,
    String? userName,
    String? currentHouseId,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);
}
