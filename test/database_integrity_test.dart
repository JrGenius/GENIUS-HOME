import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geniushome/core/constants/enums.dart';
import 'package:geniushome/core/database/app_database.dart'
    hide GasBottle, House;
import 'package:geniushome/features/gas/domain/models/gas_bottle.dart';
import 'package:geniushome/features/gas/repositories/gas_repository.dart';
import 'package:geniushome/features/house/domain/models/house.dart';
import 'package:geniushome/features/house/repositories/house_repository.dart';

void main() {
  late AppDatabase database;
  late HouseRepository houses;
  late GasRepository gas;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
    houses = DriftHouseRepository(database);
    gas = DriftGasRepository(database);
  });

  tearDown(() => database.close());

  test(
    'replacing active gas bottle is atomic and keeps one active bottle',
    () async {
      final createdAt = DateTime.utc(2026, 1, 1);
      await houses.insert(
        House(id: 'house', name: 'Maison', createdAt: createdAt),
      );

      await gas.replaceActive(
        GasBottle(
          id: 'first',
          houseId: 'house',
          startDate: createdAt,
          type: GasBottleType.kg12,
          priceFcfa: 7000,
          createdAt: createdAt,
        ),
      );
      await gas.replaceActive(
        GasBottle(
          id: 'second',
          houseId: 'house',
          startDate: createdAt.add(const Duration(days: 20)),
          type: GasBottleType.kg12,
          priceFcfa: 7500,
          createdAt: createdAt.add(const Duration(days: 20)),
        ),
      );

      final bottles = await gas.getByHouseId('house');
      expect(bottles.where((bottle) => bottle.isActive), hasLength(1));
      expect(bottles.firstWhere((bottle) => bottle.isActive).id, 'second');
    },
  );

  test('deleting a house cascades to its gas bottles', () async {
    final createdAt = DateTime.utc(2026, 1, 1);
    await houses.insert(
      House(id: 'house', name: 'Maison', createdAt: createdAt),
    );
    await gas.insert(
      GasBottle(
        id: 'gas',
        houseId: 'house',
        startDate: createdAt,
        type: GasBottleType.kg6,
        priceFcfa: 3000,
        createdAt: createdAt,
      ),
    );

    await houses.delete('house');

    expect(await gas.getByHouseId('house'), isEmpty);
  });
}
