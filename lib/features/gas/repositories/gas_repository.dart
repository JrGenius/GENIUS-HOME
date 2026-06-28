import 'package:drift/drift.dart';

import '../../../core/constants/enums.dart';
import '../../../core/database/app_database.dart' as db;
import '../domain/models/gas_bottle.dart';

/// Abstract interface for gas bottle data access
abstract class GasRepository {
  Future<List<GasBottle>> getByHouseId(String houseId);
  Future<GasBottle?> getActive(String houseId);
  Future<void> insert(GasBottle bottle);
  Future<void> replaceActive(GasBottle bottle);
  Future<void> update(GasBottle bottle);
  Future<void> delete(String id);
  Stream<List<GasBottle>> watchByHouseId(String houseId);
}

/// Drift-based implementation of [GasRepository]
class DriftGasRepository implements GasRepository {
  DriftGasRepository(this._db);
  final db.AppDatabase _db;

  GasBottle _rowToModel(db.GasBottle row) => GasBottle(
    id: row.id,
    houseId: row.houseId,
    startDate: row.startDate,
    type: GasBottleType.values.firstWhere(
      (e) => e.name == row.type,
      orElse: () => GasBottleType.kg12,
    ),
    priceFcfa: row.priceFcfa,
    isActive: row.isActive,
    estimatedEndDate: row.estimatedEndDate,
    percentRemaining: row.percentRemaining,
    note: row.note,
    createdAt: row.createdAt,
  );

  @override
  Future<List<GasBottle>> getByHouseId(String houseId) async {
    final rows =
        await (_db.select(_db.gasBottles)
              ..where((t) => t.houseId.equals(houseId))
              ..orderBy([(t) => OrderingTerm.desc(t.startDate)]))
            .get();
    return rows.map(_rowToModel).toList();
  }

  @override
  Future<GasBottle?> getActive(String houseId) async {
    final row =
        await (_db.select(_db.gasBottles)..where(
              (t) => t.houseId.equals(houseId) & t.isActive.equals(true),
            ))
            .getSingleOrNull();
    return row == null ? null : _rowToModel(row);
  }

  @override
  Future<void> insert(GasBottle bottle) async {
    await _db
        .into(_db.gasBottles)
        .insert(
          db.GasBottlesCompanion.insert(
            id: bottle.id,
            houseId: bottle.houseId,
            startDate: bottle.startDate,
            type: bottle.type.name,
            priceFcfa: bottle.priceFcfa,
            isActive: Value(bottle.isActive),
            estimatedEndDate: Value(bottle.estimatedEndDate),
            percentRemaining: Value(bottle.percentRemaining),
            note: Value(bottle.note),
            createdAt: bottle.createdAt,
          ),
        );
  }

  @override
  Future<void> replaceActive(GasBottle bottle) {
    return _db.transaction(() async {
      await (_db.update(_db.gasBottles)..where(
            (table) =>
                table.houseId.equals(bottle.houseId) &
                table.isActive.equals(true),
          ))
          .write(const db.GasBottlesCompanion(isActive: Value(false)));
      await insert(bottle.copyWith(isActive: true));
    });
  }

  @override
  Future<void> update(GasBottle bottle) async {
    await (_db.update(
      _db.gasBottles,
    )..where((t) => t.id.equals(bottle.id))).write(
      db.GasBottlesCompanion(
        startDate: Value(bottle.startDate),
        type: Value(bottle.type.name),
        priceFcfa: Value(bottle.priceFcfa),
        isActive: Value(bottle.isActive),
        estimatedEndDate: Value(bottle.estimatedEndDate),
        percentRemaining: Value(bottle.percentRemaining),
        note: Value(bottle.note),
      ),
    );
  }

  @override
  Future<void> delete(String id) async {
    await (_db.delete(_db.gasBottles)..where((t) => t.id.equals(id))).go();
  }

  @override
  Stream<List<GasBottle>> watchByHouseId(String houseId) {
    return (_db.select(_db.gasBottles)
          ..where((t) => t.houseId.equals(houseId))
          ..orderBy([(t) => OrderingTerm.desc(t.startDate)]))
        .watch()
        .map((rows) => rows.map(_rowToModel).toList());
  }
}
