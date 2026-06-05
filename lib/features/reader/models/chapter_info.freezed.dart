// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChapterInfo {

 String get tid; String get title; int get page; String get authorId; int get index; int get postIndex;
/// Create a copy of ChapterInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterInfoCopyWith<ChapterInfo> get copyWith => _$ChapterInfoCopyWithImpl<ChapterInfo>(this as ChapterInfo, _$identity);

  /// Serializes this ChapterInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChapterInfo&&(identical(other.tid, tid) || other.tid == tid)&&(identical(other.title, title) || other.title == title)&&(identical(other.page, page) || other.page == page)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.index, index) || other.index == index)&&(identical(other.postIndex, postIndex) || other.postIndex == postIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tid,title,page,authorId,index,postIndex);

@override
String toString() {
  return 'ChapterInfo(tid: $tid, title: $title, page: $page, authorId: $authorId, index: $index, postIndex: $postIndex)';
}


}

/// @nodoc
abstract mixin class $ChapterInfoCopyWith<$Res>  {
  factory $ChapterInfoCopyWith(ChapterInfo value, $Res Function(ChapterInfo) _then) = _$ChapterInfoCopyWithImpl;
@useResult
$Res call({
 String tid, String title, int page, String authorId, int index, int postIndex
});




}
/// @nodoc
class _$ChapterInfoCopyWithImpl<$Res>
    implements $ChapterInfoCopyWith<$Res> {
  _$ChapterInfoCopyWithImpl(this._self, this._then);

  final ChapterInfo _self;
  final $Res Function(ChapterInfo) _then;

/// Create a copy of ChapterInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tid = null,Object? title = null,Object? page = null,Object? authorId = null,Object? index = null,Object? postIndex = null,}) {
  return _then(_self.copyWith(
tid: null == tid ? _self.tid : tid // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,postIndex: null == postIndex ? _self.postIndex : postIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChapterInfo].
extension ChapterInfoPatterns on ChapterInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChapterInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChapterInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChapterInfo value)  $default,){
final _that = this;
switch (_that) {
case _ChapterInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChapterInfo value)?  $default,){
final _that = this;
switch (_that) {
case _ChapterInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tid,  String title,  int page,  String authorId,  int index,  int postIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChapterInfo() when $default != null:
return $default(_that.tid,_that.title,_that.page,_that.authorId,_that.index,_that.postIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tid,  String title,  int page,  String authorId,  int index,  int postIndex)  $default,) {final _that = this;
switch (_that) {
case _ChapterInfo():
return $default(_that.tid,_that.title,_that.page,_that.authorId,_that.index,_that.postIndex);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tid,  String title,  int page,  String authorId,  int index,  int postIndex)?  $default,) {final _that = this;
switch (_that) {
case _ChapterInfo() when $default != null:
return $default(_that.tid,_that.title,_that.page,_that.authorId,_that.index,_that.postIndex);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChapterInfo implements ChapterInfo {
  const _ChapterInfo({required this.tid, required this.title, this.page = 1, this.authorId = '', this.index = 0, this.postIndex = 0});
  factory _ChapterInfo.fromJson(Map<String, dynamic> json) => _$ChapterInfoFromJson(json);

@override final  String tid;
@override final  String title;
@override@JsonKey() final  int page;
@override@JsonKey() final  String authorId;
@override@JsonKey() final  int index;
@override@JsonKey() final  int postIndex;

/// Create a copy of ChapterInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterInfoCopyWith<_ChapterInfo> get copyWith => __$ChapterInfoCopyWithImpl<_ChapterInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChapterInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChapterInfo&&(identical(other.tid, tid) || other.tid == tid)&&(identical(other.title, title) || other.title == title)&&(identical(other.page, page) || other.page == page)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.index, index) || other.index == index)&&(identical(other.postIndex, postIndex) || other.postIndex == postIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tid,title,page,authorId,index,postIndex);

@override
String toString() {
  return 'ChapterInfo(tid: $tid, title: $title, page: $page, authorId: $authorId, index: $index, postIndex: $postIndex)';
}


}

/// @nodoc
abstract mixin class _$ChapterInfoCopyWith<$Res> implements $ChapterInfoCopyWith<$Res> {
  factory _$ChapterInfoCopyWith(_ChapterInfo value, $Res Function(_ChapterInfo) _then) = __$ChapterInfoCopyWithImpl;
@override @useResult
$Res call({
 String tid, String title, int page, String authorId, int index, int postIndex
});




}
/// @nodoc
class __$ChapterInfoCopyWithImpl<$Res>
    implements _$ChapterInfoCopyWith<$Res> {
  __$ChapterInfoCopyWithImpl(this._self, this._then);

  final _ChapterInfo _self;
  final $Res Function(_ChapterInfo) _then;

/// Create a copy of ChapterInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tid = null,Object? title = null,Object? page = null,Object? authorId = null,Object? index = null,Object? postIndex = null,}) {
  return _then(_ChapterInfo(
tid: null == tid ? _self.tid : tid // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,postIndex: null == postIndex ? _self.postIndex : postIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
