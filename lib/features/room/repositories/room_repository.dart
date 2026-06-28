import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart' as db;
import '../domain/models/room.dart';

/// Abstract interface for room data access
abstract class RoomRepository {
  Future<List<Room>> getByHouseId(String houseId);
  Future<Room?> getById(String id);
  Future<void> insert(Room room);
  Future<void> update(Room room);
  Future<void> delete(String id);
  Stream<List<Room>> watchByHouseId(String houseId);
}

/// Drift-based implementation of [RoomRepository]
class DriftRoomRepository implements RoomRepository {
  DriftRoomRepository(this._db);
  final db.AppDatabase _db;

  Room _rowToModel(db.Room row) => Room(
    id: row.id,
    houseId: row.houseId,
    name: row.name,
    surfaceM2: row.surfaceM2,
    photoPath: row.photoPath,
    description: row.description,
    createdAt: row.createdAt,
  );

  @override
  Future<List<Room>> getByHouseId(String houseId) async {
    final rows = await (_db.select(
      _db.rooms,
    )..where((t) => t.houseId.equals(houseId))).get();
    return rows.map(_rowToModel).toList();
  }

  @override
  Future<Room?> getById(String id) async {
    final row = await (_db.select(
      _db.rooms,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    return row == null ? null : _rowToModel(row);
  }

  @override
  Future<void> insert(Room room) async {
    await _db
        .into(_db.rooms)
        .insert(
          db.RoomsCompanion.insert(
            id: room.id,
            houseId: room.houseId,
            name: room.name,
            surfaceM2: Value(room.surfaceM2),
            photoPath: Value(room.photoPath),
            description: Value(room.description),
            createdAt: room.createdAt,
          ),
        );
  }

  @override
  Future<void> update(Room room) async {
    await (_db.update(_db.rooms)..where((t) => t.id.equals(room.id))).write(
      db.RoomsCompanion(
        name: Value(room.name),
        surfaceM2: Value(room.surfaceM2),
        photoPath: Value(room.photoPath),
        description: Value(room.description),
      ),
    );
  }

  @override
  Future<void> delete(String id) {
    return _db.transaction(() async {
      await (_db.delete(
        _db.devices,
      )..where((device) => device.roomId.equals(id))).go();
      await (_db.delete(_db.rooms)..where((room) => room.id.equals(id))).go();
    });
  }

  @override
  Stream<List<Room>> watchByHouseId(String houseId) {
    return (_db.select(_db.rooms)..where((t) => t.houseId.equals(houseId)))
        .watch()
        .map((rows) => rows.map(_rowToModel).toList());
  }
}
