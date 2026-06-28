// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gas_bottle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GasBottle {

 String get id; String get houseId; DateTime get startDate; GasBottleType get type; double get priceFcfa; bool get isActive; DateTime? get estimatedEndDate; double? get percentRemaining; String? get note; DateTime get createdAt;
/// Create a copy of GasBottle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GasBottleCopyWith<GasBottle> get copyWith => _$GasBottleCopyWithImpl<GasBottle>(this as GasBottle, _$identity);

  /// Serializes this GasBottle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GasBottle&&(identical(other.id, id) || other.id == id)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.type, type) || other.type == type)&&(identical(other.priceFcfa, priceFcfa) || other.priceFcfa == priceFcfa)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.estimatedEndDate, estimatedEndDate) || other.estimatedEndDate == estimatedEndDate)&&(identical(other.percentRemaining, percentRemaining) || other.percentRemaining == percentRemaining)&&(identical(other.note, note) || other.note == note)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,houseId,startDate,type,priceFcfa,isActive,estimatedEndDate,percentRemaining,note,createdAt);

@override
String toString() {
  return 'GasBottle(id: $id, houseId: $houseId, startDate: $startDate, type: $type, priceFcfa: $priceFcfa, isActive: $isActive, estimatedEndDate: $estimatedEndDate, percentRemaining: $percentRemaining, note: $note, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $GasBottleCopyWith<$Res>  {
  factory $GasBottleCopyWith(GasBottle value, $Res Function(GasBottle) _then) = _$GasBottleCopyWithImpl;
@useResult
$Res call({
 String id, String houseId, DateTime startDate, GasBottleType type, double priceFcfa, bool isActive, DateTime? estimatedEndDate, double? percentRemaining, String? note, DateTime createdAt
});




}
/// @nodoc
class _$GasBottleCopyWithImpl<$Res>
    implements $GasBottleCopyWith<$Res> {
  _$GasBottleCopyWithImpl(this._self, this._then);

  final GasBottle _self;
  final $Res Function(GasBottle) _then;

/// Create a copy of GasBottle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? houseId = null,Object? startDate = null,Object? type = null,Object? priceFcfa = null,Object? isActive = null,Object? estimatedEndDate = freezed,Object? percentRemaining = freezed,Object? note = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as GasBottleType,priceFcfa: null == priceFcfa ? _self.priceFcfa : priceFcfa // ignore: cast_nullable_to_non_nullable
as double,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,estimatedEndDate: freezed == estimatedEndDate ? _self.estimatedEndDate : estimatedEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,percentRemaining: freezed == percentRemaining ? _self.percentRemaining : percentRemaining // ignore: cast_nullable_to_non_nullable
as double?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [GasBottle].
extension GasBottlePatterns on GasBottle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GasBottle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GasBottle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GasBottle value)  $default,){
final _that = this;
switch (_that) {
case _GasBottle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GasBottle value)?  $default,){
final _that = this;
switch (_that) {
case _GasBottle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String houseId,  DateTime startDate,  GasBottleType type,  double priceFcfa,  bool isActive,  DateTime? estimatedEndDate,  double? percentRemaining,  String? note,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GasBottle() when $default != null:
return $default(_that.id,_that.houseId,_that.startDate,_that.type,_that.priceFcfa,_that.isActive,_that.estimatedEndDate,_that.percentRemaining,_that.note,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String houseId,  DateTime startDate,  GasBottleType type,  double priceFcfa,  bool isActive,  DateTime? estimatedEndDate,  double? percentRemaining,  String? note,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _GasBottle():
return $default(_that.id,_that.houseId,_that.startDate,_that.type,_that.priceFcfa,_that.isActive,_that.estimatedEndDate,_that.percentRemaining,_that.note,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String houseId,  DateTime startDate,  GasBottleType type,  double priceFcfa,  bool isActive,  DateTime? estimatedEndDate,  double? percentRemaining,  String? note,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _GasBottle() when $default != null:
return $default(_that.id,_that.houseId,_that.startDate,_that.type,_that.priceFcfa,_that.isActive,_that.estimatedEndDate,_that.percentRemaining,_that.note,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GasBottle implements GasBottle {
  const _GasBottle({required this.id, required this.houseId, required this.startDate, required this.type, required this.priceFcfa, this.isActive = true, this.estimatedEndDate, this.percentRemaining, this.note, required this.createdAt});
  factory _GasBottle.fromJson(Map<String, dynamic> json) => _$GasBottleFromJson(json);

@override final  String id;
@override final  String houseId;
@override final  DateTime startDate;
@override final  GasBottleType type;
@override final  double priceFcfa;
@override@JsonKey() final  bool isActive;
@override final  DateTime? estimatedEndDate;
@override final  double? percentRemaining;
@override final  String? note;
@override final  DateTime createdAt;

/// Create a copy of GasBottle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GasBottleCopyWith<_GasBottle> get copyWith => __$GasBottleCopyWithImpl<_GasBottle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GasBottleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GasBottle&&(identical(other.id, id) || other.id == id)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.type, type) || other.type == type)&&(identical(other.priceFcfa, priceFcfa) || other.priceFcfa == priceFcfa)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.estimatedEndDate, estimatedEndDate) || other.estimatedEndDate == estimatedEndDate)&&(identical(other.percentRemaining, percentRemaining) || other.percentRemaining == percentRemaining)&&(identical(other.note, note) || other.note == note)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,houseId,startDate,type,priceFcfa,isActive,estimatedEndDate,percentRemaining,note,createdAt);

@override
String toString() {
  return 'GasBottle(id: $id, houseId: $houseId, startDate: $startDate, type: $type, priceFcfa: $priceFcfa, isActive: $isActive, estimatedEndDate: $estimatedEndDate, percentRemaining: $percentRemaining, note: $note, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$GasBottleCopyWith<$Res> implements $GasBottleCopyWith<$Res> {
  factory _$GasBottleCopyWith(_GasBottle value, $Res Function(_GasBottle) _then) = __$GasBottleCopyWithImpl;
@override @useResult
$Res call({
 String id, String houseId, DateTime startDate, GasBottleType type, double priceFcfa, bool isActive, DateTime? estimatedEndDate, double? percentRemaining, String? note, DateTime createdAt
});




}
/// @nodoc
class __$GasBottleCopyWithImpl<$Res>
    implements _$GasBottleCopyWith<$Res> {
  __$GasBottleCopyWithImpl(this._self, this._then);

  final _GasBottle _self;
  final $Res Function(_GasBottle) _then;

/// Create a copy of GasBottle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? houseId = null,Object? startDate = null,Object? type = null,Object? priceFcfa = null,Object? isActive = null,Object? estimatedEndDate = freezed,Object? percentRemaining = freezed,Object? note = freezed,Object? createdAt = null,}) {
  return _then(_GasBottle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as GasBottleType,priceFcfa: null == priceFcfa ? _self.priceFcfa : priceFcfa // ignore: cast_nullable_to_non_nullable
as double,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,estimatedEndDate: freezed == estimatedEndDate ? _self.estimatedEndDate : estimatedEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,percentRemaining: freezed == percentRemaining ? _self.percentRemaining : percentRemaining // ignore: cast_nullable_to_non_nullable
as double?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
