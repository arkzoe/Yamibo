// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cache_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CacheData {

 String get key; String get htmlContent; int get maxPageNum; String get authorId; DateTime get cachedAt;
/// Create a copy of CacheData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CacheDataCopyWith<CacheData> get copyWith => _$CacheDataCopyWithImpl<CacheData>(this as CacheData, _$identity);

  /// Serializes this CacheData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CacheData&&(identical(other.key, key) || other.key == key)&&(identical(other.htmlContent, htmlContent) || other.htmlContent == htmlContent)&&(identical(other.maxPageNum, maxPageNum) || other.maxPageNum == maxPageNum)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.cachedAt, cachedAt) || other.cachedAt == cachedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,htmlContent,maxPageNum,authorId,cachedAt);

@override
String toString() {
  return 'CacheData(key: $key, htmlContent: $htmlContent, maxPageNum: $maxPageNum, authorId: $authorId, cachedAt: $cachedAt)';
}


}

/// @nodoc
abstract mixin class $CacheDataCopyWith<$Res>  {
  factory $CacheDataCopyWith(CacheData value, $Res Function(CacheData) _then) = _$CacheDataCopyWithImpl;
@useResult
$Res call({
 String key, String htmlContent, int maxPageNum, String authorId, DateTime cachedAt
});




}
/// @nodoc
class _$CacheDataCopyWithImpl<$Res>
    implements $CacheDataCopyWith<$Res> {
  _$CacheDataCopyWithImpl(this._self, this._then);

  final CacheData _self;
  final $Res Function(CacheData) _then;

/// Create a copy of CacheData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? htmlContent = null,Object? maxPageNum = null,Object? authorId = null,Object? cachedAt = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,htmlContent: null == htmlContent ? _self.htmlContent : htmlContent // ignore: cast_nullable_to_non_nullable
as String,maxPageNum: null == maxPageNum ? _self.maxPageNum : maxPageNum // ignore: cast_nullable_to_non_nullable
as int,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,cachedAt: null == cachedAt ? _self.cachedAt : cachedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CacheData].
extension CacheDataPatterns on CacheData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CacheData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CacheData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CacheData value)  $default,){
final _that = this;
switch (_that) {
case _CacheData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CacheData value)?  $default,){
final _that = this;
switch (_that) {
case _CacheData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String htmlContent,  int maxPageNum,  String authorId,  DateTime cachedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CacheData() when $default != null:
return $default(_that.key,_that.htmlContent,_that.maxPageNum,_that.authorId,_that.cachedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String htmlContent,  int maxPageNum,  String authorId,  DateTime cachedAt)  $default,) {final _that = this;
switch (_that) {
case _CacheData():
return $default(_that.key,_that.htmlContent,_that.maxPageNum,_that.authorId,_that.cachedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String htmlContent,  int maxPageNum,  String authorId,  DateTime cachedAt)?  $default,) {final _that = this;
switch (_that) {
case _CacheData() when $default != null:
return $default(_that.key,_that.htmlContent,_that.maxPageNum,_that.authorId,_that.cachedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CacheData implements CacheData {
  const _CacheData({required this.key, required this.htmlContent, this.maxPageNum = 1, this.authorId = '', required this.cachedAt});
  factory _CacheData.fromJson(Map<String, dynamic> json) => _$CacheDataFromJson(json);

@override final  String key;
@override final  String htmlContent;
@override@JsonKey() final  int maxPageNum;
@override@JsonKey() final  String authorId;
@override final  DateTime cachedAt;

/// Create a copy of CacheData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CacheDataCopyWith<_CacheData> get copyWith => __$CacheDataCopyWithImpl<_CacheData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CacheDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CacheData&&(identical(other.key, key) || other.key == key)&&(identical(other.htmlContent, htmlContent) || other.htmlContent == htmlContent)&&(identical(other.maxPageNum, maxPageNum) || other.maxPageNum == maxPageNum)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.cachedAt, cachedAt) || other.cachedAt == cachedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,htmlContent,maxPageNum,authorId,cachedAt);

@override
String toString() {
  return 'CacheData(key: $key, htmlContent: $htmlContent, maxPageNum: $maxPageNum, authorId: $authorId, cachedAt: $cachedAt)';
}


}

/// @nodoc
abstract mixin class _$CacheDataCopyWith<$Res> implements $CacheDataCopyWith<$Res> {
  factory _$CacheDataCopyWith(_CacheData value, $Res Function(_CacheData) _then) = __$CacheDataCopyWithImpl;
@override @useResult
$Res call({
 String key, String htmlContent, int maxPageNum, String authorId, DateTime cachedAt
});




}
/// @nodoc
class __$CacheDataCopyWithImpl<$Res>
    implements _$CacheDataCopyWith<$Res> {
  __$CacheDataCopyWithImpl(this._self, this._then);

  final _CacheData _self;
  final $Res Function(_CacheData) _then;

/// Create a copy of CacheData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? htmlContent = null,Object? maxPageNum = null,Object? authorId = null,Object? cachedAt = null,}) {
  return _then(_CacheData(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,htmlContent: null == htmlContent ? _self.htmlContent : htmlContent // ignore: cast_nullable_to_non_nullable
as String,maxPageNum: null == maxPageNum ? _self.maxPageNum : maxPageNum // ignore: cast_nullable_to_non_nullable
as int,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,cachedAt: null == cachedAt ? _self.cachedAt : cachedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
