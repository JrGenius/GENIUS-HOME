import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart' as db;
import '../domain/models/electricity_reading.dart';
import '../../../core/constants/enums.dart';

/// Abstract interface for electricity reading data access
abstract class ElectricityRepository {
  Future<List<ElectricityReading>> getByHouseId(String houseId);
  Future<void> insert(ElectricityReading reading);
  Future<void> update(ElectricityReading reading);
  Future<void> delete(String id);
  Stream<List<ElectricityReading>> watchByHouseId(String houseId);
}

/// Drift-based implementation of [ElectricityRepository]
class DriftElectricityRepository implements ElectricityRepository {
  DriftElectricityRepository(this._db);
  final db.AppDatabase _db;

  ElectricityReading _rowToModel(db.ElectricityReading row) =>
      ElectricityReading(
        id: row.id,
        houseId: row.houseId,
        date: row.date,
        valueKwh: row.valueKwh,
        meterType: MeterType.values.firstWhere(
          (e) => e.name == row.meterType,
          orElse: () => MeterType.prepaid,
        ),
        rateFcfaPerKwh: row.rateFcfaPerKwh,
        costFcfa: row.costFcfa,
        note: row.note,
        createdAt: row.createdAt,
      );

  @override
  Future<List<ElectricityReading>> getByHouseId(String houseId) async {
    final rows =
        await (_db.select(_db.electricityReadings)
              ..where((t) => t.houseId.equals(houseId))
              ..orderBy([(t) => OrderingTerm.desc(t.date)]))
            .get();
    return rows.map(_rowToModel).toList();
  }

  @override
  Future<void> insert(ElectricityReading reading) async {
    await _db
        .into(_db.electricityReadings)
        .insert(
          db.ElectricityReadingsCompanion.insert(
            id: reading.id,
            houseId: reading.houseId,
            date: reading.date,
            valueKwh: reading.valueKwh,
            meterType: reading.meterType.name,
            rateFcfaPerKwh: Value(reading.rateFcfaPerKwh),
            costFcfa: Value(reading.costFcfa),
            note: Value(reading.note),
            createdAt: reading.createdAt,
          ),
        );
  }

  @override
  Future<void> update(ElectricityReading reading) async {
    await (_db.update(
      _db.electricityReadings,
    )..where((t) => t.id.equals(reading.id))).write(
      db.ElectricityReadingsCompanion(
        date: Value(reading.date),
        valueKwh: Value(reading.valueKwh),
        meterType: Value(reading.meterType.name),
        rateFcfaPerKwh: Value(reading.rateFcfaPerKwh),
        costFcfa: Value(reading.costFcfa),
        note: Value(reading.note),
      ),
    );
  }

  @override
  Future<void> delete(String id) async {
    await (_db.delete(
      _db.electricityReadings,
    )..where((t) => t.id.equals(id))).go();
  }

  @override
  Stream<List<ElectricityReading>> watchByHouseId(String houseId) {
    return (_db.select(_db.electricityReadings)
          ..where((t) => t.houseId.equals(houseId))
          ..orderBy([(t) => OrderingTerm.desc(t.date)]))
        .watch()
        .map((rows) => rows.map(_rowToModel).toList());
  }
}
