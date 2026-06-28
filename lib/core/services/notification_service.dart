import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../constants/enums.dart';

/// Smart notification service for GENIUS HOME™
class NotificationService {
  NotificationService._();

  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static bool _initialized = false;

  static Future<void> initialize() async {
    if (_initialized) return;

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const darwinSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const settings = InitializationSettings(
      android: androidSettings,
      iOS: darwinSettings,
      macOS: darwinSettings,
    );

    await _plugin.initialize(settings);
    _initialized = true;
  }

  static Future<void> show({
    required int id,
    required String title,
    required String body,
    NotificationSeverity severity = NotificationSeverity.info,
  }) async {
    await initialize();
    final details = NotificationDetails(
      android: AndroidNotificationDetails(
        'genius_home_${severity.name}',
        _channelName(severity),
        channelDescription: 'GENIUS HOME™ ${severity.name} notifications',
        importance: _importance(severity),
        priority: _priority(severity),
      ),
      iOS: const DarwinNotificationDetails(),
    );
    await _plugin.show(id, title, body, details);
  }

  static String _channelName(NotificationSeverity severity) {
    return switch (severity) {
      NotificationSeverity.info => 'Informations',
      NotificationSeverity.success => 'Succès',
      NotificationSeverity.warning => 'Alertes',
      NotificationSeverity.critical => 'Alertes critiques',
    };
  }

  static Importance _importance(NotificationSeverity severity) {
    return switch (severity) {
      NotificationSeverity.info => Importance.defaultImportance,
      NotificationSeverity.success => Importance.defaultImportance,
      NotificationSeverity.warning => Importance.high,
      NotificationSeverity.critical => Importance.max,
    };
  }

  static Priority _priority(NotificationSeverity severity) {
    return switch (severity) {
      NotificationSeverity.info => Priority.defaultPriority,
      NotificationSeverity.success => Priority.defaultPriority,
      NotificationSeverity.warning => Priority.high,
      NotificationSeverity.critical => Priority.max,
    };
  }
}

/// Smart alert generator — generates contextual notification messages
class SmartAlerts {
  SmartAlerts._();

  static Future<void> checkElectricity({required double remainingDays}) async {
    if (remainingDays <= 1) {
      await NotificationService.show(
        id: 100,
        title: '⚠️ Alerte Électricité',
        body: 'Votre compteur devrait être vide demain !',
        severity: NotificationSeverity.critical,
      );
    } else if (remainingDays <= 3) {
      await NotificationService.show(
        id: 101,
        title: 'Électricité',
        body:
            'Votre compteur devrait être vide dans ${remainingDays.round()} jours.',
        severity: NotificationSeverity.warning,
      );
    }
  }

  static Future<void> checkGas({
    required int daysRemaining,
    required String bottleType,
  }) async {
    if (daysRemaining <= 2) {
      await NotificationService.show(
        id: 200,
        title: '⚠️ Gaz bientôt vide',
        body: 'Votre bouteille $bottleType devrait être vide très bientôt !',
        severity: NotificationSeverity.critical,
      );
    } else if (daysRemaining <= 7) {
      await NotificationService.show(
        id: 201,
        title: 'Gaz',
        body:
            'Prévoyez un remplacement de votre $bottleType dans $daysRemaining jours.',
        severity: NotificationSeverity.warning,
      );
    }
  }

  static Future<void> consumptionIncrease(double percentIncrease) async {
    if (percentIncrease > 15) {
      await NotificationService.show(
        id: 300,
        title: 'Consommation en hausse',
        body:
            'Votre consommation est supérieure de ${percentIncrease.toStringAsFixed(0)}% par rapport à la normale.',
        severity: NotificationSeverity.warning,
      );
    }
  }

  static Future<void> monthlySavings(double savingsPercent) async {
    if (savingsPercent > 5) {
      await NotificationService.show(
        id: 400,
        title: '🎉 Bravo !',
        body:
            'Vous économisez ${savingsPercent.toStringAsFixed(0)}% ce mois-ci. Continuez !',
        severity: NotificationSeverity.success,
      );
    }
  }
}
