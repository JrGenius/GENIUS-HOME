// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppSettings {

 bool get onboardingCompleted; String get themeMode; String get locale; double get electricityRateFcfa; String? get userName; String? get currentHouseId;
/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsCopyWith<AppSettings> get copyWith => _$AppSettingsCopyWithImpl<AppSettings>(this as AppSettings, _$identity);

  /// Serializes this AppSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettings&&(identical(other.onboardingCompleted, onboardingCompleted) || other.onboardingCompleted == onboardingCompleted)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.electricityRateFcfa, electricityRateFcfa) || other.electricityRateFcfa == electricityRateFcfa)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.currentHouseId, currentHouseId) || other.currentHouseId == currentHouseId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,onboardingCompleted,themeMode,locale,electricityRateFcfa,userName,currentHouseId);

@override
String toString() {
  return 'AppSettings(onboardingCompleted: $onboardingCompleted, themeMode: $themeMode, locale: $locale, electricityRateFcfa: $electricityRateFcfa, userName: $userName, currentHouseId: $currentHouseId)';
}


}

/// @nodoc
abstract mixin class $AppSettingsCopyWith<$Res>  {
  factory $AppSettingsCopyWith(AppSettings value, $Res Function(AppSettings) _then) = _$AppSettingsCopyWithImpl;
@useResult
$Res call({
 bool onboardingCompleted, String themeMode, String locale, double electricityRateFcfa, String? userName, String? currentHouseId
});




}
/// @nodoc
class _$AppSettingsCopyWithImpl<$Res>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._self, this._then);

  final AppSettings _self;
  final $Res Function(AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? onboardingCompleted = null,Object? themeMode = null,Object? locale = null,Object? electricityRateFcfa = null,Object? userName = freezed,Object? currentHouseId = freezed,}) {
  return _then(_self.copyWith(
onboardingCompleted: null == onboardingCompleted ? _self.onboardingCompleted : onboardingCompleted // ignore: cast_nullable_to_non_nullable
as bool,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,electricityRateFcfa: null == electricityRateFcfa ? _self.electricityRateFcfa : electricityRateFcfa // ignore: cast_nullable_to_non_nullable
as double,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,currentHouseId: freezed == currentHouseId ? _self.currentHouseId : currentHouseId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppSettings].
extension AppSettingsPatterns on AppSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppSettings value)  $default,){
final _that = this;
switch (_that) {
case _AppSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppSettings value)?  $default,){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool onboardingCompleted,  String themeMode,  String locale,  double electricityRateFcfa,  String? userName,  String? currentHouseId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.onboardingCompleted,_that.themeMode,_that.locale,_that.electricityRateFcfa,_that.userName,_that.currentHouseId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool onboardingCompleted,  String themeMode,  String locale,  double electricityRateFcfa,  String? userName,  String? currentHouseId)  $default,) {final _that = this;
switch (_that) {
case _AppSettings():
return $default(_that.onboardingCompleted,_that.themeMode,_that.locale,_that.electricityRateFcfa,_that.userName,_that.currentHouseId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool onboardingCompleted,  String themeMode,  String locale,  double electricityRateFcfa,  String? userName,  String? currentHouseId)?  $default,) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.onboardingCompleted,_that.themeMode,_that.locale,_that.electricityRateFcfa,_that.userName,_that.currentHouseId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppSettings implements AppSettings {
  const _AppSettings({this.onboardingCompleted = false, this.themeMode = 'system', this.locale = 'fr', this.electricityRateFcfa = 99.0, this.userName, this.currentHouseId});
  factory _AppSettings.fromJson(Map<String, dynamic> json) => _$AppSettingsFromJson(json);

@override@JsonKey() final  bool onboardingCompleted;
@override@JsonKey() final  String themeMode;
@override@JsonKey() final  String locale;
@override@JsonKey() final  double electricityRateFcfa;
@override final  String? userName;
@override final  String? currentHouseId;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSettingsCopyWith<_AppSettings> get copyWith => __$AppSettingsCopyWithImpl<_AppSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettings&&(identical(other.onboardingCompleted, onboardingCompleted) || other.onboardingCompleted == onboardingCompleted)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.electricityRateFcfa, electricityRateFcfa) || other.electricityRateFcfa == electricityRateFcfa)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.currentHouseId, currentHouseId) || other.currentHouseId == currentHouseId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,onboardingCompleted,themeMode,locale,electricityRateFcfa,userName,currentHouseId);

@override
String toString() {
  return 'AppSettings(onboardingCompleted: $onboardingCompleted, themeMode: $themeMode, locale: $locale, electricityRateFcfa: $electricityRateFcfa, userName: $userName, currentHouseId: $currentHouseId)';
}


}

/// @nodoc
abstract mixin class _$AppSettingsCopyWith<$Res> implements $AppSettingsCopyWith<$Res> {
  factory _$AppSettingsCopyWith(_AppSettings value, $Res Function(_AppSettings) _then) = __$AppSettingsCopyWithImpl;
@override @useResult
$Res call({
 bool onboardingCompleted, String themeMode, String locale, double electricityRateFcfa, String? userName, String? currentHouseId
});




}
/// @nodoc
class __$AppSettingsCopyWithImpl<$Res>
    implements _$AppSettingsCopyWith<$Res> {
  __$AppSettingsCopyWithImpl(this._self, this._then);

  final _AppSettings _self;
  final $Res Function(_AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? onboardingCompleted = null,Object? themeMode = null,Object? locale = null,Object? electricityRateFcfa = null,Object? userName = freezed,Object? currentHouseId = freezed,}) {
  return _then(_AppSettings(
onboardingCompleted: null == onboardingCompleted ? _self.onboardingCompleted : onboardingCompleted // ignore: cast_nullable_to_non_nullable
as bool,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,electricityRateFcfa: null == electricityRateFcfa ? _self.electricityRateFcfa : electricityRateFcfa // ignore: cast_nullable_to_non_nullable
as double,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,currentHouseId: freezed == currentHouseId ? _self.currentHouseId : currentHouseId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
