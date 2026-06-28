# GENIUS HOME™ Architecture

## Direction

The application follows a feature-first structure with four conceptual layers:

- `domain`: immutable business models and repository contracts;
- `application`: Riverpod controllers and use-case orchestration;
- `data`: Drift and preferences-backed repository implementations;
- `presentation`: screens and reusable widgets.

Some repository contracts and implementations still share a file while the
codebase transitions toward the target structure. New features must keep their
storage implementation out of presentation code.

## State ownership

`SettingsController` is the reactive source of truth for profile preferences
and the selected house. Screens must consume `currentHouseIdProvider` rather
than reading SharedPreferences directly.

`OnboardingController` owns the first-run use case. It validates input, creates
the configured house and its rooms in a Drift transaction, then persists the
profile and selected house.

## Local database

Drift is the authoritative store for household data. Schema version 2 adds:

- meter and preferred gas bottle configuration on houses;
- indexes for foreign-key and time-series queries;
- a unique partial index allowing one active gas bottle per house;
- foreign-key enforcement and cascade rules for new databases.

Repositories explicitly cascade destructive operations as well, preserving
integrity for databases created with schema version 1.

Every future schema change must increment `schemaVersion`, provide an upgrade
path, and include a migration or integrity test.

## Replaceable infrastructure

Time and identifier generation are injected through `Clock` and `IdGenerator`.
IoT and prediction implementations remain behind provider interfaces so local
manual entry can later coexist with MQTT, Matter, Zigbee, BLE or on-device ML.

## Testing baseline

The required baseline for every feature is:

- unit tests for calculations;
- repository tests against an in-memory Drift database;
- controller tests for application workflows;
- migration tests whenever the schema changes.
