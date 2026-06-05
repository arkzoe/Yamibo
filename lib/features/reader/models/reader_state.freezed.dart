// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reader_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReaderState {

 String get tid; List<Content> get contents; String get chapterTitle; int get currentChapterIndex; List<ChapterInfo> get chapters; int get currentPage; int get maxPageNum; String get authorId; int get currentPostIndex; double get scrollOffset; bool get isLoading; bool get isError; String get errorMessage; double get fontSize; double get lineHeight; double get letterSpacing; double get padding; bool get nightMode; int get fontFamily; int get translationMode; bool get loadImages;
/// Create a copy of ReaderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReaderStateCopyWith<ReaderState> get copyWith => _$ReaderStateCopyWithImpl<ReaderState>(this as ReaderState, _$identity);

  /// Serializes this ReaderState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReaderState&&(identical(other.tid, tid) || other.tid == tid)&&const DeepCollectionEquality().equals(other.contents, contents)&&(identical(other.chapterTitle, chapterTitle) || other.chapterTitle == chapterTitle)&&(identical(other.currentChapterIndex, currentChapterIndex) || other.currentChapterIndex == currentChapterIndex)&&const DeepCollectionEquality().equals(other.chapters, chapters)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.maxPageNum, maxPageNum) || other.maxPageNum == maxPageNum)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.currentPostIndex, currentPostIndex) || other.currentPostIndex == currentPostIndex)&&(identical(other.scrollOffset, scrollOffset) || other.scrollOffset == scrollOffset)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.lineHeight, lineHeight) || other.lineHeight == lineHeight)&&(identical(other.letterSpacing, letterSpacing) || other.letterSpacing == letterSpacing)&&(identical(other.padding, padding) || other.padding == padding)&&(identical(other.nightMode, nightMode) || other.nightMode == nightMode)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.translationMode, translationMode) || other.translationMode == translationMode)&&(identical(other.loadImages, loadImages) || other.loadImages == loadImages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,tid,const DeepCollectionEquality().hash(contents),chapterTitle,currentChapterIndex,const DeepCollectionEquality().hash(chapters),currentPage,maxPageNum,authorId,currentPostIndex,scrollOffset,isLoading,isError,errorMessage,fontSize,lineHeight,letterSpacing,padding,nightMode,fontFamily,translationMode,loadImages]);

@override
String toString() {
  return 'ReaderState(tid: $tid, contents: $contents, chapterTitle: $chapterTitle, currentChapterIndex: $currentChapterIndex, chapters: $chapters, currentPage: $currentPage, maxPageNum: $maxPageNum, authorId: $authorId, currentPostIndex: $currentPostIndex, scrollOffset: $scrollOffset, isLoading: $isLoading, isError: $isError, errorMessage: $errorMessage, fontSize: $fontSize, lineHeight: $lineHeight, letterSpacing: $letterSpacing, padding: $padding, nightMode: $nightMode, fontFamily: $fontFamily, translationMode: $translationMode, loadImages: $loadImages)';
}


}

/// @nodoc
abstract mixin class $ReaderStateCopyWith<$Res>  {
  factory $ReaderStateCopyWith(ReaderState value, $Res Function(ReaderState) _then) = _$ReaderStateCopyWithImpl;
@useResult
$Res call({
 String tid, List<Content> contents, String chapterTitle, int currentChapterIndex, List<ChapterInfo> chapters, int currentPage, int maxPageNum, String authorId, int currentPostIndex, double scrollOffset, bool isLoading, bool isError, String errorMessage, double fontSize, double lineHeight, double letterSpacing, double padding, bool nightMode, int fontFamily, int translationMode, bool loadImages
});




}
/// @nodoc
class _$ReaderStateCopyWithImpl<$Res>
    implements $ReaderStateCopyWith<$Res> {
  _$ReaderStateCopyWithImpl(this._self, this._then);

  final ReaderState _self;
  final $Res Function(ReaderState) _then;

/// Create a copy of ReaderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tid = null,Object? contents = null,Object? chapterTitle = null,Object? currentChapterIndex = null,Object? chapters = null,Object? currentPage = null,Object? maxPageNum = null,Object? authorId = null,Object? currentPostIndex = null,Object? scrollOffset = null,Object? isLoading = null,Object? isError = null,Object? errorMessage = null,Object? fontSize = null,Object? lineHeight = null,Object? letterSpacing = null,Object? padding = null,Object? nightMode = null,Object? fontFamily = null,Object? translationMode = null,Object? loadImages = null,}) {
  return _then(_self.copyWith(
tid: null == tid ? _self.tid : tid // ignore: cast_nullable_to_non_nullable
as String,contents: null == contents ? _self.contents : contents // ignore: cast_nullable_to_non_nullable
as List<Content>,chapterTitle: null == chapterTitle ? _self.chapterTitle : chapterTitle // ignore: cast_nullable_to_non_nullable
as String,currentChapterIndex: null == currentChapterIndex ? _self.currentChapterIndex : currentChapterIndex // ignore: cast_nullable_to_non_nullable
as int,chapters: null == chapters ? _self.chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<ChapterInfo>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,maxPageNum: null == maxPageNum ? _self.maxPageNum : maxPageNum // ignore: cast_nullable_to_non_nullable
as int,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,currentPostIndex: null == currentPostIndex ? _self.currentPostIndex : currentPostIndex // ignore: cast_nullable_to_non_nullable
as int,scrollOffset: null == scrollOffset ? _self.scrollOffset : scrollOffset // ignore: cast_nullable_to_non_nullable
as double,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,fontSize: null == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [ReaderState].
extension ReaderStatePatterns on ReaderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReaderState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReaderState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReaderState value)  $default,){
final _that = this;
switch (_that) {
case _ReaderState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReaderState value)?  $default,){
final _that = this;
switch (_that) {
case _ReaderState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tid,  List<Content> contents,  String chapterTitle,  int currentChapterIndex,  List<ChapterInfo> chapters,  int currentPage,  int maxPageNum,  String authorId,  int currentPostIndex,  double scrollOffset,  bool isLoading,  bool isError,  String errorMessage,  double fontSize,  double lineHeight,  double letterSpacing,  double padding,  bool nightMode,  int fontFamily,  int translationMode,  bool loadImages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReaderState() when $default != null:
return $default(_that.tid,_that.contents,_that.chapterTitle,_that.currentChapterIndex,_that.chapters,_that.currentPage,_that.maxPageNum,_that.authorId,_that.currentPostIndex,_that.scrollOffset,_that.isLoading,_that.isError,_that.errorMessage,_that.fontSize,_that.lineHeight,_that.letterSpacing,_that.padding,_that.nightMode,_that.fontFamily,_that.translationMode,_that.loadImages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tid,  List<Content> contents,  String chapterTitle,  int currentChapterIndex,  List<ChapterInfo> chapters,  int currentPage,  int maxPageNum,  String authorId,  int currentPostIndex,  double scrollOffset,  bool isLoading,  bool isError,  String errorMessage,  double fontSize,  double lineHeight,  double letterSpacing,  double padding,  bool nightMode,  int fontFamily,  int translationMode,  bool loadImages)  $default,) {final _that = this;
switch (_that) {
case _ReaderState():
return $default(_that.tid,_that.contents,_that.chapterTitle,_that.currentChapterIndex,_that.chapters,_that.currentPage,_that.maxPageNum,_that.authorId,_that.currentPostIndex,_that.scrollOffset,_that.isLoading,_that.isError,_that.errorMessage,_that.fontSize,_that.lineHeight,_that.letterSpacing,_that.padding,_that.nightMode,_that.fontFamily,_that.translationMode,_that.loadImages);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tid,  List<Content> contents,  String chapterTitle,  int currentChapterIndex,  List<ChapterInfo> chapters,  int currentPage,  int maxPageNum,  String authorId,  int currentPostIndex,  double scrollOffset,  bool isLoading,  bool isError,  String errorMessage,  double fontSize,  double lineHeight,  double letterSpacing,  double padding,  bool nightMode,  int fontFamily,  int translationMode,  bool loadImages)?  $default,) {final _that = this;
switch (_that) {
case _ReaderState() when $default != null:
return $default(_that.tid,_that.contents,_that.chapterTitle,_that.currentChapterIndex,_that.chapters,_that.currentPage,_that.maxPageNum,_that.authorId,_that.currentPostIndex,_that.scrollOffset,_that.isLoading,_that.isError,_that.errorMessage,_that.fontSize,_that.lineHeight,_that.letterSpacing,_that.padding,_that.nightMode,_that.fontFamily,_that.translationMode,_that.loadImages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReaderState implements ReaderState {
  const _ReaderState({required this.tid, final  List<Content> contents = const [], this.chapterTitle = '', this.currentChapterIndex = 0, final  List<ChapterInfo> chapters = const [], this.currentPage = 1, this.maxPageNum = 1, this.authorId = '', this.currentPostIndex = 0, this.scrollOffset = 0.0, this.isLoading = false, this.isError = false, this.errorMessage = '', this.fontSize = 18.0, this.lineHeight = 28.0, this.letterSpacing = 0.0, this.padding = 16.0, this.nightMode = false, this.fontFamily = 0, this.translationMode = 0, this.loadImages = true}): _contents = contents,_chapters = chapters;
  factory _ReaderState.fromJson(Map<String, dynamic> json) => _$ReaderStateFromJson(json);

@override final  String tid;
 final  List<Content> _contents;
@override@JsonKey() List<Content> get contents {
  if (_contents is EqualUnmodifiableListView) return _contents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contents);
}

@override@JsonKey() final  String chapterTitle;
@override@JsonKey() final  int currentChapterIndex;
 final  List<ChapterInfo> _chapters;
@override@JsonKey() List<ChapterInfo> get chapters {
  if (_chapters is EqualUnmodifiableListView) return _chapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chapters);
}

@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int maxPageNum;
@override@JsonKey() final  String authorId;
@override@JsonKey() final  int currentPostIndex;
@override@JsonKey() final  double scrollOffset;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isError;
@override@JsonKey() final  String errorMessage;
@override@JsonKey() final  double fontSize;
@override@JsonKey() final  double lineHeight;
@override@JsonKey() final  double letterSpacing;
@override@JsonKey() final  double padding;
@override@JsonKey() final  bool nightMode;
@override@JsonKey() final  int fontFamily;
@override@JsonKey() final  int translationMode;
@override@JsonKey() final  bool loadImages;

/// Create a copy of ReaderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReaderStateCopyWith<_ReaderState> get copyWith => __$ReaderStateCopyWithImpl<_ReaderState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReaderStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReaderState&&(identical(other.tid, tid) || other.tid == tid)&&const DeepCollectionEquality().equals(other._contents, _contents)&&(identical(other.chapterTitle, chapterTitle) || other.chapterTitle == chapterTitle)&&(identical(other.currentChapterIndex, currentChapterIndex) || other.currentChapterIndex == currentChapterIndex)&&const DeepCollectionEquality().equals(other._chapters, _chapters)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.maxPageNum, maxPageNum) || other.maxPageNum == maxPageNum)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.currentPostIndex, currentPostIndex) || other.currentPostIndex == currentPostIndex)&&(identical(other.scrollOffset, scrollOffset) || other.scrollOffset == scrollOffset)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.lineHeight, lineHeight) || other.lineHeight == lineHeight)&&(identical(other.letterSpacing, letterSpacing) || other.letterSpacing == letterSpacing)&&(identical(other.padding, padding) || other.padding == padding)&&(identical(other.nightMode, nightMode) || other.nightMode == nightMode)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.translationMode, translationMode) || other.translationMode == translationMode)&&(identical(other.loadImages, loadImages) || other.loadImages == loadImages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,tid,const DeepCollectionEquality().hash(_contents),chapterTitle,currentChapterIndex,const DeepCollectionEquality().hash(_chapters),currentPage,maxPageNum,authorId,currentPostIndex,scrollOffset,isLoading,isError,errorMessage,fontSize,lineHeight,letterSpacing,padding,nightMode,fontFamily,translationMode,loadImages]);

@override
String toString() {
  return 'ReaderState(tid: $tid, contents: $contents, chapterTitle: $chapterTitle, currentChapterIndex: $currentChapterIndex, chapters: $chapters, currentPage: $currentPage, maxPageNum: $maxPageNum, authorId: $authorId, currentPostIndex: $currentPostIndex, scrollOffset: $scrollOffset, isLoading: $isLoading, isError: $isError, errorMessage: $errorMessage, fontSize: $fontSize, lineHeight: $lineHeight, letterSpacing: $letterSpacing, padding: $padding, nightMode: $nightMode, fontFamily: $fontFamily, translationMode: $translationMode, loadImages: $loadImages)';
}


}

/// @nodoc
abstract mixin class _$ReaderStateCopyWith<$Res> implements $ReaderStateCopyWith<$Res> {
  factory _$ReaderStateCopyWith(_ReaderState value, $Res Function(_ReaderState) _then) = __$ReaderStateCopyWithImpl;
@override @useResult
$Res call({
 String tid, List<Content> contents, String chapterTitle, int currentChapterIndex, List<ChapterInfo> chapters, int currentPage, int maxPageNum, String authorId, int currentPostIndex, double scrollOffset, bool isLoading, bool isError, String errorMessage, double fontSize, double lineHeight, double letterSpacing, double padding, bool nightMode, int fontFamily, int translationMode, bool loadImages
});




}
/// @nodoc
class __$ReaderStateCopyWithImpl<$Res>
    implements _$ReaderStateCopyWith<$Res> {
  __$ReaderStateCopyWithImpl(this._self, this._then);

  final _ReaderState _self;
  final $Res Function(_ReaderState) _then;

/// Create a copy of ReaderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tid = null,Object? contents = null,Object? chapterTitle = null,Object? currentChapterIndex = null,Object? chapters = null,Object? currentPage = null,Object? maxPageNum = null,Object? authorId = null,Object? currentPostIndex = null,Object? scrollOffset = null,Object? isLoading = null,Object? isError = null,Object? errorMessage = null,Object? fontSize = null,Object? lineHeight = null,Object? letterSpacing = null,Object? padding = null,Object? nightMode = null,Object? fontFamily = null,Object? translationMode = null,Object? loadImages = null,}) {
  return _then(_ReaderState(
tid: null == tid ? _self.tid : tid // ignore: cast_nullable_to_non_nullable
as String,contents: null == contents ? _self._contents : contents // ignore: cast_nullable_to_non_nullable
as List<Content>,chapterTitle: null == chapterTitle ? _self.chapterTitle : chapterTitle // ignore: cast_nullable_to_non_nullable
as String,currentChapterIndex: null == currentChapterIndex ? _self.currentChapterIndex : currentChapterIndex // ignore: cast_nullable_to_non_nullable
as int,chapters: null == chapters ? _self._chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<ChapterInfo>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,maxPageNum: null == maxPageNum ? _self.maxPageNum : maxPageNum // ignore: cast_nullable_to_non_nullable
as int,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,currentPostIndex: null == currentPostIndex ? _self.currentPostIndex : currentPostIndex // ignore: cast_nullable_to_non_nullable
as int,scrollOffset: null == scrollOffset ? _self.scrollOffset : scrollOffset // ignore: cast_nullable_to_non_nullable
as double,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,fontSize: null == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
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
