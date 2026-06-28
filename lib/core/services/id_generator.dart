import 'package:uuid/uuid.dart';

/// Injectable identifier factory for deterministic tests and future sync.
abstract interface class IdGenerator {
  String next();
}

final class UuidIdGenerator implements IdGenerator {
  const UuidIdGenerator();

  @override
  String next() => const Uuid().v4();
}
