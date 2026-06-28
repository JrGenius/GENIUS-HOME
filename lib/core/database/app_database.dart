import 'package:drift/drift.dart';

part 'app_database.g.dart';

// ──────────────────────────── Tables ────────────────────────────

class Houses extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get photoPath => text().nullable()();
  IntColumn get roomCount => integer().withDefault(const Constant(4))();
  IntColumn get inhabitants => integer().withDefault(const Constant(4))();
  TextColumn get meterType => text().withDefault(const Constant('prepaid'))();
  TextColumn get preferredGasBottleType =>
      text().withDefault(const Constant('kg12'))();
  TextColumn get address => text().nullable()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  RealColumn get surfaceM2 => real().nullable()();
  TextColumn get timezone => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Rooms extends Table {
  TextColumn get id => text()();
  TextColumn get houseId =>
      text().references(Houses, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  RealColumn get surfaceM2 => real().nullable()();
  TextColumn get photoPath => text().nullable()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Devices extends Table {
  TextColumn get id => text()();
  TextColumn get roomId =>
      text().references(Rooms, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get brand => text().nullable()();
  TextColumn get model => text().nullable()();
  TextColumn get photoPath => text().nullable()();
  TextColumn get category => text()();
  RealColumn get powerWatts => real()();
  RealColumn get avgConsumptionKwh => real().withDefault(const Constant(0))();
  RealColumn get avgUsageHoursPerDay => real().withDefault(const Constant(0))();
  RealColumn get standbyWatts => real().withDefault(const Constant(0))();
  RealColumn get estimatedMonthlyCostFcfa =>
      real().withDefault(const Constant(0))();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class ElectricityReadings extends Table {
  TextColumn get id => text()();
  TextColumn get houseId =>
      text().references(Houses, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get date => dateTime()();
  RealColumn get valueKwh => real()();
  TextColumn get meterType => text()();
  RealColumn get costFcfa => real().nullable()();
  TextColumn get note => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class GasBottles extends Table {
  TextColumn get id => text()();
  TextColumn get houseId =>
      text().references(Houses, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get startDate => dateTime()();
  TextColumn get type => text()();
  RealColumn get priceFcfa => real()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get estimatedEndDate => dateTime().nullable()();
  RealColumn get percentRemaining => real().nullable()();
  TextColumn get note => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

// ──────────────────────────── Database ────────────────────────────

@DriftDatabase(
  tables: [Houses, Rooms, Devices, ElectricityReadings, GasBottles],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) async {
      await migrator.createAll();
      await _createIndexes();
    },
    onUpgrade: (migrator, from, to) async {
      if (from < 2) {
        await migrator.addColumn(houses, houses.meterType);
        await migrator.addColumn(houses, houses.preferredGasBottleType);
        await _createIndexes();
      }
    },
    beforeOpen: (_) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );

  Future<void> _createIndexes() async {
    await customStatement(
      'UPDATE gas_bottles SET is_active = 0 '
      'WHERE is_active = 1 AND rowid NOT IN ('
      'SELECT MAX(rowid) FROM gas_bottles '
      'WHERE is_active = 1 GROUP BY house_id'
      ')',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_rooms_house_id '
      'ON rooms (house_id)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_devices_room_id '
      'ON devices (room_id)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_electricity_house_date '
      'ON electricity_readings (house_id, date DESC)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_gas_house_start '
      'ON gas_bottles (house_id, start_date DESC)',
    );
    await customStatement(
      'CREATE UNIQUE INDEX IF NOT EXISTS idx_one_active_gas_per_house '
      'ON gas_bottles (house_id) WHERE is_active = 1',
    );
  }
}
