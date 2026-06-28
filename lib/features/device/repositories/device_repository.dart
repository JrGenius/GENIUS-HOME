import 'package:drift/drift.dart';

import '../../../core/constants/enums.dart';
import '../../../core/database/app_database.dart' as db;
import '../domain/models/device.dart';

/// Abstract interface for device data access
abstract class DeviceRepository {
  Future<List<Device>> getByRoomId(String roomId);
  Future<List<Device>> getByHouseId(String houseId);
  Future<Device?> getById(String id);
  Future<void> insert(Device device);
  Future<void> update(Device device);
  Future<void> delete(String id);
  Stream<List<Device>> watchByRoomId(String roomId);
}

/// Drift-based implementation of [DeviceRepository]
class DriftDeviceRepository implements DeviceRepository {
  DriftDeviceRepository(this._db);
  final db.AppDatabase _db;

  Device _rowToModel(db.Device row) => Device(
    id: row.id,
    roomId: row.roomId,
    name: row.name,
    brand: row.brand,
    model: row.model,
    photoPath: row.photoPath,
    category: DeviceCategory.values.firstWhere(
      (e) => e.name == row.category,
      orElse: () => DeviceCategory.other,
    ),
    powerWatts: row.powerWatts,
    avgConsumptionKwh: row.avgConsumptionKwh,
    avgUsageHoursPerDay: row.avgUsageHoursPerDay,
    standbyWatts: row.standbyWatts,
    estimatedMonthlyCostFcfa: row.estimatedMonthlyCostFcfa,
    isActive: row.isActive,
    createdAt: row.createdAt,
  );

  @override
  Future<List<Device>> getByRoomId(String roomId) async {
    final rows = await (_db.select(
      _db.devices,
    )..where((t) => t.roomId.equals(roomId))).get();
    return rows.map(_rowToModel).toList();
  }

  @override
  Future<List<Device>> getByHouseId(String houseId) async {
    final query = _db.select(_db.devices).join([
      innerJoin(_db.rooms, _db.rooms.id.equalsExp(_db.devices.roomId)),
    ])..where(_db.rooms.houseId.equals(houseId));
    final rows = await query.get();
    return rows
        .map((row) => row.readTable(_db.devices))
        .map(_rowToModel)
        .toList();
  }

  @override
  Future<Device?> getById(String id) async {
    final row = await (_db.select(
      _db.devices,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    return row == null ? null : _rowToModel(row);
  }

  @override
  Future<void> insert(Device device) async {
    await _db
        .into(_db.devices)
        .insert(
          db.DevicesCompanion.insert(
            id: device.id,
            roomId: device.roomId,
            name: device.name,
            brand: Value(device.brand),
            model: Value(device.model),
            photoPath: Value(device.photoPath),
            category: device.category.name,
            powerWatts: device.powerWatts,
            avgConsumptionKwh: Value(device.avgConsumptionKwh),
            avgUsageHoursPerDay: Value(device.avgUsageHoursPerDay),
            standbyWatts: Value(device.standbyWatts),
            estimatedMonthlyCostFcfa: Value(device.estimatedMonthlyCostFcfa),
            isActive: Value(device.isActive),
            createdAt: device.createdAt,
          ),
        );
  }

  @override
  Future<void> update(Device device) async {
    await (_db.update(_db.devices)..where((t) => t.id.equals(device.id))).write(
      db.DevicesCompanion(
        name: Value(device.name),
        brand: Value(device.brand),
        model: Value(device.model),
        photoPath: Value(device.photoPath),
        category: Value(device.category.name),
        powerWatts: Value(device.powerWatts),
        avgConsumptionKwh: Value(device.avgConsumptionKwh),
        avgUsageHoursPerDay: Value(device.avgUsageHoursPerDay),
        standbyWatts: Value(device.standbyWatts),
        estimatedMonthlyCostFcfa: Value(device.estimatedMonthlyCostFcfa),
        isActive: Value(device.isActive),
      ),
    );
  }

  @override
  Future<void> delete(String id) async {
    await (_db.delete(_db.devices)..where((t) => t.id.equals(id))).go();
  }

  @override
  Stream<List<Device>> watchByRoomId(String roomId) {
    return (_db.select(_db.devices)..where((t) => t.roomId.equals(roomId)))
        .watch()
        .map((rows) => rows.map(_rowToModel).toList());
  }
}
