// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reader_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReaderSettings {

 double get fontSize; double get lineHeight; double get letterSpacing; double get padding; bool get nightMode; int get fontFamily; int get translationMode; bool get loadImages;
/// Create a copy of ReaderSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReaderSettingsCopyWith<ReaderSettings> get copyWith => _$ReaderSettingsCopyWithImpl<ReaderSettings>(this as ReaderSettings, _$identity);

  /// Serializes this ReaderSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReaderSettings&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.lineHeight, lineHeight) || other.lineHeight == lineHeight)&&(identical(other.letterSpacing, letterSpacing) || other.letterSpacing == letterSpacing)&&(identical(other.padding, padding) || other.padding == padding)&&(identical(other.nightMode, nightMode) || other.nightMode == nightMode)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.translationMode, translationMode) || other.translationMode == translationMode)&&(identical(other.loadImages, loadImages) || other.loadImages == loadImages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fontSize,lineHeight,letterSpacing,padding,nightMode,fontFamily,translationMode,loadImages);

@override
String toString() {
  return 'ReaderSettings(fontSize: $fontSize, lineHeight: $lineHeight, letterSpacing: $letterSpacing, padding: $padding, nightMode: $nightMode, fontFamily: $fontFamily, translationMode: $translationMode, loadImages: $loadImages)';
}


}

/// @nodoc
abstract mixin class $ReaderSettingsCopyWith<$Res>  {
  factory $ReaderSettingsCopyWith(ReaderSettings value, $Res Function(ReaderSettings) _then) = _$ReaderSettingsCopyWithImpl;
@useResult
$Res call({
 double fontSize, double lineHeight, double letterSpacing, double padding, bool nightMode, int fontFamily, int translationMode, bool loadImages
});




}
/// @nodoc
class _$ReaderSettingsCopyWithImpl<$Res>
    implements $ReaderSettingsCopyWith<$Res> {
  _$ReaderSettingsCopyWithImpl(this._self, this._then);

  final ReaderSettings _self;
  final $Res Function(ReaderSettings) _then;

/// Create a copy of ReaderSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fontSize = null,Object? lineHeight = null,Object? letterSpacing = null,Object? padding = null,Object? nightMode = null,Object? fontFamily = null,Object? translationMode = null,Object? loadImages = null,}) {
  return _then(_self.copyWith(
fontSize: null == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as double,lineHeight: null == lineHeight ? _self.lineHeight : lineHeight // ignore: cast_nullable_to_non_nullable
as double,letterSpacing: null == letterSpacing ? _self.letterSpacing : letterSpacing // ignore: cast_nullable_to_non_nullable
as double,padding: null == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as double,nightMode: null == nightMode ? _self.nightMode : nightMode // ignore: cast_nullable_to_non_nullable
as bool,fontFamily: null == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as int,translationMode: null == translationMode ? _self.translationMode : translationMode // ignore: cast_nullable_to_non_nullable
as int,loadImages: null == loadImages ? _self.loadImages : loadImages // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ReaderSettings].
extension ReaderSettingsPatterns on ReaderSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReaderSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReaderSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReaderSettings value)  $default,){
final _that = this;
switch (_that) {
case _ReaderSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReaderSettings value)?  $default,){
final _that = this;
switch (_that) {
case _ReaderSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double fontSize,  double lineHeight,  double letterSpacing,  double padding,  bool nightMode,  int fontFamily,  int translationMode,  bool loadImages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReaderSettings() when $default != null:
return $default(_that.fontSize,_that.lineHeight,_that.letterSpacing,_that.padding,_that.nightMode,_that.fontFamily,_that.translationMode,_that.loadImages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double fontSize,  double lineHeight,  double letterSpacing,  double padding,  bool nightMode,  int fontFamily,  int translationMode,  bool loadImages)  $default,) {final _that = this;
switch (_that) {
case _ReaderSettings():
return $default(_that.fontSize,_that.lineHeight,_that.letterSpacing,_that.padding,_that.nightMode,_that.fontFamily,_that.translationMode,_that.loadImages);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double fontSize,  double lineHeight,  double letterSpacing,  double padding,  bool nightMode,  int fontFamily,  int translationMode,  bool loadImages)?  $default,) {final _that = this;
switch (_that) {
case _ReaderSettings() when $default != null:
return $default(_that.fontSize,_that.lineHeight,_that.letterSpacing,_that.padding,_that.nightMode,_that.fontFamily,_that.translationMode,_that.loadImages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReaderSettings implements ReaderSettings {
  const _ReaderSettings({this.fontSize = 18.0, this.lineHeight = 28.0, this.letterSpacing = 0.0, this.padding = 16.0, this.nightMode = false, this.fontFamily = 0, this.translationMode = 0, this.loadImages = true});
  factory _ReaderSettings.fromJson(Map<String, dynamic> json) => _$ReaderSettingsFromJson(json);

@override@JsonKey() final  double fontSize;
@override@JsonKey() final  double lineHeight;
@override@JsonKey() final  double letterSpacing;
@override@JsonKey() final  double padding;
@override@JsonKey() final  bool nightMode;
@override@JsonKey() final  int fontFamily;
@override@JsonKey() final  int translationMode;
@override@JsonKey() final  bool loadImages;

/// Create a copy of ReaderSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReaderSettingsCopyWith<_ReaderSettings> get copyWith => __$ReaderSettingsCopyWithImpl<_ReaderSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReaderSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReaderSettings&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.lineHeight, lineHeight) || other.lineHeight == lineHeight)&&(identical(other.letterSpacing, letterSpacing) || other.letterSpacing == letterSpacing)&&(identical(other.padding, padding) || other.padding == padding)&&(identical(other.nightMode, nightMode) || other.nightMode == nightMode)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.translationMode, translationMode) || other.translationMode == translationMode)&&(identical(other.loadImages, loadImages) || other.loadImages == loadImages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fontSize,lineHeight,letterSpacing,padding,nightMode,fontFamily,translationMode,loadImages);

@override
String toString() {
  return 'ReaderSettings(fontSize: $fontSize, lineHeight: $lineHeight, letterSpacing: $letterSpacing, padding: $padding, nightMode: $nightMode, fontFamily: $fontFamily, translationMode: $translationMode, loadImages: $loadImages)';
}


}

/// @nodoc
abstract mixin class _$ReaderSettingsCopyWith<$Res> implements $ReaderSettingsCopyWith<$Res> {
  factory _$ReaderSettingsCopyWith(_ReaderSettings value, $Res Function(_ReaderSettings) _then) = __$ReaderSettingsCopyWithImpl;
@override @useResult
$Res call({
 double fontSize, double lineHeight, double letterSpacing, double padding, bool nightMode, int fontFamily, int translationMode, bool loadImages
});




}
/// @nodoc
class __$ReaderSettingsCopyWithImpl<$Res>
    implements _$ReaderSettingsCopyWith<$Res> {
  __$ReaderSettingsCopyWithImpl(this._self, this._then);

  final _ReaderSettings _self;
  final $Res Function(_ReaderSettings) _then;

/// Create a copy of ReaderSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fontSize = null,Object? lineHeight = null,Object? letterSpacing = null,Object? padding = null,Object? nightMode = null,Object? fontFamily = null,Object? translationMode = null,Object? loadImages = null,}) {
  return _then(_ReaderSettings(
fontSize: null == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as double,lineHeight: null == lineHeight ? _self.lineHeight : lineHeight // ignore: cast_nullable_to_non_nullable
as double,letterSpacing: null == letterSpacing ? _self.letterSpacing : letterSpacing // ignore: cast_nullable_to_non_nullable
as double,padding: null == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as double,nightMode: null == nightMode ? _self.nightMode : nightMode // ignore: cast_nullable_to_non_nullable
as bool,fontFamily: null == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as int,translationMode: null == translationMode ? _self.translationMode : translationMode // ignore: cast_nullable_to_non_nullable
as int,loadImages: null == loadImages ? _self.loadImages : loadImages // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
