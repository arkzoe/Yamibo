// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CacheData _$CacheDataFromJson(Map<String, dynamic> json) => _CacheData(
  key: json['key'] as String,
  htmlContent: json['htmlContent'] as String,
  maxPageNum: (json['maxPageNum'] as num?)?.toInt() ?? 1,
  authorId: json['authorId'] as String? ?? '',
  cachedAt: DateTime.parse(json['cachedAt'] as String),
);

Map<String, dynamic> _$CacheDataToJson(_CacheData instance) =>
    <String, dynamic>{
      'key': instance.key,
      'htmlContent': instance.htmlContent,
      'maxPageNum': instance.maxPageNum,
      'authorId': instance.authorId,
      'cachedAt': instance.cachedAt.toIso8601String(),
    };
