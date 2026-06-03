// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manga_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MangaSettings {

 int get readingMode; bool get fitWidth;
/// Create a copy of MangaSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MangaSettingsCopyWith<MangaSettings> get copyWith => _$MangaSettingsCopyWithImpl<MangaSettings>(this as MangaSettings, _$identity);

  /// Serializes this MangaSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MangaSettings&&(identical(other.readingMode, readingMode) || other.readingMode == readingMode)&&(identical(other.fitWidth, fitWidth) || other.fitWidth == fitWidth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,readingMode,fitWidth);

@override
String toString() {
  return 'MangaSettings(readingMode: $readingMode, fitWidth: $fitWidth)';
}


}

/// @nodoc
abstract mixin class $MangaSettingsCopyWith<$Res>  {
  factory $MangaSettingsCopyWith(MangaSettings value, $Res Function(MangaSettings) _then) = _$MangaSettingsCopyWithImpl;
@useResult
$Res call({
 int readingMode, bool fitWidth
});




}
/// @nodoc
class _$MangaSettingsCopyWithImpl<$Res>
    implements $MangaSettingsCopyWith<$Res> {
  _$MangaSettingsCopyWithImpl(this._self, this._then);

  final MangaSettings _self;
  final $Res Function(MangaSettings) _then;

/// Create a copy of MangaSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? readingMode = null,Object? fitWidth = null,}) {
  return _then(_self.copyWith(
readingMode: null == readingMode ? _self.readingMode : readingMode // ignore: cast_nullable_to_non_nullable
as int,fitWidth: null == fitWidth ? _self.fitWidth : fitWidth // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MangaSettings].
extension MangaSettingsPatterns on MangaSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MangaSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MangaSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MangaSettings value)  $default,){
final _that = this;
switch (_that) {
case _MangaSettings():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MangaSettings value)?  $default,){
final _that = this;
switch (_that) {
case _MangaSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int readingMode,  bool fitWidth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MangaSettings() when $default != null:
return $default(_that.readingMode,_that.fitWidth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int readingMode,  bool fitWidth)  $default,) {final _that = this;
switch (_that) {
case _MangaSettings():
return $default(_that.readingMode,_that.fitWidth);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int readingMode,  bool fitWidth)?  $default,) {final _that = this;
switch (_that) {
case _MangaSettings() when $default != null:
return $default(_that.readingMode,_that.fitWidth);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MangaSettings implements MangaSettings {
  const _MangaSettings({this.readingMode = 0, this.fitWidth = false});
  factory _MangaSettings.fromJson(Map<String, dynamic> json) => _$MangaSettingsFromJson(json);

@override@JsonKey() final  int readingMode;
@override@JsonKey() final  bool fitWidth;

/// Create a copy of MangaSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MangaSettingsCopyWith<_MangaSettings> get copyWith => __$MangaSettingsCopyWithImpl<_MangaSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MangaSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MangaSettings&&(identical(other.readingMode, readingMode) || other.readingMode == readingMode)&&(identical(other.fitWidth, fitWidth) || other.fitWidth == fitWidth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,readingMode,fitWidth);

@override
String toString() {
  return 'MangaSettings(readingMode: $readingMode, fitWidth: $fitWidth)';
}


}

/// @nodoc
abstract mixin class _$MangaSettingsCopyWith<$Res> implements $MangaSettingsCopyWith<$Res> {
  factory _$MangaSettingsCopyWith(_MangaSettings value, $Res Function(_MangaSettings) _then) = __$MangaSettingsCopyWithImpl;
@override @useResult
$Res call({
 int readingMode, bool fitWidth
});




}
/// @nodoc
class __$MangaSettingsCopyWithImpl<$Res>
    implements _$MangaSettingsCopyWith<$Res> {
  __$MangaSettingsCopyWithImpl(this._self, this._then);

  final _MangaSettings _self;
  final $Res Function(_MangaSettings) _then;

/// Create a copy of MangaSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? readingMode = null,Object? fitWidth = null,}) {
  return _then(_MangaSettings(
readingMode: null == readingMode ? _self.readingMode : readingMode // ignore: cast_nullable_to_non_nullable
as int,fitWidth: null == fitWidth ? _self.fitWidth : fitWidth // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
