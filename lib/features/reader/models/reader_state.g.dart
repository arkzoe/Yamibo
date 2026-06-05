// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reader_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReaderState _$ReaderStateFromJson(Map<String, dynamic> json) => _ReaderState(
  tid: json['tid'] as String,
  contents:
      (json['contents'] as List<dynamic>?)
          ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  chapterTitle: json['chapterTitle'] as String? ?? '',
  currentChapterIndex: (json['currentChapterIndex'] as num?)?.toInt() ?? 0,
  chapters:
      (json['chapters'] as List<dynamic>?)
          ?.map((e) => ChapterInfo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  currentPage: (json['currentPage'] as num?)?.toInt() ?? 1,
  maxPageNum: (json['maxPageNum'] as num?)?.toInt() ?? 1,
  authorId: json['authorId'] as String? ?? '',
  currentPostIndex: (json['currentPostIndex'] as num?)?.toInt() ?? 0,
  scrollOffset: (json['scrollOffset'] as num?)?.toDouble() ?? 0.0,
  isLoading: json['isLoading'] as bool? ?? false,
  isError: json['isError'] as bool? ?? false,
  errorMessage: json['errorMessage'] as String? ?? '',
  fontSize: (json['fontSize'] as num?)?.toDouble() ?? 18.0,
  lineHeight: (json['lineHeight'] as num?)?.toDouble() ?? 28.0,
  letterSpacing: (json['letterSpacing'] as num?)?.toDouble() ?? 0.0,
  padding: (json['padding'] as num?)?.toDouble() ?? 16.0,
  nightMode: json['nightMode'] as bool? ?? false,
  fontFamily: (json['fontFamily'] as num?)?.toInt() ?? 0,
  translationMode: (json['translationMode'] as num?)?.toInt() ?? 0,
  loadImages: json['loadImages'] as bool? ?? true,
);

Map<String, dynamic> _$ReaderStateToJson(_ReaderState instance) =>
    <String, dynamic>{
      'tid': instance.tid,
      'contents': instance.contents,
      'chapterTitle': instance.chapterTitle,
      'currentChapterIndex': instance.currentChapterIndex,
      'chapters': instance.chapters,
      'currentPage': instance.currentPage,
      'maxPageNum': instance.maxPageNum,
      'authorId': instance.authorId,
      'currentPostIndex': instance.currentPostIndex,
      'scrollOffset': instance.scrollOffset,
      'isLoading': instance.isLoading,
      'isError': instance.isError,
      'errorMessage': instance.errorMessage,
      'fontSize': instance.fontSize,
      'lineHeight': instance.lineHeight,
      'letterSpacing': instance.letterSpacing,
      'padding': instance.padding,
      'nightMode': instance.nightMode,
      'fontFamily': instance.fontFamily,
      'translationMode': instance.translationMode,
      'loadImages': instance.loadImages,
    };
