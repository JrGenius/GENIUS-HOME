// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'house.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$House {

 String get id; String get name; String? get photoPath; int get roomCount; int get inhabitants; MeterType get meterType; GasBottleType get preferredGasBottleType; double get electricityRateFcfaPerKwh; String? get address; double? get latitude; double? get longitude; double? get surfaceM2; String? get timezone; DateTime get createdAt; DateTime? get updatedAt;
/// Create a copy of House
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HouseCopyWith<House> get copyWith => _$HouseCopyWithImpl<House>(this as House, _$identity);

  /// Serializes this House to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is House&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath)&&(identical(other.roomCount, roomCount) || other.roomCount == roomCount)&&(identical(other.inhabitants, inhabitants) || other.inhabitants == inhabitants)&&(identical(other.meterType, meterType) || other.meterType == meterType)&&(identical(other.preferredGasBottleType, preferredGasBottleType) || other.preferredGasBottleType == preferredGasBottleType)&&(identical(other.electricityRateFcfaPerKwh, electricityRateFcfaPerKwh) || other.electricityRateFcfaPerKwh == electricityRateFcfaPerKwh)&&(identical(other.address, address) || other.address == address)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.surfaceM2, surfaceM2) || other.surfaceM2 == surfaceM2)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,photoPath,roomCount,inhabitants,meterType,preferredGasBottleType,electricityRateFcfaPerKwh,address,latitude,longitude,surfaceM2,timezone,createdAt,updatedAt);

@override
String toString() {
  return 'House(id: $id, name: $name, photoPath: $photoPath, roomCount: $roomCount, inhabitants: $inhabitants, meterType: $meterType, preferredGasBottleType: $preferredGasBottleType, electricityRateFcfaPerKwh: $electricityRateFcfaPerKwh, address: $address, latitude: $latitude, longitude: $longitude, surfaceM2: $surfaceM2, timezone: $timezone, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $HouseCopyWith<$Res>  {
  factory $HouseCopyWith(House value, $Res Function(House) _then) = _$HouseCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? photoPath, int roomCount, int inhabitants, MeterType meterType, GasBottleType preferredGasBottleType, double electricityRateFcfaPerKwh, String? address, double? latitude, double? longitude, double? surfaceM2, String? timezone, DateTime createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$HouseCopyWithImpl<$Res>
    implements $HouseCopyWith<$Res> {
  _$HouseCopyWithImpl(this._self, this._then);

  final House _self;
  final $Res Function(House) _then;

/// Create a copy of House
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? photoPath = freezed,Object? roomCount = null,Object? inhabitants = null,Object? meterType = null,Object? preferredGasBottleType = null,Object? electricityRateFcfaPerKwh = null,Object? address = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? surfaceM2 = freezed,Object? timezone = freezed,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,roomCount: null == roomCount ? _self.roomCount : roomCount // ignore: cast_nullable_to_non_nullable
as int,inhabitants: null == inhabitants ? _self.inhabitants : inhabitants // ignore: cast_nullable_to_non_nullable
as int,meterType: null == meterType ? _self.meterType : meterType // ignore: cast_nullable_to_non_nullable
as MeterType,preferredGasBottleType: null == preferredGasBottleType ? _self.preferredGasBottleType : preferredGasBottleType // ignore: cast_nullable_to_non_nullable
as GasBottleType,electricityRateFcfaPerKwh: null == electricityRateFcfaPerKwh ? _self.electricityRateFcfaPerKwh : electricityRateFcfaPerKwh // ignore: cast_nullable_to_non_nullable
as double,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,surfaceM2: freezed == surfaceM2 ? _self.surfaceM2 : surfaceM2 // ignore: cast_nullable_to_non_nullable
as double?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [House].
extension HousePatterns on House {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _House value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _House() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _House value)  $default,){
final _that = this;
switch (_that) {
case _House():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _House value)?  $default,){
final _that = this;
switch (_that) {
case _House() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? photoPath,  int roomCount,  int inhabitants,  MeterType meterType,  GasBottleType preferredGasBottleType,  double electricityRateFcfaPerKwh,  String? address,  double? latitude,  double? longitude,  double? surfaceM2,  String? timezone,  DateTime createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _House() when $default != null:
return $default(_that.id,_that.name,_that.photoPath,_that.roomCount,_that.inhabitants,_that.meterType,_that.preferredGasBottleType,_that.electricityRateFcfaPerKwh,_that.address,_that.latitude,_that.longitude,_that.surfaceM2,_that.timezone,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? photoPath,  int roomCount,  int inhabitants,  MeterType meterType,  GasBottleType preferredGasBottleType,  double electricityRateFcfaPerKwh,  String? address,  double? latitude,  double? longitude,  double? surfaceM2,  String? timezone,  DateTime createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _House():
return $default(_that.id,_that.name,_that.photoPath,_that.roomCount,_that.inhabitants,_that.meterType,_that.preferredGasBottleType,_that.electricityRateFcfaPerKwh,_that.address,_that.latitude,_that.longitude,_that.surfaceM2,_that.timezone,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? photoPath,  int roomCount,  int inhabitants,  MeterType meterType,  GasBottleType preferredGasBottleType,  double electricityRateFcfaPerKwh,  String? address,  double? latitude,  double? longitude,  double? surfaceM2,  String? timezone,  DateTime createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _House() when $default != null:
return $default(_that.id,_that.name,_that.photoPath,_that.roomCount,_that.inhabitants,_that.meterType,_that.preferredGasBottleType,_that.electricityRateFcfaPerKwh,_that.address,_that.latitude,_that.longitude,_that.surfaceM2,_that.timezone,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _House implements House {
  const _House({required this.id, required this.name, this.photoPath, this.roomCount = 4, this.inhabitants = 4, this.meterType = MeterType.prepaid, this.preferredGasBottleType = GasBottleType.kg12, this.electricityRateFcfaPerKwh = AppConstants.defaultElectricityRate, this.address, this.latitude, this.longitude, this.surfaceM2, this.timezone, required this.createdAt, this.updatedAt});
  factory _House.fromJson(Map<String, dynamic> json) => _$HouseFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? photoPath;
@override@JsonKey() final  int roomCount;
@override@JsonKey() final  int inhabitants;
@override@JsonKey() final  MeterType meterType;
@override@JsonKey() final  GasBottleType preferredGasBottleType;
@override@JsonKey() final  double electricityRateFcfaPerKwh;
@override final  String? address;
@override final  double? latitude;
@override final  double? longitude;
@override final  double? surfaceM2;
@override final  String? timezone;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of House
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HouseCopyWith<_House> get copyWith => __$HouseCopyWithImpl<_House>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HouseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _House&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath)&&(identical(other.roomCount, roomCount) || other.roomCount == roomCount)&&(identical(other.inhabitants, inhabitants) || other.inhabitants == inhabitants)&&(identical(other.meterType, meterType) || other.meterType == meterType)&&(identical(other.preferredGasBottleType, preferredGasBottleType) || other.preferredGasBottleType == preferredGasBottleType)&&(identical(other.electricityRateFcfaPerKwh, electricityRateFcfaPerKwh) || other.electricityRateFcfaPerKwh == electricityRateFcfaPerKwh)&&(identical(other.address, address) || other.address == address)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.surfaceM2, surfaceM2) || other.surfaceM2 == surfaceM2)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,photoPath,roomCount,inhabitants,meterType,preferredGasBottleType,electricityRateFcfaPerKwh,address,latitude,longitude,surfaceM2,timezone,createdAt,updatedAt);

@override
String toString() {
  return 'House(id: $id, name: $name, photoPath: $photoPath, roomCount: $roomCount, inhabitants: $inhabitants, meterType: $meterType, preferredGasBottleType: $preferredGasBottleType, electricityRateFcfaPerKwh: $electricityRateFcfaPerKwh, address: $address, latitude: $latitude, longitude: $longitude, surfaceM2: $surfaceM2, timezone: $timezone, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$HouseCopyWith<$Res> implements $HouseCopyWith<$Res> {
  factory _$HouseCopyWith(_House value, $Res Function(_House) _then) = __$HouseCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? photoPath, int roomCount, int inhabitants, MeterType meterType, GasBottleType preferredGasBottleType, double electricityRateFcfaPerKwh, String? address, double? latitude, double? longitude, double? surfaceM2, String? timezone, DateTime createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$HouseCopyWithImpl<$Res>
    implements _$HouseCopyWith<$Res> {
  __$HouseCopyWithImpl(this._self, this._then);

  final _House _self;
  final $Res Function(_House) _then;

/// Create a copy of House
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? photoPath = freezed,Object? roomCount = null,Object? inhabitants = null,Object? meterType = null,Object? preferredGasBottleType = null,Object? electricityRateFcfaPerKwh = null,Object? address = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? surfaceM2 = freezed,Object? timezone = freezed,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_House(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,roomCount: null == roomCount ? _self.roomCount : roomCount // ignore: cast_nullable_to_non_nullable
as int,inhabitants: null == inhabitants ? _self.inhabitants : inhabitants // ignore: cast_nullable_to_non_nullable
as int,meterType: null == meterType ? _self.meterType : meterType // ignore: cast_nullable_to_non_nullable
as MeterType,preferredGasBottleType: null == preferredGasBottleType ? _self.preferredGasBottleType : preferredGasBottleType // ignore: cast_nullable_to_non_nullable
as GasBottleType,electricityRateFcfaPerKwh: null == electricityRateFcfaPerKwh ? _self.electricityRateFcfaPerKwh : electricityRateFcfaPerKwh // ignore: cast_nullable_to_non_nullable
as double,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,surfaceM2: freezed == surfaceM2 ? _self.surfaceM2 : surfaceM2 // ignore: cast_nullable_to_non_nullable
as double?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
