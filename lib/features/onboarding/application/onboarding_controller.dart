import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/enums.dart';
import '../../../core/providers/providers.dart';
import '../../../core/services/clock.dart';
import '../../../core/services/id_generator.dart';
import '../../house/domain/models/house.dart';
import '../../room/domain/models/room.dart';
import '../../settings/application/settings_controller.dart';

final clockProvider = Provider<Clock>((ref) => const SystemClock());
final idGeneratorProvider = Provider<IdGenerator>(
  (ref) => const UuidIdGenerator(),
);

final onboardingControllerProvider =
    StateNotifierProvider<OnboardingController, AsyncValue<void>>((ref) {
      return OnboardingController(
        ref: ref,
        clock: ref.watch(clockProvider),
        idGenerator: ref.watch(idGeneratorProvider),
      );
    });

class OnboardingCommand {
  const OnboardingCommand({
    required this.userName,
    required this.houseName,
    required this.inhabitants,
    required this.roomCount,
    required this.meterType,
    required this.gasBottleType,
    this.electricityRateFcfaPerKwh = AppConstants.defaultElectricityRate,
  });

  final String userName;
  final String houseName;
  final int inhabitants;
  final int roomCount;
  final MeterType meterType;
  final GasBottleType gasBottleType;
  final double electricityRateFcfaPerKwh;
}

/// Coordinates the complete first-run transaction outside the UI.
class OnboardingController extends StateNotifier<AsyncValue<void>> {
  OnboardingController({
    required Ref ref,
    required Clock clock,
    required IdGenerator idGenerator,
  }) : _ref = ref,
       _clock = clock,
       _idGenerator = idGenerator,
       super(const AsyncData(null));

  final Ref _ref;
  final Clock _clock;
  final IdGenerator _idGenerator;

  Future<bool> complete(OnboardingCommand command) async {
    if (state.isLoading) return false;
    state = const AsyncLoading();

    try {
      final houseName = command.houseName.trim();
      final userName = command.userName.trim();
      if (houseName.isEmpty || userName.isEmpty) {
        throw const FormatException(
          'Le nom de la maison et votre prénom sont obligatoires.',
        );
      }
      if (command.electricityRateFcfaPerKwh <= 0) {
        throw const FormatException(
          'Le prix du kWh doit être supérieur à zéro.',
        );
      }

      final houseId = _idGenerator.next();
      final createdAt = _clock.now();
      final database = _ref.read(databaseProvider);
      final houseRepository = _ref.read(houseRepositoryProvider);
      final roomRepository = _ref.read(roomRepositoryProvider);

      await database.transaction(() async {
        await houseRepository.insert(
          House(
            id: houseId,
            name: houseName,
            inhabitants: command.inhabitants,
            roomCount: command.roomCount,
            meterType: command.meterType,
            preferredGasBottleType: command.gasBottleType,
            electricityRateFcfaPerKwh: command.electricityRateFcfaPerKwh,
            createdAt: createdAt,
          ),
        );

        for (var index = 0; index < command.roomCount; index++) {
          await roomRepository.insert(
            Room(
              id: _idGenerator.next(),
              houseId: houseId,
              name: 'Pièce ${index + 1}',
              createdAt: createdAt,
            ),
          );
        }
      });

      await _ref
          .read(settingsControllerProvider.notifier)
          .update(
            (settings) => settings.copyWith(
              onboardingCompleted: true,
              userName: userName,
              currentHouseId: houseId,
            ),
          );
      _ref.invalidate(onboardingCompletedProvider);
      _ref.invalidate(userNameProvider);
      state = const AsyncData(null);
      return true;
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
      return false;
    }
  }
}
