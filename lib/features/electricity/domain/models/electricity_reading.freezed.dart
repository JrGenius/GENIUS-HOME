// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'electricity_reading.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ElectricityReading {

 String get id; String get houseId; DateTime get date; double get valueKwh; MeterType get meterType; double? get costFcfa; String? get note; DateTime get createdAt;
/// Create a copy of ElectricityReading
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricityReadingCopyWith<ElectricityReading> get copyWith => _$ElectricityReadingCopyWithImpl<ElectricityReading>(this as ElectricityReading, _$identity);

  /// Serializes this ElectricityReading to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricityReading&&(identical(other.id, id) || other.id == id)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.date, date) || other.date == date)&&(identical(other.valueKwh, valueKwh) || other.valueKwh == valueKwh)&&(identical(other.meterType, meterType) || other.meterType == meterType)&&(identical(other.costFcfa, costFcfa) || other.costFcfa == costFcfa)&&(identical(other.note, note) || other.note == note)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,houseId,date,valueKwh,meterType,costFcfa,note,createdAt);

@override
String toString() {
  return 'ElectricityReading(id: $id, houseId: $houseId, date: $date, valueKwh: $valueKwh, meterType: $meterType, costFcfa: $costFcfa, note: $note, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ElectricityReadingCopyWith<$Res>  {
  factory $ElectricityReadingCopyWith(ElectricityReading value, $Res Function(ElectricityReading) _then) = _$ElectricityReadingCopyWithImpl;
@useResult
$Res call({
 String id, String houseId, DateTime date, double valueKwh, MeterType meterType, double? costFcfa, String? note, DateTime createdAt
});




}
/// @nodoc
class _$ElectricityReadingCopyWithImpl<$Res>
    implements $ElectricityReadingCopyWith<$Res> {
  _$ElectricityReadingCopyWithImpl(this._self, this._then);

  final ElectricityReading _self;
  final $Res Function(ElectricityReading) _then;

/// Create a copy of ElectricityReading
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? houseId = null,Object? date = null,Object? valueKwh = null,Object? meterType = null,Object? costFcfa = freezed,Object? note = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,valueKwh: null == valueKwh ? _self.valueKwh : valueKwh // ignore: cast_nullable_to_non_nullable
as double,meterType: null == meterType ? _self.meterType : meterType // ignore: cast_nullable_to_non_nullable
as MeterType,costFcfa: freezed == costFcfa ? _self.costFcfa : costFcfa // ignore: cast_nullable_to_non_nullable
as double?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ElectricityReading].
extension ElectricityReadingPatterns on ElectricityReading {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ElectricityReading value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ElectricityReading() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ElectricityReading value)  $default,){
final _that = this;
switch (_that) {
case _ElectricityReading():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ElectricityReading value)?  $default,){
final _that = this;
switch (_that) {
case _ElectricityReading() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String houseId,  DateTime date,  double valueKwh,  MeterType meterType,  double? costFcfa,  String? note,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ElectricityReading() when $default != null:
return $default(_that.id,_that.houseId,_that.date,_that.valueKwh,_that.meterType,_that.costFcfa,_that.note,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String houseId,  DateTime date,  double valueKwh,  MeterType meterType,  double? costFcfa,  String? note,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ElectricityReading():
return $default(_that.id,_that.houseId,_that.date,_that.valueKwh,_that.meterType,_that.costFcfa,_that.note,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String houseId,  DateTime date,  double valueKwh,  MeterType meterType,  double? costFcfa,  String? note,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ElectricityReading() when $default != null:
return $default(_that.id,_that.houseId,_that.date,_that.valueKwh,_that.meterType,_that.costFcfa,_that.note,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ElectricityReading implements ElectricityReading {
  const _ElectricityReading({required this.id, required this.houseId, required this.date, required this.valueKwh, required this.meterType, this.costFcfa, this.note, required this.createdAt});
  factory _ElectricityReading.fromJson(Map<String, dynamic> json) => _$ElectricityReadingFromJson(json);

@override final  String id;
@override final  String houseId;
@override final  DateTime date;
@override final  double valueKwh;
@override final  MeterType meterType;
@override final  double? costFcfa;
@override final  String? note;
@override final  DateTime createdAt;

/// Create a copy of ElectricityReading
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ElectricityReadingCopyWith<_ElectricityReading> get copyWith => __$ElectricityReadingCopyWithImpl<_ElectricityReading>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ElectricityReadingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ElectricityReading&&(identical(other.id, id) || other.id == id)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.date, date) || other.date == date)&&(identical(other.valueKwh, valueKwh) || other.valueKwh == valueKwh)&&(identical(other.meterType, meterType) || other.meterType == meterType)&&(identical(other.costFcfa, costFcfa) || other.costFcfa == costFcfa)&&(identical(other.note, note) || other.note == note)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,houseId,date,valueKwh,meterType,costFcfa,note,createdAt);

@override
String toString() {
  return 'ElectricityReading(id: $id, houseId: $houseId, date: $date, valueKwh: $valueKwh, meterType: $meterType, costFcfa: $costFcfa, note: $note, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ElectricityReadingCopyWith<$Res> implements $ElectricityReadingCopyWith<$Res> {
  factory _$ElectricityReadingCopyWith(_ElectricityReading value, $Res Function(_ElectricityReading) _then) = __$ElectricityReadingCopyWithImpl;
@override @useResult
$Res call({
 String id, String houseId, DateTime date, double valueKwh, MeterType meterType, double? costFcfa, String? note, DateTime createdAt
});




}
/// @nodoc
class __$ElectricityReadingCopyWithImpl<$Res>
    implements _$ElectricityReadingCopyWith<$Res> {
  __$ElectricityReadingCopyWithImpl(this._self, this._then);

  final _ElectricityReading _self;
  final $Res Function(_ElectricityReading) _then;

/// Create a copy of ElectricityReading
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? houseId = null,Object? date = null,Object? valueKwh = null,Object? meterType = null,Object? costFcfa = freezed,Object? note = freezed,Object? createdAt = null,}) {
  return _then(_ElectricityReading(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,valueKwh: null == valueKwh ? _self.valueKwh : valueKwh // ignore: cast_nullable_to_non_nullable
as double,meterType: null == meterType ? _self.meterType : meterType // ignore: cast_nullable_to_non_nullable
as MeterType,costFcfa: freezed == costFcfa ? _self.costFcfa : costFcfa // ignore: cast_nullable_to_non_nullable
as double?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
