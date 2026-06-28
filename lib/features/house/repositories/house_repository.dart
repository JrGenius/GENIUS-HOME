import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart' as db;
import '../../../core/constants/enums.dart';
import '../domain/models/house.dart';

/// Abstract interface for house data access
abstract class HouseRepository {
  Future<List<House>> getAll();
  Future<House?> getById(String id);
  Future<void> insert(House house);
  Future<void> update(House house);
  Future<void> delete(String id);
  Stream<List<House>> watchAll();
}

/// Drift-based implementation of [HouseRepository]
class DriftHouseRepository implements HouseRepository {
  DriftHouseRepository(this._db);
  final db.AppDatabase _db;

  House _rowToModel(db.House row) => House(
    id: row.id,
    name: row.name,
    photoPath: row.photoPath,
    roomCount: row.roomCount,
    inhabitants: row.inhabitants,
    meterType: MeterType.values.firstWhere(
      (value) => value.name == row.meterType,
      orElse: () => MeterType.prepaid,
    ),
    preferredGasBottleType: GasBottleType.values.firstWhere(
      (value) => value.name == row.preferredGasBottleType,
      orElse: () => GasBottleType.kg12,
    ),
    address: row.address,
    latitude: row.latitude,
    longitude: row.longitude,
    surfaceM2: row.surfaceM2,
    timezone: row.timezone,
    createdAt: row.createdAt,
    updatedAt: row.updatedAt,
  );

  @override
  Future<List<House>> getAll() async {
    final rows = await _db.select(_db.houses).get();
    return rows.map(_rowToModel).toList();
  }

  @override
  Future<House?> getById(String id) async {
    final row = await (_db.select(
      _db.houses,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    return row == null ? null : _rowToModel(row);
  }

  @override
  Future<void> insert(House house) async {
    await _db
        .into(_db.houses)
        .insert(
          db.HousesCompanion.insert(
            id: house.id,
            name: house.name,
            photoPath: Value(house.photoPath),
            roomCount: Value(house.roomCount),
            inhabitants: Value(house.inhabitants),
            meterType: Value(house.meterType.name),
            preferredGasBottleType: Value(house.preferredGasBottleType.name),
            address: Value(house.address),
            latitude: Value(house.latitude),
            longitude: Value(house.longitude),
            surfaceM2: Value(house.surfaceM2),
            timezone: Value(house.timezone),
            createdAt: house.createdAt,
            updatedAt: Value(house.updatedAt),
          ),
        );
  }

  @override
  Future<void> update(House house) async {
    await (_db.update(_db.houses)..where((t) => t.id.equals(house.id))).write(
      db.HousesCompanion(
        name: Value(house.name),
        photoPath: Value(house.photoPath),
        roomCount: Value(house.roomCount),
        inhabitants: Value(house.inhabitants),
        meterType: Value(house.meterType.name),
        preferredGasBottleType: Value(house.preferredGasBottleType.name),
        address: Value(house.address),
        latitude: Value(house.latitude),
        longitude: Value(house.longitude),
        surfaceM2: Value(house.surfaceM2),
        timezone: Value(house.timezone),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> delete(String id) {
    return _db.transaction(() async {
      final roomRows = await (_db.select(
        _db.rooms,
      )..where((room) => room.houseId.equals(id))).get();
      final roomIds = roomRows.map((room) => room.id).toList();
      if (roomIds.isNotEmpty) {
        await (_db.delete(
          _db.devices,
        )..where((device) => device.roomId.isIn(roomIds))).go();
      }
      await (_db.delete(
        _db.rooms,
      )..where((room) => room.houseId.equals(id))).go();
      await (_db.delete(
        _db.electricityReadings,
      )..where((reading) => reading.houseId.equals(id))).go();
      await (_db.delete(
        _db.gasBottles,
      )..where((bottle) => bottle.houseId.equals(id))).go();
      await (_db.delete(
        _db.houses,
      )..where((house) => house.id.equals(id))).go();
    });
  }

  @override
  Stream<List<House>> watchAll() {
    return _db
        .select(_db.houses)
        .watch()
        .map((rows) => rows.map(_rowToModel).toList());
  }
}
