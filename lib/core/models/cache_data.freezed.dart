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
mixin _$PostCacheData {

 int get postIndex; String get authorId; List<Content> get contents; String get chapterTitle;
/// Create a copy of PostCacheData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostCacheDataCopyWith<PostCacheData> get copyWith => _$PostCacheDataCopyWithImpl<PostCacheData>(this as PostCacheData, _$identity);

  /// Serializes this PostCacheData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostCacheData&&(identical(other.postIndex, postIndex) || other.postIndex == postIndex)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&const DeepCollectionEquality().equals(other.contents, contents)&&(identical(other.chapterTitle, chapterTitle) || other.chapterTitle == chapterTitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,postIndex,authorId,const DeepCollectionEquality().hash(contents),chapterTitle);

@override
String toString() {
  return 'PostCacheData(postIndex: $postIndex, authorId: $authorId, contents: $contents, chapterTitle: $chapterTitle)';
}


}

/// @nodoc
abstract mixin class $PostCacheDataCopyWith<$Res>  {
  factory $PostCacheDataCopyWith(PostCacheData value, $Res Function(PostCacheData) _then) = _$PostCacheDataCopyWithImpl;
@useResult
$Res call({
 int postIndex, String authorId, List<Content> contents, String chapterTitle
});




}
/// @nodoc
class _$PostCacheDataCopyWithImpl<$Res>
    implements $PostCacheDataCopyWith<$Res> {
  _$PostCacheDataCopyWithImpl(this._self, this._then);

  final PostCacheData _self;
  final $Res Function(PostCacheData) _then;

/// Create a copy of PostCacheData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? postIndex = null,Object? authorId = null,Object? contents = null,Object? chapterTitle = null,}) {
  return _then(_self.copyWith(
postIndex: null == postIndex ? _self.postIndex : postIndex // ignore: cast_nullable_to_non_nullable
as int,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,contents: null == contents ? _self.contents : contents // ignore: cast_nullable_to_non_nullable
as List<Content>,chapterTitle: null == chapterTitle ? _self.chapterTitle : chapterTitle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PostCacheData].
extension PostCacheDataPatterns on PostCacheData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostCacheData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostCacheData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostCacheData value)  $default,){
final _that = this;
switch (_that) {
case _PostCacheData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostCacheData value)?  $default,){
final _that = this;
switch (_that) {
case _PostCacheData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int postIndex,  String authorId,  List<Content> contents,  String chapterTitle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostCacheData() when $default != null:
return $default(_that.postIndex,_that.authorId,_that.contents,_that.chapterTitle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int postIndex,  String authorId,  List<Content> contents,  String chapterTitle)  $default,) {final _that = this;
switch (_that) {
case _PostCacheData():
return $default(_that.postIndex,_that.authorId,_that.contents,_that.chapterTitle);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int postIndex,  String authorId,  List<Content> contents,  String chapterTitle)?  $default,) {final _that = this;
switch (_that) {
case _PostCacheData() when $default != null:
return $default(_that.postIndex,_that.authorId,_that.contents,_that.chapterTitle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PostCacheData implements PostCacheData {
  const _PostCacheData({required this.postIndex, required this.authorId, required final  List<Content> contents, required this.chapterTitle}): _contents = contents;
  factory _PostCacheData.fromJson(Map<String, dynamic> json) => _$PostCacheDataFromJson(json);

@override final  int postIndex;
@override final  String authorId;
 final  List<Content> _contents;
@override List<Content> get contents {
  if (_contents is EqualUnmodifiableListView) return _contents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contents);
}

@override final  String chapterTitle;

/// Create a copy of PostCacheData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostCacheDataCopyWith<_PostCacheData> get copyWith => __$PostCacheDataCopyWithImpl<_PostCacheData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostCacheDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostCacheData&&(identical(other.postIndex, postIndex) || other.postIndex == postIndex)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&const DeepCollectionEquality().equals(other._contents, _contents)&&(identical(other.chapterTitle, chapterTitle) || other.chapterTitle == chapterTitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,postIndex,authorId,const DeepCollectionEquality().hash(_contents),chapterTitle);

@override
String toString() {
  return 'PostCacheData(postIndex: $postIndex, authorId: $authorId, contents: $contents, chapterTitle: $chapterTitle)';
}


}

/// @nodoc
abstract mixin class _$PostCacheDataCopyWith<$Res> implements $PostCacheDataCopyWith<$Res> {
  factory _$PostCacheDataCopyWith(_PostCacheData value, $Res Function(_PostCacheData) _then) = __$PostCacheDataCopyWithImpl;
@override @useResult
$Res call({
 int postIndex, String authorId, List<Content> contents, String chapterTitle
});




}
/// @nodoc
class __$PostCacheDataCopyWithImpl<$Res>
    implements _$PostCacheDataCopyWith<$Res> {
  __$PostCacheDataCopyWithImpl(this._self, this._then);

  final _PostCacheData _self;
  final $Res Function(_PostCacheData) _then;

/// Create a copy of PostCacheData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? postIndex = null,Object? authorId = null,Object? contents = null,Object? chapterTitle = null,}) {
  return _then(_PostCacheData(
postIndex: null == postIndex ? _self.postIndex : postIndex // ignore: cast_nullable_to_non_nullable
as int,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,contents: null == contents ? _self._contents : contents // ignore: cast_nullable_to_non_nullable
as List<Content>,chapterTitle: null == chapterTitle ? _self.chapterTitle : chapterTitle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CacheData {

 String get key; List<PostCacheData> get posts; int get maxPageNum; DateTime get cachedAt;
/// Create a copy of CacheData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CacheDataCopyWith<CacheData> get copyWith => _$CacheDataCopyWithImpl<CacheData>(this as CacheData, _$identity);

  /// Serializes this CacheData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CacheData&&(identical(other.key, key) || other.key == key)&&const DeepCollectionEquality().equals(other.posts, posts)&&(identical(other.maxPageNum, maxPageNum) || other.maxPageNum == maxPageNum)&&(identical(other.cachedAt, cachedAt) || other.cachedAt == cachedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,const DeepCollectionEquality().hash(posts),maxPageNum,cachedAt);

@override
String toString() {
  return 'CacheData(key: $key, posts: $posts, maxPageNum: $maxPageNum, cachedAt: $cachedAt)';
}


}

/// @nodoc
abstract mixin class $CacheDataCopyWith<$Res>  {
  factory $CacheDataCopyWith(CacheData value, $Res Function(CacheData) _then) = _$CacheDataCopyWithImpl;
@useResult
$Res call({
 String key, List<PostCacheData> posts, int maxPageNum, DateTime cachedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? posts = null,Object? maxPageNum = null,Object? cachedAt = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,posts: null == posts ? _self.posts : posts // ignore: cast_nullable_to_non_nullable
as List<PostCacheData>,maxPageNum: null == maxPageNum ? _self.maxPageNum : maxPageNum // ignore: cast_nullable_to_non_nullable
as int,cachedAt: null == cachedAt ? _self.cachedAt : cachedAt // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  List<PostCacheData> posts,  int maxPageNum,  DateTime cachedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CacheData() when $default != null:
return $default(_that.key,_that.posts,_that.maxPageNum,_that.cachedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  List<PostCacheData> posts,  int maxPageNum,  DateTime cachedAt)  $default,) {final _that = this;
switch (_that) {
case _CacheData():
return $default(_that.key,_that.posts,_that.maxPageNum,_that.cachedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  List<PostCacheData> posts,  int maxPageNum,  DateTime cachedAt)?  $default,) {final _that = this;
switch (_that) {
case _CacheData() when $default != null:
return $default(_that.key,_that.posts,_that.maxPageNum,_that.cachedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CacheData implements CacheData {
  const _CacheData({required this.key, required final  List<PostCacheData> posts, this.maxPageNum = 1, required this.cachedAt}): _posts = posts;
  factory _CacheData.fromJson(Map<String, dynamic> json) => _$CacheDataFromJson(json);

@override final  String key;
 final  List<PostCacheData> _posts;
@override List<PostCacheData> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}

@override@JsonKey() final  int maxPageNum;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CacheData&&(identical(other.key, key) || other.key == key)&&const DeepCollectionEquality().equals(other._posts, _posts)&&(identical(other.maxPageNum, maxPageNum) || other.maxPageNum == maxPageNum)&&(identical(other.cachedAt, cachedAt) || other.cachedAt == cachedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,const DeepCollectionEquality().hash(_posts),maxPageNum,cachedAt);

@override
String toString() {
  return 'CacheData(key: $key, posts: $posts, maxPageNum: $maxPageNum, cachedAt: $cachedAt)';
}


}

/// @nodoc
abstract mixin class _$CacheDataCopyWith<$Res> implements $CacheDataCopyWith<$Res> {
  factory _$CacheDataCopyWith(_CacheData value, $Res Function(_CacheData) _then) = __$CacheDataCopyWithImpl;
@override @useResult
$Res call({
 String key, List<PostCacheData> posts, int maxPageNum, DateTime cachedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? posts = null,Object? maxPageNum = null,Object? cachedAt = null,}) {
  return _then(_CacheData(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<PostCacheData>,maxPageNum: null == maxPageNum ? _self.maxPageNum : maxPageNum // ignore: cast_nullable_to_non_nullable
as int,cachedAt: null == cachedAt ? _self.cachedAt : cachedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
