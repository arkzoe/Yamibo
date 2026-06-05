import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_info.freezed.dart';
part 'chapter_info.g.dart';

@freezed
sealed class ChapterInfo with _$ChapterInfo {
  const factory ChapterInfo({
    required String tid,
    required String title,
    @Default(1) int page,
    @Default('') String authorId,
    @Default(0) int index,
    @Default(0) int postIndex,
  }) = _ChapterInfo;

  factory ChapterInfo.fromJson(Map<String, dynamic> json) =>
      _$ChapterInfoFromJson(json);
}
