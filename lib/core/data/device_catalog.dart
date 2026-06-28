import '../constants/enums.dart';

/// Pre-built catalog of common household devices in African homes
class DeviceCatalogEntry {
  const DeviceCatalogEntry({
    required this.name,
    required this.category,
    required this.powerWatts,
    this.avgUsageHoursPerDay = 0,
    this.standbyWatts = 0,
  });

  final String name;
  final DeviceCategory category;
  final double powerWatts;
  final double avgUsageHoursPerDay;
  final double standbyWatts;
}

class DeviceCatalog {
  DeviceCatalog._();

  static const List<DeviceCatalogEntry> entries = [
    // Éclairage
    DeviceCatalogEntry(
      name: 'Ampoule LED',
      category: DeviceCategory.lighting,
      powerWatts: 9,
      avgUsageHoursPerDay: 6,
    ),
    DeviceCatalogEntry(
      name: 'Ampoule incandescente',
      category: DeviceCategory.lighting,
      powerWatts: 60,
      avgUsageHoursPerDay: 6,
    ),
    DeviceCatalogEntry(
      name: 'Ruban LED',
      category: DeviceCategory.lighting,
      powerWatts: 30,
      avgUsageHoursPerDay: 4,
    ),
    DeviceCatalogEntry(
      name: 'Lampadaire',
      category: DeviceCategory.lighting,
      powerWatts: 40,
      avgUsageHoursPerDay: 5,
    ),
    DeviceCatalogEntry(
      name: 'Plafonnier',
      category: DeviceCategory.lighting,
      powerWatts: 20,
      avgUsageHoursPerDay: 6,
    ),

    // Ventilation
    DeviceCatalogEntry(
      name: 'Ventilateur plafond',
      category: DeviceCategory.ventilation,
      powerWatts: 75,
      avgUsageHoursPerDay: 8,
    ),
    DeviceCatalogEntry(
      name: 'Ventilateur sur pied',
      category: DeviceCategory.ventilation,
      powerWatts: 55,
      avgUsageHoursPerDay: 8,
    ),
    DeviceCatalogEntry(
      name: 'Ventilateur de table',
      category: DeviceCategory.ventilation,
      powerWatts: 40,
      avgUsageHoursPerDay: 6,
    ),

    // Climatisation
    DeviceCatalogEntry(
      name: 'Climatiseur Split 1CV',
      category: DeviceCategory.airConditioning,
      powerWatts: 900,
      avgUsageHoursPerDay: 8,
    ),
    DeviceCatalogEntry(
      name: 'Climatiseur Split 1.5CV',
      category: DeviceCategory.airConditioning,
      powerWatts: 1200,
      avgUsageHoursPerDay: 8,
    ),
    DeviceCatalogEntry(
      name: 'Climatiseur Split 2CV',
      category: DeviceCategory.airConditioning,
      powerWatts: 1800,
      avgUsageHoursPerDay: 8,
    ),
    DeviceCatalogEntry(
      name: 'Climatiseur mobile',
      category: DeviceCategory.airConditioning,
      powerWatts: 1000,
      avgUsageHoursPerDay: 6,
    ),

    // Cuisine
    DeviceCatalogEntry(
      name: 'Réfrigérateur',
      category: DeviceCategory.kitchen,
      powerWatts: 150,
      avgUsageHoursPerDay: 24,
      standbyWatts: 2,
    ),
    DeviceCatalogEntry(
      name: 'Congélateur',
      category: DeviceCategory.kitchen,
      powerWatts: 200,
      avgUsageHoursPerDay: 24,
      standbyWatts: 2,
    ),
    DeviceCatalogEntry(
      name: 'Four électrique',
      category: DeviceCategory.kitchen,
      powerWatts: 2000,
      avgUsageHoursPerDay: 1,
    ),
    DeviceCatalogEntry(
      name: 'Micro-ondes',
      category: DeviceCategory.kitchen,
      powerWatts: 1000,
      avgUsageHoursPerDay: 0.5,
    ),
    DeviceCatalogEntry(
      name: 'Plaque électrique',
      category: DeviceCategory.kitchen,
      powerWatts: 1500,
      avgUsageHoursPerDay: 2,
    ),
    DeviceCatalogEntry(
      name: 'Bouilloire',
      category: DeviceCategory.kitchen,
      powerWatts: 2000,
      avgUsageHoursPerDay: 0.3,
    ),
    DeviceCatalogEntry(
      name: 'Machine à café',
      category: DeviceCategory.kitchen,
      powerWatts: 1200,
      avgUsageHoursPerDay: 0.3,
    ),
    DeviceCatalogEntry(
      name: 'Mixeur / Blender',
      category: DeviceCategory.kitchen,
      powerWatts: 500,
      avgUsageHoursPerDay: 0.2,
    ),
    DeviceCatalogEntry(
      name: 'Grille-pain',
      category: DeviceCategory.kitchen,
      powerWatts: 800,
      avgUsageHoursPerDay: 0.2,
    ),

    // Multimédia
    DeviceCatalogEntry(
      name: 'Télévision LED',
      category: DeviceCategory.multimedia,
      powerWatts: 80,
      avgUsageHoursPerDay: 5,
      standbyWatts: 1,
    ),
    DeviceCatalogEntry(
      name: 'Smart TV',
      category: DeviceCategory.multimedia,
      powerWatts: 120,
      avgUsageHoursPerDay: 5,
      standbyWatts: 2,
    ),
    DeviceCatalogEntry(
      name: 'Décodeur TV',
      category: DeviceCategory.multimedia,
      powerWatts: 25,
      avgUsageHoursPerDay: 5,
      standbyWatts: 15,
    ),
    DeviceCatalogEntry(
      name: 'Enceinte connectée',
      category: DeviceCategory.multimedia,
      powerWatts: 30,
      avgUsageHoursPerDay: 4,
      standbyWatts: 2,
    ),
    DeviceCatalogEntry(
      name: 'Home cinéma',
      category: DeviceCategory.multimedia,
      powerWatts: 200,
      avgUsageHoursPerDay: 3,
    ),

    // Informatique
    DeviceCatalogEntry(
      name: 'PC fixe',
      category: DeviceCategory.computing,
      powerWatts: 300,
      avgUsageHoursPerDay: 6,
      standbyWatts: 5,
    ),
    DeviceCatalogEntry(
      name: 'PC portable',
      category: DeviceCategory.computing,
      powerWatts: 65,
      avgUsageHoursPerDay: 6,
      standbyWatts: 2,
    ),
    DeviceCatalogEntry(
      name: 'Écran moniteur',
      category: DeviceCategory.computing,
      powerWatts: 40,
      avgUsageHoursPerDay: 6,
      standbyWatts: 1,
    ),
    DeviceCatalogEntry(
      name: 'Imprimante',
      category: DeviceCategory.computing,
      powerWatts: 50,
      avgUsageHoursPerDay: 0.5,
      standbyWatts: 5,
    ),

    // Internet
    DeviceCatalogEntry(
      name: 'Box Internet',
      category: DeviceCategory.internet,
      powerWatts: 12,
      avgUsageHoursPerDay: 24,
    ),
    DeviceCatalogEntry(
      name: 'Routeur WiFi',
      category: DeviceCategory.internet,
      powerWatts: 10,
      avgUsageHoursPerDay: 24,
    ),
    DeviceCatalogEntry(
      name: 'Switch réseau',
      category: DeviceCategory.internet,
      powerWatts: 8,
      avgUsageHoursPerDay: 24,
    ),
    DeviceCatalogEntry(
      name: 'NAS',
      category: DeviceCategory.internet,
      powerWatts: 60,
      avgUsageHoursPerDay: 24,
    ),

    // Sécurité
    DeviceCatalogEntry(
      name: 'Caméra IP',
      category: DeviceCategory.security,
      powerWatts: 12,
      avgUsageHoursPerDay: 24,
    ),
    DeviceCatalogEntry(
      name: 'Alarme',
      category: DeviceCategory.security,
      powerWatts: 15,
      avgUsageHoursPerDay: 24,
      standbyWatts: 5,
    ),
    DeviceCatalogEntry(
      name: 'Détecteur de mouvement',
      category: DeviceCategory.security,
      powerWatts: 5,
      avgUsageHoursPerDay: 24,
    ),

    // Électroménager
    DeviceCatalogEntry(
      name: 'Fer à repasser',
      category: DeviceCategory.appliance,
      powerWatts: 1200,
      avgUsageHoursPerDay: 0.5,
    ),
    DeviceCatalogEntry(
      name: 'Lave-linge',
      category: DeviceCategory.appliance,
      powerWatts: 500,
      avgUsageHoursPerDay: 1,
    ),
    DeviceCatalogEntry(
      name: 'Sèche-linge',
      category: DeviceCategory.appliance,
      powerWatts: 2500,
      avgUsageHoursPerDay: 1,
    ),
    DeviceCatalogEntry(
      name: 'Aspirateur',
      category: DeviceCategory.appliance,
      powerWatts: 1400,
      avgUsageHoursPerDay: 0.5,
    ),

    // Pompage
    DeviceCatalogEntry(
      name: 'Pompe à eau',
      category: DeviceCategory.pumping,
      powerWatts: 750,
      avgUsageHoursPerDay: 2,
    ),
    DeviceCatalogEntry(
      name: 'Surpresseur',
      category: DeviceCategory.pumping,
      powerWatts: 1000,
      avgUsageHoursPerDay: 2,
    ),

    // Recharge
    DeviceCatalogEntry(
      name: 'Chargeur téléphone',
      category: DeviceCategory.charging,
      powerWatts: 20,
      avgUsageHoursPerDay: 3,
    ),
    DeviceCatalogEntry(
      name: 'Chargeur tablette',
      category: DeviceCategory.charging,
      powerWatts: 30,
      avgUsageHoursPerDay: 2,
    ),
    DeviceCatalogEntry(
      name: 'Chargeur voiture électrique',
      category: DeviceCategory.charging,
      powerWatts: 7000,
      avgUsageHoursPerDay: 4,
    ),

    // Gaming
    DeviceCatalogEntry(
      name: 'PlayStation',
      category: DeviceCategory.gaming,
      powerWatts: 200,
      avgUsageHoursPerDay: 3,
      standbyWatts: 10,
    ),
    DeviceCatalogEntry(
      name: 'Xbox',
      category: DeviceCategory.gaming,
      powerWatts: 200,
      avgUsageHoursPerDay: 3,
      standbyWatts: 10,
    ),
    DeviceCatalogEntry(
      name: 'Nintendo Switch',
      category: DeviceCategory.gaming,
      powerWatts: 40,
      avgUsageHoursPerDay: 2,
    ),
  ];

  static List<DeviceCatalogEntry> byCategory(DeviceCategory category) {
    return entries.where((e) => e.category == category).toList();
  }

  static List<DeviceCatalogEntry> search(String query) {
    final q = query.toLowerCase();
    return entries.where((e) => e.name.toLowerCase().contains(q)).toList();
  }
}
