import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/models/content.dart';
import 'chapter_info.dart';

part 'reader_state.freezed.dart';
part 'reader_state.g.dart';

@freezed
sealed class ReaderState with _$ReaderState {
  const factory ReaderState({
    required String tid,
    @Default([]) List<Content> contents,
    @Default('') String chapterTitle,
    @Default(0) int currentChapterIndex,
    @Default([]) List<ChapterInfo> chapters,
    @Default(1) int currentPage,
    @Default(1) int maxPageNum,
    @Default('') String authorId,
    @Default(0) int currentPostIndex,
    @Default(0.0) double scrollOffset,
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default('') String errorMessage,
    @Default(18.0) double fontSize,
    @Default(28.0) double lineHeight,
    @Default(0.0) double letterSpacing,
    @Default(16.0) double padding,
    @Default(false) bool nightMode,
    @Default(0) int fontFamily,
    @Default(0) int translationMode,
    @Default(true) bool loadImages,
  }) = _ReaderState;

  factory ReaderState.fromJson(Map<String, dynamic> json) =>
      _$ReaderStateFromJson(json);
}
