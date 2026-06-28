// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) => _AppSettings(
  onboardingCompleted: json['onboardingCompleted'] as bool? ?? false,
  themeMode: json['themeMode'] as String? ?? 'system',
  locale: json['locale'] as String? ?? 'fr',
  electricityRateFcfa:
      (json['electricityRateFcfa'] as num?)?.toDouble() ?? 99.0,
  userName: json['userName'] as String?,
  currentHouseId: json['currentHouseId'] as String?,
);

Map<String, dynamic> _$AppSettingsToJson(_AppSettings instance) =>
    <String, dynamic>{
      'onboardingCompleted': instance.onboardingCompleted,
      'themeMode': instance.themeMode,
      'locale': instance.locale,
      'electricityRateFcfa': instance.electricityRateFcfa,
      'userName': instance.userName,
      'currentHouseId': instance.currentHouseId,
    };
