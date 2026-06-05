// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostCacheData _$PostCacheDataFromJson(Map<String, dynamic> json) =>
    _PostCacheData(
      postIndex: (json['postIndex'] as num).toInt(),
      authorId: json['authorId'] as String,
      contents: (json['contents'] as List<dynamic>)
          .map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
      chapterTitle: json['chapterTitle'] as String,
    );

Map<String, dynamic> _$PostCacheDataToJson(_PostCacheData instance) =>
    <String, dynamic>{
      'postIndex': instance.postIndex,
      'authorId': instance.authorId,
      'contents': instance.contents,
      'chapterTitle': instance.chapterTitle,
    };

_CacheData _$CacheDataFromJson(Map<String, dynamic> json) => _CacheData(
  key: json['key'] as String,
  posts: (json['posts'] as List<dynamic>)
      .map((e) => PostCacheData.fromJson(e as Map<String, dynamic>))
      .toList(),
  maxPageNum: (json['maxPageNum'] as num?)?.toInt() ?? 1,
  cachedAt: DateTime.parse(json['cachedAt'] as String),
);

Map<String, dynamic> _$CacheDataToJson(_CacheData instance) =>
    <String, dynamic>{
      'key': instance.key,
      'posts': instance.posts,
      'maxPageNum': instance.maxPageNum,
      'cachedAt': instance.cachedAt.toIso8601String(),
    };
