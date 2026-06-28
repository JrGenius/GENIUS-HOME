// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $HousesTable extends Houses with TableInfo<$HousesTable, House> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HousesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _photoPathMeta = const VerificationMeta(
    'photoPath',
  );
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
    'photo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _roomCountMeta = const VerificationMeta(
    'roomCount',
  );
  @override
  late final GeneratedColumn<int> roomCount = GeneratedColumn<int>(
    'room_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(4),
  );
  static const VerificationMeta _inhabitantsMeta = const VerificationMeta(
    'inhabitants',
  );
  @override
  late final GeneratedColumn<int> inhabitants = GeneratedColumn<int>(
    'inhabitants',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(4),
  );
  static const VerificationMeta _meterTypeMeta = const VerificationMeta(
    'meterType',
  );
  @override
  late final GeneratedColumn<String> meterType = GeneratedColumn<String>(
    'meter_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('prepaid'),
  );
  static const VerificationMeta _preferredGasBottleTypeMeta =
      const VerificationMeta('preferredGasBottleType');
  @override
  late final GeneratedColumn<String> preferredGasBottleType =
      GeneratedColumn<String>(
        'preferred_gas_bottle_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('kg12'),
      );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _surfaceM2Meta = const VerificationMeta(
    'surfaceM2',
  );
  @override
  late final GeneratedColumn<double> surfaceM2 = GeneratedColumn<double>(
    'surface_m2',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _timezoneMeta = const VerificationMeta(
    'timezone',
  );
  @override
  late final GeneratedColumn<String> timezone = GeneratedColumn<String>(
    'timezone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    photoPath,
    roomCount,
    inhabitants,
    meterType,
    preferredGasBottleType,
    address,
    latitude,
    longitude,
    surfaceM2,
    timezone,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'houses';
  @override
  VerificationContext validateIntegrity(
    Insertable<House> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('photo_path')) {
      context.handle(
        _photoPathMeta,
        photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta),
      );
    }
    if (data.containsKey('room_count')) {
      context.handle(
        _roomCountMeta,
        roomCount.isAcceptableOrUnknown(data['room_count']!, _roomCountMeta),
      );
    }
    if (data.containsKey('inhabitants')) {
      context.handle(
        _inhabitantsMeta,
        inhabitants.isAcceptableOrUnknown(
          data['inhabitants']!,
          _inhabitantsMeta,
        ),
      );
    }
    if (data.containsKey('meter_type')) {
      context.handle(
        _meterTypeMeta,
        meterType.isAcceptableOrUnknown(data['meter_type']!, _meterTypeMeta),
      );
    }
    if (data.containsKey('preferred_gas_bottle_type')) {
      context.handle(
        _preferredGasBottleTypeMeta,
        preferredGasBottleType.isAcceptableOrUnknown(
          data['preferred_gas_bottle_type']!,
          _preferredGasBottleTypeMeta,
        ),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    }
    if (data.containsKey('surface_m2')) {
      context.handle(
        _surfaceM2Meta,
        surfaceM2.isAcceptableOrUnknown(data['surface_m2']!, _surfaceM2Meta),
      );
    }
    if (data.containsKey('timezone')) {
      context.handle(
        _timezoneMeta,
        timezone.isAcceptableOrUnknown(data['timezone']!, _timezoneMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  House map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return House(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      photoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_path'],
      ),
      roomCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}room_count'],
      )!,
      inhabitants: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}inhabitants'],
      )!,
      meterType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meter_type'],
      )!,
      preferredGasBottleType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}preferred_gas_bottle_type'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      ),
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      ),
      surfaceM2: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}surface_m2'],
      ),
      timezone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}timezone'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $HousesTable createAlias(String alias) {
    return $HousesTable(attachedDatabase, alias);
  }
}

class House extends DataClass implements Insertable<House> {
  final String id;
  final String name;
  final String? photoPath;
  final int roomCount;
  final int inhabitants;
  final String meterType;
  final String preferredGasBottleType;
  final String? address;
  final double? latitude;
  final double? longitude;
  final double? surfaceM2;
  final String? timezone;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const House({
    required this.id,
    required this.name,
    this.photoPath,
    required this.roomCount,
    required this.inhabitants,
    required this.meterType,
    required this.preferredGasBottleType,
    this.address,
    this.latitude,
    this.longitude,
    this.surfaceM2,
    this.timezone,
    required this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || photoPath != null) {
      map['photo_path'] = Variable<String>(photoPath);
    }
    map['room_count'] = Variable<int>(roomCount);
    map['inhabitants'] = Variable<int>(inhabitants);
    map['meter_type'] = Variable<String>(meterType);
    map['preferred_gas_bottle_type'] = Variable<String>(preferredGasBottleType);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    if (!nullToAbsent || surfaceM2 != null) {
      map['surface_m2'] = Variable<double>(surfaceM2);
    }
    if (!nullToAbsent || timezone != null) {
      map['timezone'] = Variable<String>(timezone);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  HousesCompanion toCompanion(bool nullToAbsent) {
    return HousesCompanion(
      id: Value(id),
      name: Value(name),
      photoPath: photoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(photoPath),
      roomCount: Value(roomCount),
      inhabitants: Value(inhabitants),
      meterType: Value(meterType),
      preferredGasBottleType: Value(preferredGasBottleType),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      surfaceM2: surfaceM2 == null && nullToAbsent
          ? const Value.absent()
          : Value(surfaceM2),
      timezone: timezone == null && nullToAbsent
          ? const Value.absent()
          : Value(timezone),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory House.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return House(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      photoPath: serializer.fromJson<String?>(json['photoPath']),
      roomCount: serializer.fromJson<int>(json['roomCount']),
      inhabitants: serializer.fromJson<int>(json['inhabitants']),
      meterType: serializer.fromJson<String>(json['meterType']),
      preferredGasBottleType: serializer.fromJson<String>(
        json['preferredGasBottleType'],
      ),
      address: serializer.fromJson<String?>(json['address']),
      latitude: serializer.fromJson<double?>(json['latitude']),
      longitude: serializer.fromJson<double?>(json['longitude']),
      surfaceM2: serializer.fromJson<double?>(json['surfaceM2']),
      timezone: serializer.fromJson<String?>(json['timezone']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'photoPath': serializer.toJson<String?>(photoPath),
      'roomCount': serializer.toJson<int>(roomCount),
      'inhabitants': serializer.toJson<int>(inhabitants),
      'meterType': serializer.toJson<String>(meterType),
      'preferredGasBottleType': serializer.toJson<String>(
        preferredGasBottleType,
      ),
      'address': serializer.toJson<String?>(address),
      'latitude': serializer.toJson<double?>(latitude),
      'longitude': serializer.toJson<double?>(longitude),
      'surfaceM2': serializer.toJson<double?>(surfaceM2),
      'timezone': serializer.toJson<String?>(timezone),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  House copyWith({
    String? id,
    String? name,
    Value<String?> photoPath = const Value.absent(),
    int? roomCount,
    int? inhabitants,
    String? meterType,
    String? preferredGasBottleType,
    Value<String?> address = const Value.absent(),
    Value<double?> latitude = const Value.absent(),
    Value<double?> longitude = const Value.absent(),
    Value<double?> surfaceM2 = const Value.absent(),
    Value<String?> timezone = const Value.absent(),
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => House(
    id: id ?? this.id,
    name: name ?? this.name,
    photoPath: photoPath.present ? photoPath.value : this.photoPath,
    roomCount: roomCount ?? this.roomCount,
    inhabitants: inhabitants ?? this.inhabitants,
    meterType: meterType ?? this.meterType,
    preferredGasBottleType:
        preferredGasBottleType ?? this.preferredGasBottleType,
    address: address.present ? address.value : this.address,
    latitude: latitude.present ? latitude.value : this.latitude,
    longitude: longitude.present ? longitude.value : this.longitude,
    surfaceM2: surfaceM2.present ? surfaceM2.value : this.surfaceM2,
    timezone: timezone.present ? timezone.value : this.timezone,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  House copyWithCompanion(HousesCompanion data) {
    return House(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
      roomCount: data.roomCount.present ? data.roomCount.value : this.roomCount,
      inhabitants: data.inhabitants.present
          ? data.inhabitants.value
          : this.inhabitants,
      meterType: data.meterType.present ? data.meterType.value : this.meterType,
      preferredGasBottleType: data.preferredGasBottleType.present
          ? data.preferredGasBottleType.value
          : this.preferredGasBottleType,
      address: data.address.present ? data.address.value : this.address,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      surfaceM2: data.surfaceM2.present ? data.surfaceM2.value : this.surfaceM2,
      timezone: data.timezone.present ? data.timezone.value : this.timezone,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('House(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('photoPath: $photoPath, ')
          ..write('roomCount: $roomCount, ')
          ..write('inhabitants: $inhabitants, ')
          ..write('meterType: $meterType, ')
          ..write('preferredGasBottleType: $preferredGasBottleType, ')
          ..write('address: $address, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('surfaceM2: $surfaceM2, ')
          ..write('timezone: $timezone, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    photoPath,
    roomCount,
    inhabitants,
    meterType,
    preferredGasBottleType,
    address,
    latitude,
    longitude,
    surfaceM2,
    timezone,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is House &&
          other.id == this.id &&
          other.name == this.name &&
          other.photoPath == this.photoPath &&
          other.roomCount == this.roomCount &&
          other.inhabitants == this.inhabitants &&
          other.meterType == this.meterType &&
          other.preferredGasBottleType == this.preferredGasBottleType &&
          other.address == this.address &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.surfaceM2 == this.surfaceM2 &&
          other.timezone == this.timezone &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class HousesCompanion extends UpdateCompanion<House> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> photoPath;
  final Value<int> roomCount;
  final Value<int> inhabitants;
  final Value<String> meterType;
  final Value<String> preferredGasBottleType;
  final Value<String?> address;
  final Value<double?> latitude;
  final Value<double?> longitude;
  final Value<double?> surfaceM2;
  final Value<String?> timezone;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const HousesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.roomCount = const Value.absent(),
    this.inhabitants = const Value.absent(),
    this.meterType = const Value.absent(),
    this.preferredGasBottleType = const Value.absent(),
    this.address = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.surfaceM2 = const Value.absent(),
    this.timezone = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HousesCompanion.insert({
    required String id,
    required String name,
    this.photoPath = const Value.absent(),
    this.roomCount = const Value.absent(),
    this.inhabitants = const Value.absent(),
    this.meterType = const Value.absent(),
    this.preferredGasBottleType = const Value.absent(),
    this.address = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.surfaceM2 = const Value.absent(),
    this.timezone = const Value.absent(),
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<House> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? photoPath,
    Expression<int>? roomCount,
    Expression<int>? inhabitants,
    Expression<String>? meterType,
    Expression<String>? preferredGasBottleType,
    Expression<String>? address,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<double>? surfaceM2,
    Expression<String>? timezone,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (photoPath != null) 'photo_path': photoPath,
      if (roomCount != null) 'room_count': roomCount,
      if (inhabitants != null) 'inhabitants': inhabitants,
      if (meterType != null) 'meter_type': meterType,
      if (preferredGasBottleType != null)
        'preferred_gas_bottle_type': preferredGasBottleType,
      if (address != null) 'address': address,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (surfaceM2 != null) 'surface_m2': surfaceM2,
      if (timezone != null) 'timezone': timezone,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HousesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? photoPath,
    Value<int>? roomCount,
    Value<int>? inhabitants,
    Value<String>? meterType,
    Value<String>? preferredGasBottleType,
    Value<String?>? address,
    Value<double?>? latitude,
    Value<double?>? longitude,
    Value<double?>? surfaceM2,
    Value<String?>? timezone,
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? rowid,
  }) {
    return HousesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      photoPath: photoPath ?? this.photoPath,
      roomCount: roomCount ?? this.roomCount,
      inhabitants: inhabitants ?? this.inhabitants,
      meterType: meterType ?? this.meterType,
      preferredGasBottleType:
          preferredGasBottleType ?? this.preferredGasBottleType,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      surfaceM2: surfaceM2 ?? this.surfaceM2,
      timezone: timezone ?? this.timezone,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    if (roomCount.present) {
      map['room_count'] = Variable<int>(roomCount.value);
    }
    if (inhabitants.present) {
      map['inhabitants'] = Variable<int>(inhabitants.value);
    }
    if (meterType.present) {
      map['meter_type'] = Variable<String>(meterType.value);
    }
    if (preferredGasBottleType.present) {
      map['preferred_gas_bottle_type'] = Variable<String>(
        preferredGasBottleType.value,
      );
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (surfaceM2.present) {
      map['surface_m2'] = Variable<double>(surfaceM2.value);
    }
    if (timezone.present) {
      map['timezone'] = Variable<String>(timezone.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HousesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('photoPath: $photoPath, ')
          ..write('roomCount: $roomCount, ')
          ..write('inhabitants: $inhabitants, ')
          ..write('meterType: $meterType, ')
          ..write('preferredGasBottleType: $preferredGasBottleType, ')
          ..write('address: $address, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('surfaceM2: $surfaceM2, ')
          ..write('timezone: $timezone, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoomsTable extends Rooms with TableInfo<$RoomsTable, Room> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _houseIdMeta = const VerificationMeta(
    'houseId',
  );
  @override
  late final GeneratedColumn<String> houseId = GeneratedColumn<String>(
    'house_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES houses (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _surfaceM2Meta = const VerificationMeta(
    'surfaceM2',
  );
  @override
  late final GeneratedColumn<double> surfaceM2 = GeneratedColumn<double>(
    'surface_m2',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _photoPathMeta = const VerificationMeta(
    'photoPath',
  );
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
    'photo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    houseId,
    name,
    surfaceM2,
    photoPath,
    description,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rooms';
  @override
  VerificationContext validateIntegrity(
    Insertable<Room> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('house_id')) {
      context.handle(
        _houseIdMeta,
        houseId.isAcceptableOrUnknown(data['house_id']!, _houseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_houseIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('surface_m2')) {
      context.handle(
        _surfaceM2Meta,
        surfaceM2.isAcceptableOrUnknown(data['surface_m2']!, _surfaceM2Meta),
      );
    }
    if (data.containsKey('photo_path')) {
      context.handle(
        _photoPathMeta,
        photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Room map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Room(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      houseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}house_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      surfaceM2: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}surface_m2'],
      ),
      photoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_path'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $RoomsTable createAlias(String alias) {
    return $RoomsTable(attachedDatabase, alias);
  }
}

class Room extends DataClass implements Insertable<Room> {
  final String id;
  final String houseId;
  final String name;
  final double? surfaceM2;
  final String? photoPath;
  final String? description;
  final DateTime createdAt;
  const Room({
    required this.id,
    required this.houseId,
    required this.name,
    this.surfaceM2,
    this.photoPath,
    this.description,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['house_id'] = Variable<String>(houseId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || surfaceM2 != null) {
      map['surface_m2'] = Variable<double>(surfaceM2);
    }
    if (!nullToAbsent || photoPath != null) {
      map['photo_path'] = Variable<String>(photoPath);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  RoomsCompanion toCompanion(bool nullToAbsent) {
    return RoomsCompanion(
      id: Value(id),
      houseId: Value(houseId),
      name: Value(name),
      surfaceM2: surfaceM2 == null && nullToAbsent
          ? const Value.absent()
          : Value(surfaceM2),
      photoPath: photoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(photoPath),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      createdAt: Value(createdAt),
    );
  }

  factory Room.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Room(
      id: serializer.fromJson<String>(json['id']),
      houseId: serializer.fromJson<String>(json['houseId']),
      name: serializer.fromJson<String>(json['name']),
      surfaceM2: serializer.fromJson<double?>(json['surfaceM2']),
      photoPath: serializer.fromJson<String?>(json['photoPath']),
      description: serializer.fromJson<String?>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'houseId': serializer.toJson<String>(houseId),
      'name': serializer.toJson<String>(name),
      'surfaceM2': serializer.toJson<double?>(surfaceM2),
      'photoPath': serializer.toJson<String?>(photoPath),
      'description': serializer.toJson<String?>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Room copyWith({
    String? id,
    String? houseId,
    String? name,
    Value<double?> surfaceM2 = const Value.absent(),
    Value<String?> photoPath = const Value.absent(),
    Value<String?> description = const Value.absent(),
    DateTime? createdAt,
  }) => Room(
    id: id ?? this.id,
    houseId: houseId ?? this.houseId,
    name: name ?? this.name,
    surfaceM2: surfaceM2.present ? surfaceM2.value : this.surfaceM2,
    photoPath: photoPath.present ? photoPath.value : this.photoPath,
    description: description.present ? description.value : this.description,
    createdAt: createdAt ?? this.createdAt,
  );
  Room copyWithCompanion(RoomsCompanion data) {
    return Room(
      id: data.id.present ? data.id.value : this.id,
      houseId: data.houseId.present ? data.houseId.value : this.houseId,
      name: data.name.present ? data.name.value : this.name,
      surfaceM2: data.surfaceM2.present ? data.surfaceM2.value : this.surfaceM2,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
      description: data.description.present
          ? data.description.value
          : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Room(')
          ..write('id: $id, ')
          ..write('houseId: $houseId, ')
          ..write('name: $name, ')
          ..write('surfaceM2: $surfaceM2, ')
          ..write('photoPath: $photoPath, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    houseId,
    name,
    surfaceM2,
    photoPath,
    description,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Room &&
          other.id == this.id &&
          other.houseId == this.houseId &&
          other.name == this.name &&
          other.surfaceM2 == this.surfaceM2 &&
          other.photoPath == this.photoPath &&
          other.description == this.description &&
          other.createdAt == this.createdAt);
}

class RoomsCompanion extends UpdateCompanion<Room> {
  final Value<String> id;
  final Value<String> houseId;
  final Value<String> name;
  final Value<double?> surfaceM2;
  final Value<String?> photoPath;
  final Value<String?> description;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const RoomsCompanion({
    this.id = const Value.absent(),
    this.houseId = const Value.absent(),
    this.name = const Value.absent(),
    this.surfaceM2 = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoomsCompanion.insert({
    required String id,
    required String houseId,
    required String name,
    this.surfaceM2 = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.description = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       houseId = Value(houseId),
       name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<Room> custom({
    Expression<String>? id,
    Expression<String>? houseId,
    Expression<String>? name,
    Expression<double>? surfaceM2,
    Expression<String>? photoPath,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (houseId != null) 'house_id': houseId,
      if (name != null) 'name': name,
      if (surfaceM2 != null) 'surface_m2': surfaceM2,
      if (photoPath != null) 'photo_path': photoPath,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoomsCompanion copyWith({
    Value<String>? id,
    Value<String>? houseId,
    Value<String>? name,
    Value<double?>? surfaceM2,
    Value<String?>? photoPath,
    Value<String?>? description,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return RoomsCompanion(
      id: id ?? this.id,
      houseId: houseId ?? this.houseId,
      name: name ?? this.name,
      surfaceM2: surfaceM2 ?? this.surfaceM2,
      photoPath: photoPath ?? this.photoPath,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (houseId.present) {
      map['house_id'] = Variable<String>(houseId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (surfaceM2.present) {
      map['surface_m2'] = Variable<double>(surfaceM2.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomsCompanion(')
          ..write('id: $id, ')
          ..write('houseId: $houseId, ')
          ..write('name: $name, ')
          ..write('surfaceM2: $surfaceM2, ')
          ..write('photoPath: $photoPath, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DevicesTable extends Devices with TableInfo<$DevicesTable, Device> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DevicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roomIdMeta = const VerificationMeta('roomId');
  @override
  late final GeneratedColumn<String> roomId = GeneratedColumn<String>(
    'room_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES rooms (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
    'brand',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _modelMeta = const VerificationMeta('model');
  @override
  late final GeneratedColumn<String> model = GeneratedColumn<String>(
    'model',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _photoPathMeta = const VerificationMeta(
    'photoPath',
  );
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
    'photo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _powerWattsMeta = const VerificationMeta(
    'powerWatts',
  );
  @override
  late final GeneratedColumn<double> powerWatts = GeneratedColumn<double>(
    'power_watts',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _avgConsumptionKwhMeta = const VerificationMeta(
    'avgConsumptionKwh',
  );
  @override
  late final GeneratedColumn<double> avgConsumptionKwh =
      GeneratedColumn<double>(
        'avg_consumption_kwh',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      );
  static const VerificationMeta _avgUsageHoursPerDayMeta =
      const VerificationMeta('avgUsageHoursPerDay');
  @override
  late final GeneratedColumn<double> avgUsageHoursPerDay =
      GeneratedColumn<double>(
        'avg_usage_hours_per_day',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      );
  static const VerificationMeta _standbyWattsMeta = const VerificationMeta(
    'standbyWatts',
  );
  @override
  late final GeneratedColumn<double> standbyWatts = GeneratedColumn<double>(
    'standby_watts',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _estimatedMonthlyCostFcfaMeta =
      const VerificationMeta('estimatedMonthlyCostFcfa');
  @override
  late final GeneratedColumn<double> estimatedMonthlyCostFcfa =
      GeneratedColumn<double>(
        'estimated_monthly_cost_fcfa',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    roomId,
    name,
    brand,
    model,
    photoPath,
    category,
    powerWatts,
    avgConsumptionKwh,
    avgUsageHoursPerDay,
    standbyWatts,
    estimatedMonthlyCostFcfa,
    isActive,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'devices';
  @override
  VerificationContext validateIntegrity(
    Insertable<Device> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('room_id')) {
      context.handle(
        _roomIdMeta,
        roomId.isAcceptableOrUnknown(data['room_id']!, _roomIdMeta),
      );
    } else if (isInserting) {
      context.missing(_roomIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('brand')) {
      context.handle(
        _brandMeta,
        brand.isAcceptableOrUnknown(data['brand']!, _brandMeta),
      );
    }
    if (data.containsKey('model')) {
      context.handle(
        _modelMeta,
        model.isAcceptableOrUnknown(data['model']!, _modelMeta),
      );
    }
    if (data.containsKey('photo_path')) {
      context.handle(
        _photoPathMeta,
        photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('power_watts')) {
      context.handle(
        _powerWattsMeta,
        powerWatts.isAcceptableOrUnknown(data['power_watts']!, _powerWattsMeta),
      );
    } else if (isInserting) {
      context.missing(_powerWattsMeta);
    }
    if (data.containsKey('avg_consumption_kwh')) {
      context.handle(
        _avgConsumptionKwhMeta,
        avgConsumptionKwh.isAcceptableOrUnknown(
          data['avg_consumption_kwh']!,
          _avgConsumptionKwhMeta,
        ),
      );
    }
    if (data.containsKey('avg_usage_hours_per_day')) {
      context.handle(
        _avgUsageHoursPerDayMeta,
        avgUsageHoursPerDay.isAcceptableOrUnknown(
          data['avg_usage_hours_per_day']!,
          _avgUsageHoursPerDayMeta,
        ),
      );
    }
    if (data.containsKey('standby_watts')) {
      context.handle(
        _standbyWattsMeta,
        standbyWatts.isAcceptableOrUnknown(
          data['standby_watts']!,
          _standbyWattsMeta,
        ),
      );
    }
    if (data.containsKey('estimated_monthly_cost_fcfa')) {
      context.handle(
        _estimatedMonthlyCostFcfaMeta,
        estimatedMonthlyCostFcfa.isAcceptableOrUnknown(
          data['estimated_monthly_cost_fcfa']!,
          _estimatedMonthlyCostFcfaMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Device map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Device(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      roomId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}room_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      brand: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}brand'],
      ),
      model: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model'],
      ),
      photoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_path'],
      ),
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      powerWatts: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}power_watts'],
      )!,
      avgConsumptionKwh: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}avg_consumption_kwh'],
      )!,
      avgUsageHoursPerDay: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}avg_usage_hours_per_day'],
      )!,
      standbyWatts: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}standby_watts'],
      )!,
      estimatedMonthlyCostFcfa: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}estimated_monthly_cost_fcfa'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $DevicesTable createAlias(String alias) {
    return $DevicesTable(attachedDatabase, alias);
  }
}

class Device extends DataClass implements Insertable<Device> {
  final String id;
  final String roomId;
  final String name;
  final String? brand;
  final String? model;
  final String? photoPath;
  final String category;
  final double powerWatts;
  final double avgConsumptionKwh;
  final double avgUsageHoursPerDay;
  final double standbyWatts;
  final double estimatedMonthlyCostFcfa;
  final bool isActive;
  final DateTime createdAt;
  const Device({
    required this.id,
    required this.roomId,
    required this.name,
    this.brand,
    this.model,
    this.photoPath,
    required this.category,
    required this.powerWatts,
    required this.avgConsumptionKwh,
    required this.avgUsageHoursPerDay,
    required this.standbyWatts,
    required this.estimatedMonthlyCostFcfa,
    required this.isActive,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['room_id'] = Variable<String>(roomId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || brand != null) {
      map['brand'] = Variable<String>(brand);
    }
    if (!nullToAbsent || model != null) {
      map['model'] = Variable<String>(model);
    }
    if (!nullToAbsent || photoPath != null) {
      map['photo_path'] = Variable<String>(photoPath);
    }
    map['category'] = Variable<String>(category);
    map['power_watts'] = Variable<double>(powerWatts);
    map['avg_consumption_kwh'] = Variable<double>(avgConsumptionKwh);
    map['avg_usage_hours_per_day'] = Variable<double>(avgUsageHoursPerDay);
    map['standby_watts'] = Variable<double>(standbyWatts);
    map['estimated_monthly_cost_fcfa'] = Variable<double>(
      estimatedMonthlyCostFcfa,
    );
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DevicesCompanion toCompanion(bool nullToAbsent) {
    return DevicesCompanion(
      id: Value(id),
      roomId: Value(roomId),
      name: Value(name),
      brand: brand == null && nullToAbsent
          ? const Value.absent()
          : Value(brand),
      model: model == null && nullToAbsent
          ? const Value.absent()
          : Value(model),
      photoPath: photoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(photoPath),
      category: Value(category),
      powerWatts: Value(powerWatts),
      avgConsumptionKwh: Value(avgConsumptionKwh),
      avgUsageHoursPerDay: Value(avgUsageHoursPerDay),
      standbyWatts: Value(standbyWatts),
      estimatedMonthlyCostFcfa: Value(estimatedMonthlyCostFcfa),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
    );
  }

  factory Device.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Device(
      id: serializer.fromJson<String>(json['id']),
      roomId: serializer.fromJson<String>(json['roomId']),
      name: serializer.fromJson<String>(json['name']),
      brand: serializer.fromJson<String?>(json['brand']),
      model: serializer.fromJson<String?>(json['model']),
      photoPath: serializer.fromJson<String?>(json['photoPath']),
      category: serializer.fromJson<String>(json['category']),
      powerWatts: serializer.fromJson<double>(json['powerWatts']),
      avgConsumptionKwh: serializer.fromJson<double>(json['avgConsumptionKwh']),
      avgUsageHoursPerDay: serializer.fromJson<double>(
        json['avgUsageHoursPerDay'],
      ),
      standbyWatts: serializer.fromJson<double>(json['standbyWatts']),
      estimatedMonthlyCostFcfa: serializer.fromJson<double>(
        json['estimatedMonthlyCostFcfa'],
      ),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'roomId': serializer.toJson<String>(roomId),
      'name': serializer.toJson<String>(name),
      'brand': serializer.toJson<String?>(brand),
      'model': serializer.toJson<String?>(model),
      'photoPath': serializer.toJson<String?>(photoPath),
      'category': serializer.toJson<String>(category),
      'powerWatts': serializer.toJson<double>(powerWatts),
      'avgConsumptionKwh': serializer.toJson<double>(avgConsumptionKwh),
      'avgUsageHoursPerDay': serializer.toJson<double>(avgUsageHoursPerDay),
      'standbyWatts': serializer.toJson<double>(standbyWatts),
      'estimatedMonthlyCostFcfa': serializer.toJson<double>(
        estimatedMonthlyCostFcfa,
      ),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Device copyWith({
    String? id,
    String? roomId,
    String? name,
    Value<String?> brand = const Value.absent(),
    Value<String?> model = const Value.absent(),
    Value<String?> photoPath = const Value.absent(),
    String? category,
    double? powerWatts,
    double? avgConsumptionKwh,
    double? avgUsageHoursPerDay,
    double? standbyWatts,
    double? estimatedMonthlyCostFcfa,
    bool? isActive,
    DateTime? createdAt,
  }) => Device(
    id: id ?? this.id,
    roomId: roomId ?? this.roomId,
    name: name ?? this.name,
    brand: brand.present ? brand.value : this.brand,
    model: model.present ? model.value : this.model,
    photoPath: photoPath.present ? photoPath.value : this.photoPath,
    category: category ?? this.category,
    powerWatts: powerWatts ?? this.powerWatts,
    avgConsumptionKwh: avgConsumptionKwh ?? this.avgConsumptionKwh,
    avgUsageHoursPerDay: avgUsageHoursPerDay ?? this.avgUsageHoursPerDay,
    standbyWatts: standbyWatts ?? this.standbyWatts,
    estimatedMonthlyCostFcfa:
        estimatedMonthlyCostFcfa ?? this.estimatedMonthlyCostFcfa,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
  );
  Device copyWithCompanion(DevicesCompanion data) {
    return Device(
      id: data.id.present ? data.id.value : this.id,
      roomId: data.roomId.present ? data.roomId.value : this.roomId,
      name: data.name.present ? data.name.value : this.name,
      brand: data.brand.present ? data.brand.value : this.brand,
      model: data.model.present ? data.model.value : this.model,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
      category: data.category.present ? data.category.value : this.category,
      powerWatts: data.powerWatts.present
          ? data.powerWatts.value
          : this.powerWatts,
      avgConsumptionKwh: data.avgConsumptionKwh.present
          ? data.avgConsumptionKwh.value
          : this.avgConsumptionKwh,
      avgUsageHoursPerDay: data.avgUsageHoursPerDay.present
          ? data.avgUsageHoursPerDay.value
          : this.avgUsageHoursPerDay,
      standbyWatts: data.standbyWatts.present
          ? data.standbyWatts.value
          : this.standbyWatts,
      estimatedMonthlyCostFcfa: data.estimatedMonthlyCostFcfa.present
          ? data.estimatedMonthlyCostFcfa.value
          : this.estimatedMonthlyCostFcfa,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Device(')
          ..write('id: $id, ')
          ..write('roomId: $roomId, ')
          ..write('name: $name, ')
          ..write('brand: $brand, ')
          ..write('model: $model, ')
          ..write('photoPath: $photoPath, ')
          ..write('category: $category, ')
          ..write('powerWatts: $powerWatts, ')
          ..write('avgConsumptionKwh: $avgConsumptionKwh, ')
          ..write('avgUsageHoursPerDay: $avgUsageHoursPerDay, ')
          ..write('standbyWatts: $standbyWatts, ')
          ..write('estimatedMonthlyCostFcfa: $estimatedMonthlyCostFcfa, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    roomId,
    name,
    brand,
    model,
    photoPath,
    category,
    powerWatts,
    avgConsumptionKwh,
    avgUsageHoursPerDay,
    standbyWatts,
    estimatedMonthlyCostFcfa,
    isActive,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Device &&
          other.id == this.id &&
          other.roomId == this.roomId &&
          other.name == this.name &&
          other.brand == this.brand &&
          other.model == this.model &&
          other.photoPath == this.photoPath &&
          other.category == this.category &&
          other.powerWatts == this.powerWatts &&
          other.avgConsumptionKwh == this.avgConsumptionKwh &&
          other.avgUsageHoursPerDay == this.avgUsageHoursPerDay &&
          other.standbyWatts == this.standbyWatts &&
          other.estimatedMonthlyCostFcfa == this.estimatedMonthlyCostFcfa &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt);
}

class DevicesCompanion extends UpdateCompanion<Device> {
  final Value<String> id;
  final Value<String> roomId;
  final Value<String> name;
  final Value<String?> brand;
  final Value<String?> model;
  final Value<String?> photoPath;
  final Value<String> category;
  final Value<double> powerWatts;
  final Value<double> avgConsumptionKwh;
  final Value<double> avgUsageHoursPerDay;
  final Value<double> standbyWatts;
  final Value<double> estimatedMonthlyCostFcfa;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const DevicesCompanion({
    this.id = const Value.absent(),
    this.roomId = const Value.absent(),
    this.name = const Value.absent(),
    this.brand = const Value.absent(),
    this.model = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.category = const Value.absent(),
    this.powerWatts = const Value.absent(),
    this.avgConsumptionKwh = const Value.absent(),
    this.avgUsageHoursPerDay = const Value.absent(),
    this.standbyWatts = const Value.absent(),
    this.estimatedMonthlyCostFcfa = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DevicesCompanion.insert({
    required String id,
    required String roomId,
    required String name,
    this.brand = const Value.absent(),
    this.model = const Value.absent(),
    this.photoPath = const Value.absent(),
    required String category,
    required double powerWatts,
    this.avgConsumptionKwh = const Value.absent(),
    this.avgUsageHoursPerDay = const Value.absent(),
    this.standbyWatts = const Value.absent(),
    this.estimatedMonthlyCostFcfa = const Value.absent(),
    this.isActive = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       roomId = Value(roomId),
       name = Value(name),
       category = Value(category),
       powerWatts = Value(powerWatts),
       createdAt = Value(createdAt);
  static Insertable<Device> custom({
    Expression<String>? id,
    Expression<String>? roomId,
    Expression<String>? name,
    Expression<String>? brand,
    Expression<String>? model,
    Expression<String>? photoPath,
    Expression<String>? category,
    Expression<double>? powerWatts,
    Expression<double>? avgConsumptionKwh,
    Expression<double>? avgUsageHoursPerDay,
    Expression<double>? standbyWatts,
    Expression<double>? estimatedMonthlyCostFcfa,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roomId != null) 'room_id': roomId,
      if (name != null) 'name': name,
      if (brand != null) 'brand': brand,
      if (model != null) 'model': model,
      if (photoPath != null) 'photo_path': photoPath,
      if (category != null) 'category': category,
      if (powerWatts != null) 'power_watts': powerWatts,
      if (avgConsumptionKwh != null) 'avg_consumption_kwh': avgConsumptionKwh,
      if (avgUsageHoursPerDay != null)
        'avg_usage_hours_per_day': avgUsageHoursPerDay,
      if (standbyWatts != null) 'standby_watts': standbyWatts,
      if (estimatedMonthlyCostFcfa != null)
        'estimated_monthly_cost_fcfa': estimatedMonthlyCostFcfa,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DevicesCompanion copyWith({
    Value<String>? id,
    Value<String>? roomId,
    Value<String>? name,
    Value<String?>? brand,
    Value<String?>? model,
    Value<String?>? photoPath,
    Value<String>? category,
    Value<double>? powerWatts,
    Value<double>? avgConsumptionKwh,
    Value<double>? avgUsageHoursPerDay,
    Value<double>? standbyWatts,
    Value<double>? estimatedMonthlyCostFcfa,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return DevicesCompanion(
      id: id ?? this.id,
      roomId: roomId ?? this.roomId,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      photoPath: photoPath ?? this.photoPath,
      category: category ?? this.category,
      powerWatts: powerWatts ?? this.powerWatts,
      avgConsumptionKwh: avgConsumptionKwh ?? this.avgConsumptionKwh,
      avgUsageHoursPerDay: avgUsageHoursPerDay ?? this.avgUsageHoursPerDay,
      standbyWatts: standbyWatts ?? this.standbyWatts,
      estimatedMonthlyCostFcfa:
          estimatedMonthlyCostFcfa ?? this.estimatedMonthlyCostFcfa,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (roomId.present) {
      map['room_id'] = Variable<String>(roomId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (model.present) {
      map['model'] = Variable<String>(model.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (powerWatts.present) {
      map['power_watts'] = Variable<double>(powerWatts.value);
    }
    if (avgConsumptionKwh.present) {
      map['avg_consumption_kwh'] = Variable<double>(avgConsumptionKwh.value);
    }
    if (avgUsageHoursPerDay.present) {
      map['avg_usage_hours_per_day'] = Variable<double>(
        avgUsageHoursPerDay.value,
      );
    }
    if (standbyWatts.present) {
      map['standby_watts'] = Variable<double>(standbyWatts.value);
    }
    if (estimatedMonthlyCostFcfa.present) {
      map['estimated_monthly_cost_fcfa'] = Variable<double>(
        estimatedMonthlyCostFcfa.value,
      );
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DevicesCompanion(')
          ..write('id: $id, ')
          ..write('roomId: $roomId, ')
          ..write('name: $name, ')
          ..write('brand: $brand, ')
          ..write('model: $model, ')
          ..write('photoPath: $photoPath, ')
          ..write('category: $category, ')
          ..write('powerWatts: $powerWatts, ')
          ..write('avgConsumptionKwh: $avgConsumptionKwh, ')
          ..write('avgUsageHoursPerDay: $avgUsageHoursPerDay, ')
          ..write('standbyWatts: $standbyWatts, ')
          ..write('estimatedMonthlyCostFcfa: $estimatedMonthlyCostFcfa, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ElectricityReadingsTable extends ElectricityReadings
    with TableInfo<$ElectricityReadingsTable, ElectricityReading> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ElectricityReadingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _houseIdMeta = const VerificationMeta(
    'houseId',
  );
  @override
  late final GeneratedColumn<String> houseId = GeneratedColumn<String>(
    'house_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES houses (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueKwhMeta = const VerificationMeta(
    'valueKwh',
  );
  @override
  late final GeneratedColumn<double> valueKwh = GeneratedColumn<double>(
    'value_kwh',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _meterTypeMeta = const VerificationMeta(
    'meterType',
  );
  @override
  late final GeneratedColumn<String> meterType = GeneratedColumn<String>(
    'meter_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _costFcfaMeta = const VerificationMeta(
    'costFcfa',
  );
  @override
  late final GeneratedColumn<double> costFcfa = GeneratedColumn<double>(
    'cost_fcfa',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    houseId,
    date,
    valueKwh,
    meterType,
    costFcfa,
    note,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'electricity_readings';
  @override
  VerificationContext validateIntegrity(
    Insertable<ElectricityReading> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('house_id')) {
      context.handle(
        _houseIdMeta,
        houseId.isAcceptableOrUnknown(data['house_id']!, _houseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_houseIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('value_kwh')) {
      context.handle(
        _valueKwhMeta,
        valueKwh.isAcceptableOrUnknown(data['value_kwh']!, _valueKwhMeta),
      );
    } else if (isInserting) {
      context.missing(_valueKwhMeta);
    }
    if (data.containsKey('meter_type')) {
      context.handle(
        _meterTypeMeta,
        meterType.isAcceptableOrUnknown(data['meter_type']!, _meterTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_meterTypeMeta);
    }
    if (data.containsKey('cost_fcfa')) {
      context.handle(
        _costFcfaMeta,
        costFcfa.isAcceptableOrUnknown(data['cost_fcfa']!, _costFcfaMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ElectricityReading map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ElectricityReading(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      houseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}house_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      valueKwh: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}value_kwh'],
      )!,
      meterType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meter_type'],
      )!,
      costFcfa: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cost_fcfa'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ElectricityReadingsTable createAlias(String alias) {
    return $ElectricityReadingsTable(attachedDatabase, alias);
  }
}

class ElectricityReading extends DataClass
    implements Insertable<ElectricityReading> {
  final String id;
  final String houseId;
  final DateTime date;
  final double valueKwh;
  final String meterType;
  final double? costFcfa;
  final String? note;
  final DateTime createdAt;
  const ElectricityReading({
    required this.id,
    required this.houseId,
    required this.date,
    required this.valueKwh,
    required this.meterType,
    this.costFcfa,
    this.note,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['house_id'] = Variable<String>(houseId);
    map['date'] = Variable<DateTime>(date);
    map['value_kwh'] = Variable<double>(valueKwh);
    map['meter_type'] = Variable<String>(meterType);
    if (!nullToAbsent || costFcfa != null) {
      map['cost_fcfa'] = Variable<double>(costFcfa);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ElectricityReadingsCompanion toCompanion(bool nullToAbsent) {
    return ElectricityReadingsCompanion(
      id: Value(id),
      houseId: Value(houseId),
      date: Value(date),
      valueKwh: Value(valueKwh),
      meterType: Value(meterType),
      costFcfa: costFcfa == null && nullToAbsent
          ? const Value.absent()
          : Value(costFcfa),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      createdAt: Value(createdAt),
    );
  }

  factory ElectricityReading.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ElectricityReading(
      id: serializer.fromJson<String>(json['id']),
      houseId: serializer.fromJson<String>(json['houseId']),
      date: serializer.fromJson<DateTime>(json['date']),
      valueKwh: serializer.fromJson<double>(json['valueKwh']),
      meterType: serializer.fromJson<String>(json['meterType']),
      costFcfa: serializer.fromJson<double?>(json['costFcfa']),
      note: serializer.fromJson<String?>(json['note']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'houseId': serializer.toJson<String>(houseId),
      'date': serializer.toJson<DateTime>(date),
      'valueKwh': serializer.toJson<double>(valueKwh),
      'meterType': serializer.toJson<String>(meterType),
      'costFcfa': serializer.toJson<double?>(costFcfa),
      'note': serializer.toJson<String?>(note),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ElectricityReading copyWith({
    String? id,
    String? houseId,
    DateTime? date,
    double? valueKwh,
    String? meterType,
    Value<double?> costFcfa = const Value.absent(),
    Value<String?> note = const Value.absent(),
    DateTime? createdAt,
  }) => ElectricityReading(
    id: id ?? this.id,
    houseId: houseId ?? this.houseId,
    date: date ?? this.date,
    valueKwh: valueKwh ?? this.valueKwh,
    meterType: meterType ?? this.meterType,
    costFcfa: costFcfa.present ? costFcfa.value : this.costFcfa,
    note: note.present ? note.value : this.note,
    createdAt: createdAt ?? this.createdAt,
  );
  ElectricityReading copyWithCompanion(ElectricityReadingsCompanion data) {
    return ElectricityReading(
      id: data.id.present ? data.id.value : this.id,
      houseId: data.houseId.present ? data.houseId.value : this.houseId,
      date: data.date.present ? data.date.value : this.date,
      valueKwh: data.valueKwh.present ? data.valueKwh.value : this.valueKwh,
      meterType: data.meterType.present ? data.meterType.value : this.meterType,
      costFcfa: data.costFcfa.present ? data.costFcfa.value : this.costFcfa,
      note: data.note.present ? data.note.value : this.note,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ElectricityReading(')
          ..write('id: $id, ')
          ..write('houseId: $houseId, ')
          ..write('date: $date, ')
          ..write('valueKwh: $valueKwh, ')
          ..write('meterType: $meterType, ')
          ..write('costFcfa: $costFcfa, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    houseId,
    date,
    valueKwh,
    meterType,
    costFcfa,
    note,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ElectricityReading &&
          other.id == this.id &&
          other.houseId == this.houseId &&
          other.date == this.date &&
          other.valueKwh == this.valueKwh &&
          other.meterType == this.meterType &&
          other.costFcfa == this.costFcfa &&
          other.note == this.note &&
          other.createdAt == this.createdAt);
}

class ElectricityReadingsCompanion extends UpdateCompanion<ElectricityReading> {
  final Value<String> id;
  final Value<String> houseId;
  final Value<DateTime> date;
  final Value<double> valueKwh;
  final Value<String> meterType;
  final Value<double?> costFcfa;
  final Value<String?> note;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const ElectricityReadingsCompanion({
    this.id = const Value.absent(),
    this.houseId = const Value.absent(),
    this.date = const Value.absent(),
    this.valueKwh = const Value.absent(),
    this.meterType = const Value.absent(),
    this.costFcfa = const Value.absent(),
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ElectricityReadingsCompanion.insert({
    required String id,
    required String houseId,
    required DateTime date,
    required double valueKwh,
    required String meterType,
    this.costFcfa = const Value.absent(),
    this.note = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       houseId = Value(houseId),
       date = Value(date),
       valueKwh = Value(valueKwh),
       meterType = Value(meterType),
       createdAt = Value(createdAt);
  static Insertable<ElectricityReading> custom({
    Expression<String>? id,
    Expression<String>? houseId,
    Expression<DateTime>? date,
    Expression<double>? valueKwh,
    Expression<String>? meterType,
    Expression<double>? costFcfa,
    Expression<String>? note,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (houseId != null) 'house_id': houseId,
      if (date != null) 'date': date,
      if (valueKwh != null) 'value_kwh': valueKwh,
      if (meterType != null) 'meter_type': meterType,
      if (costFcfa != null) 'cost_fcfa': costFcfa,
      if (note != null) 'note': note,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ElectricityReadingsCompanion copyWith({
    Value<String>? id,
    Value<String>? houseId,
    Value<DateTime>? date,
    Value<double>? valueKwh,
    Value<String>? meterType,
    Value<double?>? costFcfa,
    Value<String?>? note,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return ElectricityReadingsCompanion(
      id: id ?? this.id,
      houseId: houseId ?? this.houseId,
      date: date ?? this.date,
      valueKwh: valueKwh ?? this.valueKwh,
      meterType: meterType ?? this.meterType,
      costFcfa: costFcfa ?? this.costFcfa,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (houseId.present) {
      map['house_id'] = Variable<String>(houseId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (valueKwh.present) {
      map['value_kwh'] = Variable<double>(valueKwh.value);
    }
    if (meterType.present) {
      map['meter_type'] = Variable<String>(meterType.value);
    }
    if (costFcfa.present) {
      map['cost_fcfa'] = Variable<double>(costFcfa.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ElectricityReadingsCompanion(')
          ..write('id: $id, ')
          ..write('houseId: $houseId, ')
          ..write('date: $date, ')
          ..write('valueKwh: $valueKwh, ')
          ..write('meterType: $meterType, ')
          ..write('costFcfa: $costFcfa, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GasBottlesTable extends GasBottles
    with TableInfo<$GasBottlesTable, GasBottle> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GasBottlesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _houseIdMeta = const VerificationMeta(
    'houseId',
  );
  @override
  late final GeneratedColumn<String> houseId = GeneratedColumn<String>(
    'house_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES houses (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceFcfaMeta = const VerificationMeta(
    'priceFcfa',
  );
  @override
  late final GeneratedColumn<double> priceFcfa = GeneratedColumn<double>(
    'price_fcfa',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _estimatedEndDateMeta = const VerificationMeta(
    'estimatedEndDate',
  );
  @override
  late final GeneratedColumn<DateTime> estimatedEndDate =
      GeneratedColumn<DateTime>(
        'estimated_end_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _percentRemainingMeta = const VerificationMeta(
    'percentRemaining',
  );
  @override
  late final GeneratedColumn<double> percentRemaining = GeneratedColumn<double>(
    'percent_remaining',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    houseId,
    startDate,
    type,
    priceFcfa,
    isActive,
    estimatedEndDate,
    percentRemaining,
    note,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'gas_bottles';
  @override
  VerificationContext validateIntegrity(
    Insertable<GasBottle> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('house_id')) {
      context.handle(
        _houseIdMeta,
        houseId.isAcceptableOrUnknown(data['house_id']!, _houseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_houseIdMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('price_fcfa')) {
      context.handle(
        _priceFcfaMeta,
        priceFcfa.isAcceptableOrUnknown(data['price_fcfa']!, _priceFcfaMeta),
      );
    } else if (isInserting) {
      context.missing(_priceFcfaMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('estimated_end_date')) {
      context.handle(
        _estimatedEndDateMeta,
        estimatedEndDate.isAcceptableOrUnknown(
          data['estimated_end_date']!,
          _estimatedEndDateMeta,
        ),
      );
    }
    if (data.containsKey('percent_remaining')) {
      context.handle(
        _percentRemainingMeta,
        percentRemaining.isAcceptableOrUnknown(
          data['percent_remaining']!,
          _percentRemainingMeta,
        ),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GasBottle map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GasBottle(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      houseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}house_id'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      priceFcfa: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price_fcfa'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      estimatedEndDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}estimated_end_date'],
      ),
      percentRemaining: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}percent_remaining'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $GasBottlesTable createAlias(String alias) {
    return $GasBottlesTable(attachedDatabase, alias);
  }
}

class GasBottle extends DataClass implements Insertable<GasBottle> {
  final String id;
  final String houseId;
  final DateTime startDate;
  final String type;
  final double priceFcfa;
  final bool isActive;
  final DateTime? estimatedEndDate;
  final double? percentRemaining;
  final String? note;
  final DateTime createdAt;
  const GasBottle({
    required this.id,
    required this.houseId,
    required this.startDate,
    required this.type,
    required this.priceFcfa,
    required this.isActive,
    this.estimatedEndDate,
    this.percentRemaining,
    this.note,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['house_id'] = Variable<String>(houseId);
    map['start_date'] = Variable<DateTime>(startDate);
    map['type'] = Variable<String>(type);
    map['price_fcfa'] = Variable<double>(priceFcfa);
    map['is_active'] = Variable<bool>(isActive);
    if (!nullToAbsent || estimatedEndDate != null) {
      map['estimated_end_date'] = Variable<DateTime>(estimatedEndDate);
    }
    if (!nullToAbsent || percentRemaining != null) {
      map['percent_remaining'] = Variable<double>(percentRemaining);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  GasBottlesCompanion toCompanion(bool nullToAbsent) {
    return GasBottlesCompanion(
      id: Value(id),
      houseId: Value(houseId),
      startDate: Value(startDate),
      type: Value(type),
      priceFcfa: Value(priceFcfa),
      isActive: Value(isActive),
      estimatedEndDate: estimatedEndDate == null && nullToAbsent
          ? const Value.absent()
          : Value(estimatedEndDate),
      percentRemaining: percentRemaining == null && nullToAbsent
          ? const Value.absent()
          : Value(percentRemaining),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      createdAt: Value(createdAt),
    );
  }

  factory GasBottle.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GasBottle(
      id: serializer.fromJson<String>(json['id']),
      houseId: serializer.fromJson<String>(json['houseId']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      type: serializer.fromJson<String>(json['type']),
      priceFcfa: serializer.fromJson<double>(json['priceFcfa']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      estimatedEndDate: serializer.fromJson<DateTime?>(
        json['estimatedEndDate'],
      ),
      percentRemaining: serializer.fromJson<double?>(json['percentRemaining']),
      note: serializer.fromJson<String?>(json['note']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'houseId': serializer.toJson<String>(houseId),
      'startDate': serializer.toJson<DateTime>(startDate),
      'type': serializer.toJson<String>(type),
      'priceFcfa': serializer.toJson<double>(priceFcfa),
      'isActive': serializer.toJson<bool>(isActive),
      'estimatedEndDate': serializer.toJson<DateTime?>(estimatedEndDate),
      'percentRemaining': serializer.toJson<double?>(percentRemaining),
      'note': serializer.toJson<String?>(note),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  GasBottle copyWith({
    String? id,
    String? houseId,
    DateTime? startDate,
    String? type,
    double? priceFcfa,
    bool? isActive,
    Value<DateTime?> estimatedEndDate = const Value.absent(),
    Value<double?> percentRemaining = const Value.absent(),
    Value<String?> note = const Value.absent(),
    DateTime? createdAt,
  }) => GasBottle(
    id: id ?? this.id,
    houseId: houseId ?? this.houseId,
    startDate: startDate ?? this.startDate,
    type: type ?? this.type,
    priceFcfa: priceFcfa ?? this.priceFcfa,
    isActive: isActive ?? this.isActive,
    estimatedEndDate: estimatedEndDate.present
        ? estimatedEndDate.value
        : this.estimatedEndDate,
    percentRemaining: percentRemaining.present
        ? percentRemaining.value
        : this.percentRemaining,
    note: note.present ? note.value : this.note,
    createdAt: createdAt ?? this.createdAt,
  );
  GasBottle copyWithCompanion(GasBottlesCompanion data) {
    return GasBottle(
      id: data.id.present ? data.id.value : this.id,
      houseId: data.houseId.present ? data.houseId.value : this.houseId,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      type: data.type.present ? data.type.value : this.type,
      priceFcfa: data.priceFcfa.present ? data.priceFcfa.value : this.priceFcfa,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      estimatedEndDate: data.estimatedEndDate.present
          ? data.estimatedEndDate.value
          : this.estimatedEndDate,
      percentRemaining: data.percentRemaining.present
          ? data.percentRemaining.value
          : this.percentRemaining,
      note: data.note.present ? data.note.value : this.note,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GasBottle(')
          ..write('id: $id, ')
          ..write('houseId: $houseId, ')
          ..write('startDate: $startDate, ')
          ..write('type: $type, ')
          ..write('priceFcfa: $priceFcfa, ')
          ..write('isActive: $isActive, ')
          ..write('estimatedEndDate: $estimatedEndDate, ')
          ..write('percentRemaining: $percentRemaining, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    houseId,
    startDate,
    type,
    priceFcfa,
    isActive,
    estimatedEndDate,
    percentRemaining,
    note,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GasBottle &&
          other.id == this.id &&
          other.houseId == this.houseId &&
          other.startDate == this.startDate &&
          other.type == this.type &&
          other.priceFcfa == this.priceFcfa &&
          other.isActive == this.isActive &&
          other.estimatedEndDate == this.estimatedEndDate &&
          other.percentRemaining == this.percentRemaining &&
          other.note == this.note &&
          other.createdAt == this.createdAt);
}

class GasBottlesCompanion extends UpdateCompanion<GasBottle> {
  final Value<String> id;
  final Value<String> houseId;
  final Value<DateTime> startDate;
  final Value<String> type;
  final Value<double> priceFcfa;
  final Value<bool> isActive;
  final Value<DateTime?> estimatedEndDate;
  final Value<double?> percentRemaining;
  final Value<String?> note;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const GasBottlesCompanion({
    this.id = const Value.absent(),
    this.houseId = const Value.absent(),
    this.startDate = const Value.absent(),
    this.type = const Value.absent(),
    this.priceFcfa = const Value.absent(),
    this.isActive = const Value.absent(),
    this.estimatedEndDate = const Value.absent(),
    this.percentRemaining = const Value.absent(),
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GasBottlesCompanion.insert({
    required String id,
    required String houseId,
    required DateTime startDate,
    required String type,
    required double priceFcfa,
    this.isActive = const Value.absent(),
    this.estimatedEndDate = const Value.absent(),
    this.percentRemaining = const Value.absent(),
    this.note = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       houseId = Value(houseId),
       startDate = Value(startDate),
       type = Value(type),
       priceFcfa = Value(priceFcfa),
       createdAt = Value(createdAt);
  static Insertable<GasBottle> custom({
    Expression<String>? id,
    Expression<String>? houseId,
    Expression<DateTime>? startDate,
    Expression<String>? type,
    Expression<double>? priceFcfa,
    Expression<bool>? isActive,
    Expression<DateTime>? estimatedEndDate,
    Expression<double>? percentRemaining,
    Expression<String>? note,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (houseId != null) 'house_id': houseId,
      if (startDate != null) 'start_date': startDate,
      if (type != null) 'type': type,
      if (priceFcfa != null) 'price_fcfa': priceFcfa,
      if (isActive != null) 'is_active': isActive,
      if (estimatedEndDate != null) 'estimated_end_date': estimatedEndDate,
      if (percentRemaining != null) 'percent_remaining': percentRemaining,
      if (note != null) 'note': note,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GasBottlesCompanion copyWith({
    Value<String>? id,
    Value<String>? houseId,
    Value<DateTime>? startDate,
    Value<String>? type,
    Value<double>? priceFcfa,
    Value<bool>? isActive,
    Value<DateTime?>? estimatedEndDate,
    Value<double?>? percentRemaining,
    Value<String?>? note,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return GasBottlesCompanion(
      id: id ?? this.id,
      houseId: houseId ?? this.houseId,
      startDate: startDate ?? this.startDate,
      type: type ?? this.type,
      priceFcfa: priceFcfa ?? this.priceFcfa,
      isActive: isActive ?? this.isActive,
      estimatedEndDate: estimatedEndDate ?? this.estimatedEndDate,
      percentRemaining: percentRemaining ?? this.percentRemaining,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (houseId.present) {
      map['house_id'] = Variable<String>(houseId.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (priceFcfa.present) {
      map['price_fcfa'] = Variable<double>(priceFcfa.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (estimatedEndDate.present) {
      map['estimated_end_date'] = Variable<DateTime>(estimatedEndDate.value);
    }
    if (percentRemaining.present) {
      map['percent_remaining'] = Variable<double>(percentRemaining.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GasBottlesCompanion(')
          ..write('id: $id, ')
          ..write('houseId: $houseId, ')
          ..write('startDate: $startDate, ')
          ..write('type: $type, ')
          ..write('priceFcfa: $priceFcfa, ')
          ..write('isActive: $isActive, ')
          ..write('estimatedEndDate: $estimatedEndDate, ')
          ..write('percentRemaining: $percentRemaining, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $HousesTable houses = $HousesTable(this);
  late final $RoomsTable rooms = $RoomsTable(this);
  late final $DevicesTable devices = $DevicesTable(this);
  late final $ElectricityReadingsTable electricityReadings =
      $ElectricityReadingsTable(this);
  late final $GasBottlesTable gasBottles = $GasBottlesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    houses,
    rooms,
    devices,
    electricityReadings,
    gasBottles,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'houses',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('rooms', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'rooms',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('devices', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'houses',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('electricity_readings', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'houses',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('gas_bottles', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$HousesTableCreateCompanionBuilder =
    HousesCompanion Function({
      required String id,
      required String name,
      Value<String?> photoPath,
      Value<int> roomCount,
      Value<int> inhabitants,
      Value<String> meterType,
      Value<String> preferredGasBottleType,
      Value<String?> address,
      Value<double?> latitude,
      Value<double?> longitude,
      Value<double?> surfaceM2,
      Value<String?> timezone,
      required DateTime createdAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });
typedef $$HousesTableUpdateCompanionBuilder =
    HousesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> photoPath,
      Value<int> roomCount,
      Value<int> inhabitants,
      Value<String> meterType,
      Value<String> preferredGasBottleType,
      Value<String?> address,
      Value<double?> latitude,
      Value<double?> longitude,
      Value<double?> surfaceM2,
      Value<String?> timezone,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });

final class $$HousesTableReferences
    extends BaseReferences<_$AppDatabase, $HousesTable, House> {
  $$HousesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RoomsTable, List<Room>> _roomsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.rooms,
    aliasName: $_aliasNameGenerator(db.houses.id, db.rooms.houseId),
  );

  $$RoomsTableProcessedTableManager get roomsRefs {
    final manager = $$RoomsTableTableManager(
      $_db,
      $_db.rooms,
    ).filter((f) => f.houseId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_roomsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ElectricityReadingsTable,
    List<ElectricityReading>
  >
  _electricityReadingsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.electricityReadings,
        aliasName: $_aliasNameGenerator(
          db.houses.id,
          db.electricityReadings.houseId,
        ),
      );

  $$ElectricityReadingsTableProcessedTableManager get electricityReadingsRefs {
    final manager = $$ElectricityReadingsTableTableManager(
      $_db,
      $_db.electricityReadings,
    ).filter((f) => f.houseId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _electricityReadingsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$GasBottlesTable, List<GasBottle>>
  _gasBottlesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.gasBottles,
    aliasName: $_aliasNameGenerator(db.houses.id, db.gasBottles.houseId),
  );

  $$GasBottlesTableProcessedTableManager get gasBottlesRefs {
    final manager = $$GasBottlesTableTableManager(
      $_db,
      $_db.gasBottles,
    ).filter((f) => f.houseId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_gasBottlesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$HousesTableFilterComposer
    extends Composer<_$AppDatabase, $HousesTable> {
  $$HousesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get roomCount => $composableBuilder(
    column: $table.roomCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get inhabitants => $composableBuilder(
    column: $table.inhabitants,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get meterType => $composableBuilder(
    column: $table.meterType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get preferredGasBottleType => $composableBuilder(
    column: $table.preferredGasBottleType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get surfaceM2 => $composableBuilder(
    column: $table.surfaceM2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timezone => $composableBuilder(
    column: $table.timezone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> roomsRefs(
    Expression<bool> Function($$RoomsTableFilterComposer f) f,
  ) {
    final $$RoomsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.rooms,
      getReferencedColumn: (t) => t.houseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoomsTableFilterComposer(
            $db: $db,
            $table: $db.rooms,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> electricityReadingsRefs(
    Expression<bool> Function($$ElectricityReadingsTableFilterComposer f) f,
  ) {
    final $$ElectricityReadingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.electricityReadings,
      getReferencedColumn: (t) => t.houseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ElectricityReadingsTableFilterComposer(
            $db: $db,
            $table: $db.electricityReadings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> gasBottlesRefs(
    Expression<bool> Function($$GasBottlesTableFilterComposer f) f,
  ) {
    final $$GasBottlesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gasBottles,
      getReferencedColumn: (t) => t.houseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GasBottlesTableFilterComposer(
            $db: $db,
            $table: $db.gasBottles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$HousesTableOrderingComposer
    extends Composer<_$AppDatabase, $HousesTable> {
  $$HousesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get roomCount => $composableBuilder(
    column: $table.roomCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get inhabitants => $composableBuilder(
    column: $table.inhabitants,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get meterType => $composableBuilder(
    column: $table.meterType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get preferredGasBottleType => $composableBuilder(
    column: $table.preferredGasBottleType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get surfaceM2 => $composableBuilder(
    column: $table.surfaceM2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timezone => $composableBuilder(
    column: $table.timezone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HousesTableAnnotationComposer
    extends Composer<_$AppDatabase, $HousesTable> {
  $$HousesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  GeneratedColumn<int> get roomCount =>
      $composableBuilder(column: $table.roomCount, builder: (column) => column);

  GeneratedColumn<int> get inhabitants => $composableBuilder(
    column: $table.inhabitants,
    builder: (column) => column,
  );

  GeneratedColumn<String> get meterType =>
      $composableBuilder(column: $table.meterType, builder: (column) => column);

  GeneratedColumn<String> get preferredGasBottleType => $composableBuilder(
    column: $table.preferredGasBottleType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<double> get surfaceM2 =>
      $composableBuilder(column: $table.surfaceM2, builder: (column) => column);

  GeneratedColumn<String> get timezone =>
      $composableBuilder(column: $table.timezone, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> roomsRefs<T extends Object>(
    Expression<T> Function($$RoomsTableAnnotationComposer a) f,
  ) {
    final $$RoomsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.rooms,
      getReferencedColumn: (t) => t.houseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoomsTableAnnotationComposer(
            $db: $db,
            $table: $db.rooms,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> electricityReadingsRefs<T extends Object>(
    Expression<T> Function($$ElectricityReadingsTableAnnotationComposer a) f,
  ) {
    final $$ElectricityReadingsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.electricityReadings,
          getReferencedColumn: (t) => t.houseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ElectricityReadingsTableAnnotationComposer(
                $db: $db,
                $table: $db.electricityReadings,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> gasBottlesRefs<T extends Object>(
    Expression<T> Function($$GasBottlesTableAnnotationComposer a) f,
  ) {
    final $$GasBottlesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gasBottles,
      getReferencedColumn: (t) => t.houseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GasBottlesTableAnnotationComposer(
            $db: $db,
            $table: $db.gasBottles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$HousesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HousesTable,
          House,
          $$HousesTableFilterComposer,
          $$HousesTableOrderingComposer,
          $$HousesTableAnnotationComposer,
          $$HousesTableCreateCompanionBuilder,
          $$HousesTableUpdateCompanionBuilder,
          (House, $$HousesTableReferences),
          House,
          PrefetchHooks Function({
            bool roomsRefs,
            bool electricityReadingsRefs,
            bool gasBottlesRefs,
          })
        > {
  $$HousesTableTableManager(_$AppDatabase db, $HousesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HousesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HousesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HousesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
                Value<int> roomCount = const Value.absent(),
                Value<int> inhabitants = const Value.absent(),
                Value<String> meterType = const Value.absent(),
                Value<String> preferredGasBottleType = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<double?> surfaceM2 = const Value.absent(),
                Value<String?> timezone = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HousesCompanion(
                id: id,
                name: name,
                photoPath: photoPath,
                roomCount: roomCount,
                inhabitants: inhabitants,
                meterType: meterType,
                preferredGasBottleType: preferredGasBottleType,
                address: address,
                latitude: latitude,
                longitude: longitude,
                surfaceM2: surfaceM2,
                timezone: timezone,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> photoPath = const Value.absent(),
                Value<int> roomCount = const Value.absent(),
                Value<int> inhabitants = const Value.absent(),
                Value<String> meterType = const Value.absent(),
                Value<String> preferredGasBottleType = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<double?> surfaceM2 = const Value.absent(),
                Value<String?> timezone = const Value.absent(),
                required DateTime createdAt,
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HousesCompanion.insert(
                id: id,
                name: name,
                photoPath: photoPath,
                roomCount: roomCount,
                inhabitants: inhabitants,
                meterType: meterType,
                preferredGasBottleType: preferredGasBottleType,
                address: address,
                latitude: latitude,
                longitude: longitude,
                surfaceM2: surfaceM2,
                timezone: timezone,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$HousesTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                roomsRefs = false,
                electricityReadingsRefs = false,
                gasBottlesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (roomsRefs) db.rooms,
                    if (electricityReadingsRefs) db.electricityReadings,
                    if (gasBottlesRefs) db.gasBottles,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (roomsRefs)
                        await $_getPrefetchedData<House, $HousesTable, Room>(
                          currentTable: table,
                          referencedTable: $$HousesTableReferences
                              ._roomsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$HousesTableReferences(db, table, p0).roomsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.houseId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (electricityReadingsRefs)
                        await $_getPrefetchedData<
                          House,
                          $HousesTable,
                          ElectricityReading
                        >(
                          currentTable: table,
                          referencedTable: $$HousesTableReferences
                              ._electricityReadingsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$HousesTableReferences(
                                db,
                                table,
                                p0,
                              ).electricityReadingsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.houseId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (gasBottlesRefs)
                        await $_getPrefetchedData<
                          House,
                          $HousesTable,
                          GasBottle
                        >(
                          currentTable: table,
                          referencedTable: $$HousesTableReferences
                              ._gasBottlesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$HousesTableReferences(
                                db,
                                table,
                                p0,
                              ).gasBottlesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.houseId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$HousesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HousesTable,
      House,
      $$HousesTableFilterComposer,
      $$HousesTableOrderingComposer,
      $$HousesTableAnnotationComposer,
      $$HousesTableCreateCompanionBuilder,
      $$HousesTableUpdateCompanionBuilder,
      (House, $$HousesTableReferences),
      House,
      PrefetchHooks Function({
        bool roomsRefs,
        bool electricityReadingsRefs,
        bool gasBottlesRefs,
      })
    >;
typedef $$RoomsTableCreateCompanionBuilder =
    RoomsCompanion Function({
      required String id,
      required String houseId,
      required String name,
      Value<double?> surfaceM2,
      Value<String?> photoPath,
      Value<String?> description,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$RoomsTableUpdateCompanionBuilder =
    RoomsCompanion Function({
      Value<String> id,
      Value<String> houseId,
      Value<String> name,
      Value<double?> surfaceM2,
      Value<String?> photoPath,
      Value<String?> description,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$RoomsTableReferences
    extends BaseReferences<_$AppDatabase, $RoomsTable, Room> {
  $$RoomsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $HousesTable _houseIdTable(_$AppDatabase db) => db.houses.createAlias(
    $_aliasNameGenerator(db.rooms.houseId, db.houses.id),
  );

  $$HousesTableProcessedTableManager get houseId {
    final $_column = $_itemColumn<String>('house_id')!;

    final manager = $$HousesTableTableManager(
      $_db,
      $_db.houses,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_houseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$DevicesTable, List<Device>> _devicesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.devices,
    aliasName: $_aliasNameGenerator(db.rooms.id, db.devices.roomId),
  );

  $$DevicesTableProcessedTableManager get devicesRefs {
    final manager = $$DevicesTableTableManager(
      $_db,
      $_db.devices,
    ).filter((f) => f.roomId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_devicesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RoomsTableFilterComposer extends Composer<_$AppDatabase, $RoomsTable> {
  $$RoomsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get surfaceM2 => $composableBuilder(
    column: $table.surfaceM2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$HousesTableFilterComposer get houseId {
    final $$HousesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.houseId,
      referencedTable: $db.houses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HousesTableFilterComposer(
            $db: $db,
            $table: $db.houses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> devicesRefs(
    Expression<bool> Function($$DevicesTableFilterComposer f) f,
  ) {
    final $$DevicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.devices,
      getReferencedColumn: (t) => t.roomId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DevicesTableFilterComposer(
            $db: $db,
            $table: $db.devices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RoomsTableOrderingComposer
    extends Composer<_$AppDatabase, $RoomsTable> {
  $$RoomsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get surfaceM2 => $composableBuilder(
    column: $table.surfaceM2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$HousesTableOrderingComposer get houseId {
    final $$HousesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.houseId,
      referencedTable: $db.houses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HousesTableOrderingComposer(
            $db: $db,
            $table: $db.houses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoomsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoomsTable> {
  $$RoomsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get surfaceM2 =>
      $composableBuilder(column: $table.surfaceM2, builder: (column) => column);

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$HousesTableAnnotationComposer get houseId {
    final $$HousesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.houseId,
      referencedTable: $db.houses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HousesTableAnnotationComposer(
            $db: $db,
            $table: $db.houses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> devicesRefs<T extends Object>(
    Expression<T> Function($$DevicesTableAnnotationComposer a) f,
  ) {
    final $$DevicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.devices,
      getReferencedColumn: (t) => t.roomId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DevicesTableAnnotationComposer(
            $db: $db,
            $table: $db.devices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RoomsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoomsTable,
          Room,
          $$RoomsTableFilterComposer,
          $$RoomsTableOrderingComposer,
          $$RoomsTableAnnotationComposer,
          $$RoomsTableCreateCompanionBuilder,
          $$RoomsTableUpdateCompanionBuilder,
          (Room, $$RoomsTableReferences),
          Room,
          PrefetchHooks Function({bool houseId, bool devicesRefs})
        > {
  $$RoomsTableTableManager(_$AppDatabase db, $RoomsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoomsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoomsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoomsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> houseId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double?> surfaceM2 = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoomsCompanion(
                id: id,
                houseId: houseId,
                name: name,
                surfaceM2: surfaceM2,
                photoPath: photoPath,
                description: description,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String houseId,
                required String name,
                Value<double?> surfaceM2 = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
                Value<String?> description = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => RoomsCompanion.insert(
                id: id,
                houseId: houseId,
                name: name,
                surfaceM2: surfaceM2,
                photoPath: photoPath,
                description: description,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$RoomsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({houseId = false, devicesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (devicesRefs) db.devices],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (houseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.houseId,
                                referencedTable: $$RoomsTableReferences
                                    ._houseIdTable(db),
                                referencedColumn: $$RoomsTableReferences
                                    ._houseIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (devicesRefs)
                    await $_getPrefetchedData<Room, $RoomsTable, Device>(
                      currentTable: table,
                      referencedTable: $$RoomsTableReferences._devicesRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$RoomsTableReferences(db, table, p0).devicesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.roomId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$RoomsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoomsTable,
      Room,
      $$RoomsTableFilterComposer,
      $$RoomsTableOrderingComposer,
      $$RoomsTableAnnotationComposer,
      $$RoomsTableCreateCompanionBuilder,
      $$RoomsTableUpdateCompanionBuilder,
      (Room, $$RoomsTableReferences),
      Room,
      PrefetchHooks Function({bool houseId, bool devicesRefs})
    >;
typedef $$DevicesTableCreateCompanionBuilder =
    DevicesCompanion Function({
      required String id,
      required String roomId,
      required String name,
      Value<String?> brand,
      Value<String?> model,
      Value<String?> photoPath,
      required String category,
      required double powerWatts,
      Value<double> avgConsumptionKwh,
      Value<double> avgUsageHoursPerDay,
      Value<double> standbyWatts,
      Value<double> estimatedMonthlyCostFcfa,
      Value<bool> isActive,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$DevicesTableUpdateCompanionBuilder =
    DevicesCompanion Function({
      Value<String> id,
      Value<String> roomId,
      Value<String> name,
      Value<String?> brand,
      Value<String?> model,
      Value<String?> photoPath,
      Value<String> category,
      Value<double> powerWatts,
      Value<double> avgConsumptionKwh,
      Value<double> avgUsageHoursPerDay,
      Value<double> standbyWatts,
      Value<double> estimatedMonthlyCostFcfa,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$DevicesTableReferences
    extends BaseReferences<_$AppDatabase, $DevicesTable, Device> {
  $$DevicesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RoomsTable _roomIdTable(_$AppDatabase db) => db.rooms.createAlias(
    $_aliasNameGenerator(db.devices.roomId, db.rooms.id),
  );

  $$RoomsTableProcessedTableManager get roomId {
    final $_column = $_itemColumn<String>('room_id')!;

    final manager = $$RoomsTableTableManager(
      $_db,
      $_db.rooms,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roomIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DevicesTableFilterComposer
    extends Composer<_$AppDatabase, $DevicesTable> {
  $$DevicesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get model => $composableBuilder(
    column: $table.model,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get powerWatts => $composableBuilder(
    column: $table.powerWatts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get avgConsumptionKwh => $composableBuilder(
    column: $table.avgConsumptionKwh,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get avgUsageHoursPerDay => $composableBuilder(
    column: $table.avgUsageHoursPerDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get standbyWatts => $composableBuilder(
    column: $table.standbyWatts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get estimatedMonthlyCostFcfa => $composableBuilder(
    column: $table.estimatedMonthlyCostFcfa,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$RoomsTableFilterComposer get roomId {
    final $$RoomsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roomId,
      referencedTable: $db.rooms,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoomsTableFilterComposer(
            $db: $db,
            $table: $db.rooms,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DevicesTableOrderingComposer
    extends Composer<_$AppDatabase, $DevicesTable> {
  $$DevicesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get model => $composableBuilder(
    column: $table.model,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get powerWatts => $composableBuilder(
    column: $table.powerWatts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get avgConsumptionKwh => $composableBuilder(
    column: $table.avgConsumptionKwh,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get avgUsageHoursPerDay => $composableBuilder(
    column: $table.avgUsageHoursPerDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get standbyWatts => $composableBuilder(
    column: $table.standbyWatts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get estimatedMonthlyCostFcfa => $composableBuilder(
    column: $table.estimatedMonthlyCostFcfa,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$RoomsTableOrderingComposer get roomId {
    final $$RoomsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roomId,
      referencedTable: $db.rooms,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoomsTableOrderingComposer(
            $db: $db,
            $table: $db.rooms,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DevicesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DevicesTable> {
  $$DevicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get brand =>
      $composableBuilder(column: $table.brand, builder: (column) => column);

  GeneratedColumn<String> get model =>
      $composableBuilder(column: $table.model, builder: (column) => column);

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<double> get powerWatts => $composableBuilder(
    column: $table.powerWatts,
    builder: (column) => column,
  );

  GeneratedColumn<double> get avgConsumptionKwh => $composableBuilder(
    column: $table.avgConsumptionKwh,
    builder: (column) => column,
  );

  GeneratedColumn<double> get avgUsageHoursPerDay => $composableBuilder(
    column: $table.avgUsageHoursPerDay,
    builder: (column) => column,
  );

  GeneratedColumn<double> get standbyWatts => $composableBuilder(
    column: $table.standbyWatts,
    builder: (column) => column,
  );

  GeneratedColumn<double> get estimatedMonthlyCostFcfa => $composableBuilder(
    column: $table.estimatedMonthlyCostFcfa,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$RoomsTableAnnotationComposer get roomId {
    final $$RoomsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roomId,
      referencedTable: $db.rooms,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoomsTableAnnotationComposer(
            $db: $db,
            $table: $db.rooms,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DevicesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DevicesTable,
          Device,
          $$DevicesTableFilterComposer,
          $$DevicesTableOrderingComposer,
          $$DevicesTableAnnotationComposer,
          $$DevicesTableCreateCompanionBuilder,
          $$DevicesTableUpdateCompanionBuilder,
          (Device, $$DevicesTableReferences),
          Device,
          PrefetchHooks Function({bool roomId})
        > {
  $$DevicesTableTableManager(_$AppDatabase db, $DevicesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DevicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DevicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DevicesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> roomId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> brand = const Value.absent(),
                Value<String?> model = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<double> powerWatts = const Value.absent(),
                Value<double> avgConsumptionKwh = const Value.absent(),
                Value<double> avgUsageHoursPerDay = const Value.absent(),
                Value<double> standbyWatts = const Value.absent(),
                Value<double> estimatedMonthlyCostFcfa = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DevicesCompanion(
                id: id,
                roomId: roomId,
                name: name,
                brand: brand,
                model: model,
                photoPath: photoPath,
                category: category,
                powerWatts: powerWatts,
                avgConsumptionKwh: avgConsumptionKwh,
                avgUsageHoursPerDay: avgUsageHoursPerDay,
                standbyWatts: standbyWatts,
                estimatedMonthlyCostFcfa: estimatedMonthlyCostFcfa,
                isActive: isActive,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String roomId,
                required String name,
                Value<String?> brand = const Value.absent(),
                Value<String?> model = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
                required String category,
                required double powerWatts,
                Value<double> avgConsumptionKwh = const Value.absent(),
                Value<double> avgUsageHoursPerDay = const Value.absent(),
                Value<double> standbyWatts = const Value.absent(),
                Value<double> estimatedMonthlyCostFcfa = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => DevicesCompanion.insert(
                id: id,
                roomId: roomId,
                name: name,
                brand: brand,
                model: model,
                photoPath: photoPath,
                category: category,
                powerWatts: powerWatts,
                avgConsumptionKwh: avgConsumptionKwh,
                avgUsageHoursPerDay: avgUsageHoursPerDay,
                standbyWatts: standbyWatts,
                estimatedMonthlyCostFcfa: estimatedMonthlyCostFcfa,
                isActive: isActive,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DevicesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({roomId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (roomId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.roomId,
                                referencedTable: $$DevicesTableReferences
                                    ._roomIdTable(db),
                                referencedColumn: $$DevicesTableReferences
                                    ._roomIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DevicesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DevicesTable,
      Device,
      $$DevicesTableFilterComposer,
      $$DevicesTableOrderingComposer,
      $$DevicesTableAnnotationComposer,
      $$DevicesTableCreateCompanionBuilder,
      $$DevicesTableUpdateCompanionBuilder,
      (Device, $$DevicesTableReferences),
      Device,
      PrefetchHooks Function({bool roomId})
    >;
typedef $$ElectricityReadingsTableCreateCompanionBuilder =
    ElectricityReadingsCompanion Function({
      required String id,
      required String houseId,
      required DateTime date,
      required double valueKwh,
      required String meterType,
      Value<double?> costFcfa,
      Value<String?> note,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$ElectricityReadingsTableUpdateCompanionBuilder =
    ElectricityReadingsCompanion Function({
      Value<String> id,
      Value<String> houseId,
      Value<DateTime> date,
      Value<double> valueKwh,
      Value<String> meterType,
      Value<double?> costFcfa,
      Value<String?> note,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$ElectricityReadingsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ElectricityReadingsTable,
          ElectricityReading
        > {
  $$ElectricityReadingsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $HousesTable _houseIdTable(_$AppDatabase db) => db.houses.createAlias(
    $_aliasNameGenerator(db.electricityReadings.houseId, db.houses.id),
  );

  $$HousesTableProcessedTableManager get houseId {
    final $_column = $_itemColumn<String>('house_id')!;

    final manager = $$HousesTableTableManager(
      $_db,
      $_db.houses,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_houseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ElectricityReadingsTableFilterComposer
    extends Composer<_$AppDatabase, $ElectricityReadingsTable> {
  $$ElectricityReadingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get valueKwh => $composableBuilder(
    column: $table.valueKwh,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get meterType => $composableBuilder(
    column: $table.meterType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get costFcfa => $composableBuilder(
    column: $table.costFcfa,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$HousesTableFilterComposer get houseId {
    final $$HousesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.houseId,
      referencedTable: $db.houses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HousesTableFilterComposer(
            $db: $db,
            $table: $db.houses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ElectricityReadingsTableOrderingComposer
    extends Composer<_$AppDatabase, $ElectricityReadingsTable> {
  $$ElectricityReadingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get valueKwh => $composableBuilder(
    column: $table.valueKwh,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get meterType => $composableBuilder(
    column: $table.meterType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get costFcfa => $composableBuilder(
    column: $table.costFcfa,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$HousesTableOrderingComposer get houseId {
    final $$HousesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.houseId,
      referencedTable: $db.houses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HousesTableOrderingComposer(
            $db: $db,
            $table: $db.houses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ElectricityReadingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ElectricityReadingsTable> {
  $$ElectricityReadingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get valueKwh =>
      $composableBuilder(column: $table.valueKwh, builder: (column) => column);

  GeneratedColumn<String> get meterType =>
      $composableBuilder(column: $table.meterType, builder: (column) => column);

  GeneratedColumn<double> get costFcfa =>
      $composableBuilder(column: $table.costFcfa, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$HousesTableAnnotationComposer get houseId {
    final $$HousesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.houseId,
      referencedTable: $db.houses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HousesTableAnnotationComposer(
            $db: $db,
            $table: $db.houses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ElectricityReadingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ElectricityReadingsTable,
          ElectricityReading,
          $$ElectricityReadingsTableFilterComposer,
          $$ElectricityReadingsTableOrderingComposer,
          $$ElectricityReadingsTableAnnotationComposer,
          $$ElectricityReadingsTableCreateCompanionBuilder,
          $$ElectricityReadingsTableUpdateCompanionBuilder,
          (ElectricityReading, $$ElectricityReadingsTableReferences),
          ElectricityReading,
          PrefetchHooks Function({bool houseId})
        > {
  $$ElectricityReadingsTableTableManager(
    _$AppDatabase db,
    $ElectricityReadingsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ElectricityReadingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ElectricityReadingsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ElectricityReadingsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> houseId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<double> valueKwh = const Value.absent(),
                Value<String> meterType = const Value.absent(),
                Value<double?> costFcfa = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ElectricityReadingsCompanion(
                id: id,
                houseId: houseId,
                date: date,
                valueKwh: valueKwh,
                meterType: meterType,
                costFcfa: costFcfa,
                note: note,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String houseId,
                required DateTime date,
                required double valueKwh,
                required String meterType,
                Value<double?> costFcfa = const Value.absent(),
                Value<String?> note = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => ElectricityReadingsCompanion.insert(
                id: id,
                houseId: houseId,
                date: date,
                valueKwh: valueKwh,
                meterType: meterType,
                costFcfa: costFcfa,
                note: note,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ElectricityReadingsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({houseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (houseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.houseId,
                                referencedTable:
                                    $$ElectricityReadingsTableReferences
                                        ._houseIdTable(db),
                                referencedColumn:
                                    $$ElectricityReadingsTableReferences
                                        ._houseIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ElectricityReadingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ElectricityReadingsTable,
      ElectricityReading,
      $$ElectricityReadingsTableFilterComposer,
      $$ElectricityReadingsTableOrderingComposer,
      $$ElectricityReadingsTableAnnotationComposer,
      $$ElectricityReadingsTableCreateCompanionBuilder,
      $$ElectricityReadingsTableUpdateCompanionBuilder,
      (ElectricityReading, $$ElectricityReadingsTableReferences),
      ElectricityReading,
      PrefetchHooks Function({bool houseId})
    >;
typedef $$GasBottlesTableCreateCompanionBuilder =
    GasBottlesCompanion Function({
      required String id,
      required String houseId,
      required DateTime startDate,
      required String type,
      required double priceFcfa,
      Value<bool> isActive,
      Value<DateTime?> estimatedEndDate,
      Value<double?> percentRemaining,
      Value<String?> note,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$GasBottlesTableUpdateCompanionBuilder =
    GasBottlesCompanion Function({
      Value<String> id,
      Value<String> houseId,
      Value<DateTime> startDate,
      Value<String> type,
      Value<double> priceFcfa,
      Value<bool> isActive,
      Value<DateTime?> estimatedEndDate,
      Value<double?> percentRemaining,
      Value<String?> note,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$GasBottlesTableReferences
    extends BaseReferences<_$AppDatabase, $GasBottlesTable, GasBottle> {
  $$GasBottlesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $HousesTable _houseIdTable(_$AppDatabase db) => db.houses.createAlias(
    $_aliasNameGenerator(db.gasBottles.houseId, db.houses.id),
  );

  $$HousesTableProcessedTableManager get houseId {
    final $_column = $_itemColumn<String>('house_id')!;

    final manager = $$HousesTableTableManager(
      $_db,
      $_db.houses,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_houseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$GasBottlesTableFilterComposer
    extends Composer<_$AppDatabase, $GasBottlesTable> {
  $$GasBottlesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get priceFcfa => $composableBuilder(
    column: $table.priceFcfa,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get estimatedEndDate => $composableBuilder(
    column: $table.estimatedEndDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get percentRemaining => $composableBuilder(
    column: $table.percentRemaining,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$HousesTableFilterComposer get houseId {
    final $$HousesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.houseId,
      referencedTable: $db.houses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HousesTableFilterComposer(
            $db: $db,
            $table: $db.houses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GasBottlesTableOrderingComposer
    extends Composer<_$AppDatabase, $GasBottlesTable> {
  $$GasBottlesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get priceFcfa => $composableBuilder(
    column: $table.priceFcfa,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get estimatedEndDate => $composableBuilder(
    column: $table.estimatedEndDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get percentRemaining => $composableBuilder(
    column: $table.percentRemaining,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$HousesTableOrderingComposer get houseId {
    final $$HousesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.houseId,
      referencedTable: $db.houses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HousesTableOrderingComposer(
            $db: $db,
            $table: $db.houses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GasBottlesTableAnnotationComposer
    extends Composer<_$AppDatabase, $GasBottlesTable> {
  $$GasBottlesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get priceFcfa =>
      $composableBuilder(column: $table.priceFcfa, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get estimatedEndDate => $composableBuilder(
    column: $table.estimatedEndDate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get percentRemaining => $composableBuilder(
    column: $table.percentRemaining,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$HousesTableAnnotationComposer get houseId {
    final $$HousesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.houseId,
      referencedTable: $db.houses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HousesTableAnnotationComposer(
            $db: $db,
            $table: $db.houses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GasBottlesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GasBottlesTable,
          GasBottle,
          $$GasBottlesTableFilterComposer,
          $$GasBottlesTableOrderingComposer,
          $$GasBottlesTableAnnotationComposer,
          $$GasBottlesTableCreateCompanionBuilder,
          $$GasBottlesTableUpdateCompanionBuilder,
          (GasBottle, $$GasBottlesTableReferences),
          GasBottle,
          PrefetchHooks Function({bool houseId})
        > {
  $$GasBottlesTableTableManager(_$AppDatabase db, $GasBottlesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GasBottlesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GasBottlesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GasBottlesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> houseId = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<double> priceFcfa = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime?> estimatedEndDate = const Value.absent(),
                Value<double?> percentRemaining = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GasBottlesCompanion(
                id: id,
                houseId: houseId,
                startDate: startDate,
                type: type,
                priceFcfa: priceFcfa,
                isActive: isActive,
                estimatedEndDate: estimatedEndDate,
                percentRemaining: percentRemaining,
                note: note,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String houseId,
                required DateTime startDate,
                required String type,
                required double priceFcfa,
                Value<bool> isActive = const Value.absent(),
                Value<DateTime?> estimatedEndDate = const Value.absent(),
                Value<double?> percentRemaining = const Value.absent(),
                Value<String?> note = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => GasBottlesCompanion.insert(
                id: id,
                houseId: houseId,
                startDate: startDate,
                type: type,
                priceFcfa: priceFcfa,
                isActive: isActive,
                estimatedEndDate: estimatedEndDate,
                percentRemaining: percentRemaining,
                note: note,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$GasBottlesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({houseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (houseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.houseId,
                                referencedTable: $$GasBottlesTableReferences
                                    ._houseIdTable(db),
                                referencedColumn: $$GasBottlesTableReferences
                                    ._houseIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$GasBottlesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GasBottlesTable,
      GasBottle,
      $$GasBottlesTableFilterComposer,
      $$GasBottlesTableOrderingComposer,
      $$GasBottlesTableAnnotationComposer,
      $$GasBottlesTableCreateCompanionBuilder,
      $$GasBottlesTableUpdateCompanionBuilder,
      (GasBottle, $$GasBottlesTableReferences),
      GasBottle,
      PrefetchHooks Function({bool houseId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$HousesTableTableManager get houses =>
      $$HousesTableTableManager(_db, _db.houses);
  $$RoomsTableTableManager get rooms =>
      $$RoomsTableTableManager(_db, _db.rooms);
  $$DevicesTableTableManager get devices =>
      $$DevicesTableTableManager(_db, _db.devices);
  $$ElectricityReadingsTableTableManager get electricityReadings =>
      $$ElectricityReadingsTableTableManager(_db, _db.electricityReadings);
  $$GasBottlesTableTableManager get gasBottles =>
      $$GasBottlesTableTableManager(_db, _db.gasBottles);
}
