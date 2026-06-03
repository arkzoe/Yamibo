// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FavoriteItem {

 String get id; String get title; String get url; String get author; String get lastReply; int get sortOrder; bool get isSelected;
/// Create a copy of FavoriteItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteItemCopyWith<FavoriteItem> get copyWith => _$FavoriteItemCopyWithImpl<FavoriteItem>(this as FavoriteItem, _$identity);

  /// Serializes this FavoriteItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.author, author) || other.author == author)&&(identical(other.lastReply, lastReply) || other.lastReply == lastReply)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,url,author,lastReply,sortOrder,isSelected);

@override
String toString() {
  return 'FavoriteItem(id: $id, title: $title, url: $url, author: $author, lastReply: $lastReply, sortOrder: $sortOrder, isSelected: $isSelected)';
}


}

/// @nodoc
abstract mixin class $FavoriteItemCopyWith<$Res>  {
  factory $FavoriteItemCopyWith(FavoriteItem value, $Res Function(FavoriteItem) _then) = _$FavoriteItemCopyWithImpl;
@useResult
$Res call({
 String id, String title, String url, String author, String lastReply, int sortOrder, bool isSelected
});




}
/// @nodoc
class _$FavoriteItemCopyWithImpl<$Res>
    implements $FavoriteItemCopyWith<$Res> {
  _$FavoriteItemCopyWithImpl(this._self, this._then);

  final FavoriteItem _self;
  final $Res Function(FavoriteItem) _then;

/// Create a copy of FavoriteItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? url = null,Object? author = null,Object? lastReply = null,Object? sortOrder = null,Object? isSelected = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,lastReply: null == lastReply ? _self.lastReply : lastReply // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FavoriteItem].
extension FavoriteItemPatterns on FavoriteItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavoriteItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavoriteItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavoriteItem value)  $default,){
final _that = this;
switch (_that) {
case _FavoriteItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavoriteItem value)?  $default,){
final _that = this;
switch (_that) {
case _FavoriteItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String url,  String author,  String lastReply,  int sortOrder,  bool isSelected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavoriteItem() when $default != null:
return $default(_that.id,_that.title,_that.url,_that.author,_that.lastReply,_that.sortOrder,_that.isSelected);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String url,  String author,  String lastReply,  int sortOrder,  bool isSelected)  $default,) {final _that = this;
switch (_that) {
case _FavoriteItem():
return $default(_that.id,_that.title,_that.url,_that.author,_that.lastReply,_that.sortOrder,_that.isSelected);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String url,  String author,  String lastReply,  int sortOrder,  bool isSelected)?  $default,) {final _that = this;
switch (_that) {
case _FavoriteItem() when $default != null:
return $default(_that.id,_that.title,_that.url,_that.author,_that.lastReply,_that.sortOrder,_that.isSelected);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FavoriteItem implements FavoriteItem {
  const _FavoriteItem({required this.id, required this.title, required this.url, this.author = '', this.lastReply = '', this.sortOrder = 0, this.isSelected = false});
  factory _FavoriteItem.fromJson(Map<String, dynamic> json) => _$FavoriteItemFromJson(json);

@override final  String id;
@override final  String title;
@override final  String url;
@override@JsonKey() final  String author;
@override@JsonKey() final  String lastReply;
@override@JsonKey() final  int sortOrder;
@override@JsonKey() final  bool isSelected;

/// Create a copy of FavoriteItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoriteItemCopyWith<_FavoriteItem> get copyWith => __$FavoriteItemCopyWithImpl<_FavoriteItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FavoriteItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoriteItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.author, author) || other.author == author)&&(identical(other.lastReply, lastReply) || other.lastReply == lastReply)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,url,author,lastReply,sortOrder,isSelected);

@override
String toString() {
  return 'FavoriteItem(id: $id, title: $title, url: $url, author: $author, lastReply: $lastReply, sortOrder: $sortOrder, isSelected: $isSelected)';
}


}

/// @nodoc
abstract mixin class _$FavoriteItemCopyWith<$Res> implements $FavoriteItemCopyWith<$Res> {
  factory _$FavoriteItemCopyWith(_FavoriteItem value, $Res Function(_FavoriteItem) _then) = __$FavoriteItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String url, String author, String lastReply, int sortOrder, bool isSelected
});




}
/// @nodoc
class __$FavoriteItemCopyWithImpl<$Res>
    implements _$FavoriteItemCopyWith<$Res> {
  __$FavoriteItemCopyWithImpl(this._self, this._then);

  final _FavoriteItem _self;
  final $Res Function(_FavoriteItem) _then;

/// Create a copy of FavoriteItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? url = null,Object? author = null,Object? lastReply = null,Object? sortOrder = null,Object? isSelected = null,}) {
  return _then(_FavoriteItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,lastReply: null == lastReply ? _self.lastReply : lastReply // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
