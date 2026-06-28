import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geniushome/core/constants/enums.dart';
import 'package:geniushome/core/database/app_database.dart';
import 'package:geniushome/core/providers/providers.dart';
import 'package:geniushome/core/services/clock.dart';
import 'package:geniushome/core/services/id_generator.dart';
import 'package:geniushome/features/onboarding/application/onboarding_controller.dart';
import 'package:geniushome/features/settings/application/settings_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('onboarding persists one configured house and all rooms', () async {
    SharedPreferences.setMockInitialValues({});
    final preferences = await SharedPreferences.getInstance();
    final database = AppDatabase(NativeDatabase.memory());
    final container = ProviderContainer(
      overrides: [
        databaseProvider.overrideWithValue(database),
        sharedPreferencesProvider.overrideWithValue(preferences),
        clockProvider.overrideWithValue(_FixedClock(DateTime.utc(2026, 6, 28))),
        idGeneratorProvider.overrideWithValue(_SequenceIdGenerator()),
      ],
    );
    addTearDown(() async {
      container.dispose();
      await database.close();
    });

    final completed = await container
        .read(onboardingControllerProvider.notifier)
        .complete(
          const OnboardingCommand(
            userName: 'Awa',
            houseName: 'Maison Awa',
            inhabitants: 5,
            roomCount: 3,
            meterType: MeterType.postpaid,
            gasBottleType: GasBottleType.kg25,
          ),
        );

    expect(completed, isTrue);
    final houses = await container.read(houseRepositoryProvider).getAll();
    expect(houses, hasLength(1));
    expect(houses.single.name, 'Maison Awa');
    expect(houses.single.inhabitants, 5);
    expect(houses.single.meterType, MeterType.postpaid);
    expect(houses.single.preferredGasBottleType, GasBottleType.kg25);

    final rooms = await container
        .read(roomRepositoryProvider)
        .getByHouseId(houses.single.id);
    expect(rooms.map((room) => room.name), ['Pièce 1', 'Pièce 2', 'Pièce 3']);

    final settings = container.read(settingsControllerProvider);
    expect(settings.onboardingCompleted, isTrue);
    expect(settings.currentHouseId, houses.single.id);
    expect(settings.userName, 'Awa');
  });

  test(
    'onboarding rejects incomplete identity without partial writes',
    () async {
      SharedPreferences.setMockInitialValues({});
      final preferences = await SharedPreferences.getInstance();
      final database = AppDatabase(NativeDatabase.memory());
      final container = ProviderContainer(
        overrides: [
          databaseProvider.overrideWithValue(database),
          sharedPreferencesProvider.overrideWithValue(preferences),
        ],
      );
      addTearDown(() async {
        container.dispose();
        await database.close();
      });

      final completed = await container
          .read(onboardingControllerProvider.notifier)
          .complete(
            const OnboardingCommand(
              userName: '',
              houseName: 'Maison',
              inhabitants: 4,
              roomCount: 2,
              meterType: MeterType.prepaid,
              gasBottleType: GasBottleType.kg12,
            ),
          );

      expect(completed, isFalse);
      expect(await container.read(houseRepositoryProvider).getAll(), isEmpty);
    },
  );
}

final class _FixedClock implements Clock {
  const _FixedClock(this.value);
  final DateTime value;

  @override
  DateTime now() => value;
}

final class _SequenceIdGenerator implements IdGenerator {
  var _value = 0;

  @override
  String next() => 'id-${_value++}';
}
