// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HistoryEntry {

 String get id; String get title; String get url; String get type; int get lastReadChapter; double get scrollOffset; DateTime get lastReadAt;
/// Create a copy of HistoryEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryEntryCopyWith<HistoryEntry> get copyWith => _$HistoryEntryCopyWithImpl<HistoryEntry>(this as HistoryEntry, _$identity);

  /// Serializes this HistoryEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.type, type) || other.type == type)&&(identical(other.lastReadChapter, lastReadChapter) || other.lastReadChapter == lastReadChapter)&&(identical(other.scrollOffset, scrollOffset) || other.scrollOffset == scrollOffset)&&(identical(other.lastReadAt, lastReadAt) || other.lastReadAt == lastReadAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,url,type,lastReadChapter,scrollOffset,lastReadAt);

@override
String toString() {
  return 'HistoryEntry(id: $id, title: $title, url: $url, type: $type, lastReadChapter: $lastReadChapter, scrollOffset: $scrollOffset, lastReadAt: $lastReadAt)';
}


}

/// @nodoc
abstract mixin class $HistoryEntryCopyWith<$Res>  {
  factory $HistoryEntryCopyWith(HistoryEntry value, $Res Function(HistoryEntry) _then) = _$HistoryEntryCopyWithImpl;
@useResult
$Res call({
 String id, String title, String url, String type, int lastReadChapter, double scrollOffset, DateTime lastReadAt
});




}
/// @nodoc
class _$HistoryEntryCopyWithImpl<$Res>
    implements $HistoryEntryCopyWith<$Res> {
  _$HistoryEntryCopyWithImpl(this._self, this._then);

  final HistoryEntry _self;
  final $Res Function(HistoryEntry) _then;

/// Create a copy of HistoryEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? url = null,Object? type = null,Object? lastReadChapter = null,Object? scrollOffset = null,Object? lastReadAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,lastReadChapter: null == lastReadChapter ? _self.lastReadChapter : lastReadChapter // ignore: cast_nullable_to_non_nullable
as int,scrollOffset: null == scrollOffset ? _self.scrollOffset : scrollOffset // ignore: cast_nullable_to_non_nullable
as double,lastReadAt: null == lastReadAt ? _self.lastReadAt : lastReadAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryEntry].
extension HistoryEntryPatterns on HistoryEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryEntry value)  $default,){
final _that = this;
switch (_that) {
case _HistoryEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryEntry value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String url,  String type,  int lastReadChapter,  double scrollOffset,  DateTime lastReadAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryEntry() when $default != null:
return $default(_that.id,_that.title,_that.url,_that.type,_that.lastReadChapter,_that.scrollOffset,_that.lastReadAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String url,  String type,  int lastReadChapter,  double scrollOffset,  DateTime lastReadAt)  $default,) {final _that = this;
switch (_that) {
case _HistoryEntry():
return $default(_that.id,_that.title,_that.url,_that.type,_that.lastReadChapter,_that.scrollOffset,_that.lastReadAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String url,  String type,  int lastReadChapter,  double scrollOffset,  DateTime lastReadAt)?  $default,) {final _that = this;
switch (_that) {
case _HistoryEntry() when $default != null:
return $default(_that.id,_that.title,_that.url,_that.type,_that.lastReadChapter,_that.scrollOffset,_that.lastReadAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryEntry implements HistoryEntry {
  const _HistoryEntry({required this.id, required this.title, required this.url, this.type = '', this.lastReadChapter = 0, this.scrollOffset = 0.0, required this.lastReadAt});
  factory _HistoryEntry.fromJson(Map<String, dynamic> json) => _$HistoryEntryFromJson(json);

@override final  String id;
@override final  String title;
@override final  String url;
@override@JsonKey() final  String type;
@override@JsonKey() final  int lastReadChapter;
@override@JsonKey() final  double scrollOffset;
@override final  DateTime lastReadAt;

/// Create a copy of HistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryEntryCopyWith<_HistoryEntry> get copyWith => __$HistoryEntryCopyWithImpl<_HistoryEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.type, type) || other.type == type)&&(identical(other.lastReadChapter, lastReadChapter) || other.lastReadChapter == lastReadChapter)&&(identical(other.scrollOffset, scrollOffset) || other.scrollOffset == scrollOffset)&&(identical(other.lastReadAt, lastReadAt) || other.lastReadAt == lastReadAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,url,type,lastReadChapter,scrollOffset,lastReadAt);

@override
String toString() {
  return 'HistoryEntry(id: $id, title: $title, url: $url, type: $type, lastReadChapter: $lastReadChapter, scrollOffset: $scrollOffset, lastReadAt: $lastReadAt)';
}


}

/// @nodoc
abstract mixin class _$HistoryEntryCopyWith<$Res> implements $HistoryEntryCopyWith<$Res> {
  factory _$HistoryEntryCopyWith(_HistoryEntry value, $Res Function(_HistoryEntry) _then) = __$HistoryEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String url, String type, int lastReadChapter, double scrollOffset, DateTime lastReadAt
});




}
/// @nodoc
class __$HistoryEntryCopyWithImpl<$Res>
    implements _$HistoryEntryCopyWith<$Res> {
  __$HistoryEntryCopyWithImpl(this._self, this._then);

  final _HistoryEntry _self;
  final $Res Function(_HistoryEntry) _then;

/// Create a copy of HistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? url = null,Object? type = null,Object? lastReadChapter = null,Object? scrollOffset = null,Object? lastReadAt = null,}) {
  return _then(_HistoryEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,lastReadChapter: null == lastReadChapter ? _self.lastReadChapter : lastReadChapter // ignore: cast_nullable_to_non_nullable
as int,scrollOffset: null == scrollOffset ? _self.scrollOffset : scrollOffset // ignore: cast_nullable_to_non_nullable
as double,lastReadAt: null == lastReadAt ? _self.lastReadAt : lastReadAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
