import 'package:freezed_annotation/freezed_annotation.dart';
import 'content.dart';

part 'cache_data.freezed.dart';
part 'cache_data.g.dart';

@freezed
sealed class PostCacheData with _$PostCacheData {
  const factory PostCacheData({
    required int postIndex,
    required String authorId,
    required List<Content> contents,
    required String chapterTitle,
  }) = _PostCacheData;

  factory PostCacheData.fromJson(Map<String, dynamic> json) =>
      _$PostCacheDataFromJson(json);
}

@freezed
sealed class CacheData with _$CacheData {
  const factory CacheData({
    required String key,
    required List<PostCacheData> posts,
    @Default(1) int maxPageNum,
    required DateTime cachedAt,
  }) = _CacheData;

  factory CacheData.fromJson(Map<String, dynamic> json) =>
      _$CacheDataFromJson(json);
}
