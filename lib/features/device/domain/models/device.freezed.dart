// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Device {

 String get id; String get roomId; String get name; String? get brand; String? get model; String? get photoPath; DeviceCategory get category; double get powerWatts; double get avgConsumptionKwh; double get avgUsageHoursPerDay; double get standbyWatts; double get estimatedMonthlyCostFcfa; bool get isActive; DateTime get createdAt;
/// Create a copy of Device
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceCopyWith<Device> get copyWith => _$DeviceCopyWithImpl<Device>(this as Device, _$identity);

  /// Serializes this Device to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Device&&(identical(other.id, id) || other.id == id)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.name, name) || other.name == name)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath)&&(identical(other.category, category) || other.category == category)&&(identical(other.powerWatts, powerWatts) || other.powerWatts == powerWatts)&&(identical(other.avgConsumptionKwh, avgConsumptionKwh) || other.avgConsumptionKwh == avgConsumptionKwh)&&(identical(other.avgUsageHoursPerDay, avgUsageHoursPerDay) || other.avgUsageHoursPerDay == avgUsageHoursPerDay)&&(identical(other.standbyWatts, standbyWatts) || other.standbyWatts == standbyWatts)&&(identical(other.estimatedMonthlyCostFcfa, estimatedMonthlyCostFcfa) || other.estimatedMonthlyCostFcfa == estimatedMonthlyCostFcfa)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,roomId,name,brand,model,photoPath,category,powerWatts,avgConsumptionKwh,avgUsageHoursPerDay,standbyWatts,estimatedMonthlyCostFcfa,isActive,createdAt);

@override
String toString() {
  return 'Device(id: $id, roomId: $roomId, name: $name, brand: $brand, model: $model, photoPath: $photoPath, category: $category, powerWatts: $powerWatts, avgConsumptionKwh: $avgConsumptionKwh, avgUsageHoursPerDay: $avgUsageHoursPerDay, standbyWatts: $standbyWatts, estimatedMonthlyCostFcfa: $estimatedMonthlyCostFcfa, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $DeviceCopyWith<$Res>  {
  factory $DeviceCopyWith(Device value, $Res Function(Device) _then) = _$DeviceCopyWithImpl;
@useResult
$Res call({
 String id, String roomId, String name, String? brand, String? model, String? photoPath, DeviceCategory category, double powerWatts, double avgConsumptionKwh, double avgUsageHoursPerDay, double standbyWatts, double estimatedMonthlyCostFcfa, bool isActive, DateTime createdAt
});




}
/// @nodoc
class _$DeviceCopyWithImpl<$Res>
    implements $DeviceCopyWith<$Res> {
  _$DeviceCopyWithImpl(this._self, this._then);

  final Device _self;
  final $Res Function(Device) _then;

/// Create a copy of Device
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? roomId = null,Object? name = null,Object? brand = freezed,Object? model = freezed,Object? photoPath = freezed,Object? category = null,Object? powerWatts = null,Object? avgConsumptionKwh = null,Object? avgUsageHoursPerDay = null,Object? standbyWatts = null,Object? estimatedMonthlyCostFcfa = null,Object? isActive = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as DeviceCategory,powerWatts: null == powerWatts ? _self.powerWatts : powerWatts // ignore: cast_nullable_to_non_nullable
as double,avgConsumptionKwh: null == avgConsumptionKwh ? _self.avgConsumptionKwh : avgConsumptionKwh // ignore: cast_nullable_to_non_nullable
as double,avgUsageHoursPerDay: null == avgUsageHoursPerDay ? _self.avgUsageHoursPerDay : avgUsageHoursPerDay // ignore: cast_nullable_to_non_nullable
as double,standbyWatts: null == standbyWatts ? _self.standbyWatts : standbyWatts // ignore: cast_nullable_to_non_nullable
as double,estimatedMonthlyCostFcfa: null == estimatedMonthlyCostFcfa ? _self.estimatedMonthlyCostFcfa : estimatedMonthlyCostFcfa // ignore: cast_nullable_to_non_nullable
as double,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Device].
extension DevicePatterns on Device {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Device value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Device() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Device value)  $default,){
final _that = this;
switch (_that) {
case _Device():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Device value)?  $default,){
final _that = this;
switch (_that) {
case _Device() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String roomId,  String name,  String? brand,  String? model,  String? photoPath,  DeviceCategory category,  double powerWatts,  double avgConsumptionKwh,  double avgUsageHoursPerDay,  double standbyWatts,  double estimatedMonthlyCostFcfa,  bool isActive,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Device() when $default != null:
return $default(_that.id,_that.roomId,_that.name,_that.brand,_that.model,_that.photoPath,_that.category,_that.powerWatts,_that.avgConsumptionKwh,_that.avgUsageHoursPerDay,_that.standbyWatts,_that.estimatedMonthlyCostFcfa,_that.isActive,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String roomId,  String name,  String? brand,  String? model,  String? photoPath,  DeviceCategory category,  double powerWatts,  double avgConsumptionKwh,  double avgUsageHoursPerDay,  double standbyWatts,  double estimatedMonthlyCostFcfa,  bool isActive,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _Device():
return $default(_that.id,_that.roomId,_that.name,_that.brand,_that.model,_that.photoPath,_that.category,_that.powerWatts,_that.avgConsumptionKwh,_that.avgUsageHoursPerDay,_that.standbyWatts,_that.estimatedMonthlyCostFcfa,_that.isActive,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String roomId,  String name,  String? brand,  String? model,  String? photoPath,  DeviceCategory category,  double powerWatts,  double avgConsumptionKwh,  double avgUsageHoursPerDay,  double standbyWatts,  double estimatedMonthlyCostFcfa,  bool isActive,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Device() when $default != null:
return $default(_that.id,_that.roomId,_that.name,_that.brand,_that.model,_that.photoPath,_that.category,_that.powerWatts,_that.avgConsumptionKwh,_that.avgUsageHoursPerDay,_that.standbyWatts,_that.estimatedMonthlyCostFcfa,_that.isActive,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Device implements Device {
  const _Device({required this.id, required this.roomId, required this.name, this.brand, this.model, this.photoPath, required this.category, required this.powerWatts, this.avgConsumptionKwh = 0, this.avgUsageHoursPerDay = 0, this.standbyWatts = 0, this.estimatedMonthlyCostFcfa = 0, this.isActive = true, required this.createdAt});
  factory _Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

@override final  String id;
@override final  String roomId;
@override final  String name;
@override final  String? brand;
@override final  String? model;
@override final  String? photoPath;
@override final  DeviceCategory category;
@override final  double powerWatts;
@override@JsonKey() final  double avgConsumptionKwh;
@override@JsonKey() final  double avgUsageHoursPerDay;
@override@JsonKey() final  double standbyWatts;
@override@JsonKey() final  double estimatedMonthlyCostFcfa;
@override@JsonKey() final  bool isActive;
@override final  DateTime createdAt;

/// Create a copy of Device
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceCopyWith<_Device> get copyWith => __$DeviceCopyWithImpl<_Device>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Device&&(identical(other.id, id) || other.id == id)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.name, name) || other.name == name)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath)&&(identical(other.category, category) || other.category == category)&&(identical(other.powerWatts, powerWatts) || other.powerWatts == powerWatts)&&(identical(other.avgConsumptionKwh, avgConsumptionKwh) || other.avgConsumptionKwh == avgConsumptionKwh)&&(identical(other.avgUsageHoursPerDay, avgUsageHoursPerDay) || other.avgUsageHoursPerDay == avgUsageHoursPerDay)&&(identical(other.standbyWatts, standbyWatts) || other.standbyWatts == standbyWatts)&&(identical(other.estimatedMonthlyCostFcfa, estimatedMonthlyCostFcfa) || other.estimatedMonthlyCostFcfa == estimatedMonthlyCostFcfa)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,roomId,name,brand,model,photoPath,category,powerWatts,avgConsumptionKwh,avgUsageHoursPerDay,standbyWatts,estimatedMonthlyCostFcfa,isActive,createdAt);

@override
String toString() {
  return 'Device(id: $id, roomId: $roomId, name: $name, brand: $brand, model: $model, photoPath: $photoPath, category: $category, powerWatts: $powerWatts, avgConsumptionKwh: $avgConsumptionKwh, avgUsageHoursPerDay: $avgUsageHoursPerDay, standbyWatts: $standbyWatts, estimatedMonthlyCostFcfa: $estimatedMonthlyCostFcfa, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$DeviceCopyWith<$Res> implements $DeviceCopyWith<$Res> {
  factory _$DeviceCopyWith(_Device value, $Res Function(_Device) _then) = __$DeviceCopyWithImpl;
@override @useResult
$Res call({
 String id, String roomId, String name, String? brand, String? model, String? photoPath, DeviceCategory category, double powerWatts, double avgConsumptionKwh, double avgUsageHoursPerDay, double standbyWatts, double estimatedMonthlyCostFcfa, bool isActive, DateTime createdAt
});




}
/// @nodoc
class __$DeviceCopyWithImpl<$Res>
    implements _$DeviceCopyWith<$Res> {
  __$DeviceCopyWithImpl(this._self, this._then);

  final _Device _self;
  final $Res Function(_Device) _then;

/// Create a copy of Device
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? roomId = null,Object? name = null,Object? brand = freezed,Object? model = freezed,Object? photoPath = freezed,Object? category = null,Object? powerWatts = null,Object? avgConsumptionKwh = null,Object? avgUsageHoursPerDay = null,Object? standbyWatts = null,Object? estimatedMonthlyCostFcfa = null,Object? isActive = null,Object? createdAt = null,}) {
  return _then(_Device(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as DeviceCategory,powerWatts: null == powerWatts ? _self.powerWatts : powerWatts // ignore: cast_nullable_to_non_nullable
as double,avgConsumptionKwh: null == avgConsumptionKwh ? _self.avgConsumptionKwh : avgConsumptionKwh // ignore: cast_nullable_to_non_nullable
as double,avgUsageHoursPerDay: null == avgUsageHoursPerDay ? _self.avgUsageHoursPerDay : avgUsageHoursPerDay // ignore: cast_nullable_to_non_nullable
as double,standbyWatts: null == standbyWatts ? _self.standbyWatts : standbyWatts // ignore: cast_nullable_to_non_nullable
as double,estimatedMonthlyCostFcfa: null == estimatedMonthlyCostFcfa ? _self.estimatedMonthlyCostFcfa : estimatedMonthlyCostFcfa // ignore: cast_nullable_to_non_nullable
as double,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
