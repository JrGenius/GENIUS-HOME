/// Device categories available in GENIUS HOME™
enum DeviceCategory {
  lighting('Éclairage'),
  ventilation('Ventilation'),
  kitchen('Cuisine'),
  multimedia('Multimédia'),
  computing('Informatique'),
  internet('Internet'),
  security('Sécurité'),
  airConditioning('Climatisation'),
  pumping('Pompage'),
  appliance('Électroménager'),
  charging('Recharge'),
  gaming('Gaming'),
  other('Autres');

  const DeviceCategory(this.label);
  final String label;
}

/// Gas bottle types common in Africa
enum GasBottleType {
  kg6('6 kg'),
  kg12('12.5 kg'),
  kg25('25 kg'),
  kg35('35 kg'),
  kg50('50 kg');

  const GasBottleType(this.label);
  final String label;

  double get weightKg {
    switch (this) {
      case GasBottleType.kg6:
        return 6.0;
      case GasBottleType.kg12:
        return 12.5;
      case GasBottleType.kg25:
        return 25.0;
      case GasBottleType.kg35:
        return 35.0;
      case GasBottleType.kg50:
        return 50.0;
    }
  }
}

/// Electricity meter types
enum MeterType {
  prepaid('Prépayé'),
  postpaid('Postpayé');

  const MeterType(this.label);
  final String label;
}

/// Notification severity levels
enum NotificationSeverity { info, success, warning, critical }

/// IoT connection protocols (future-ready)
enum IoTProtocol { wifi, bluetooth, zigbee, thread, matter, mqtt }
