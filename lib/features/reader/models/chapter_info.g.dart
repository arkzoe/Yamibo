// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChapterInfo _$ChapterInfoFromJson(Map<String, dynamic> json) => _ChapterInfo(
  tid: json['tid'] as String,
  title: json['title'] as String,
  page: (json['page'] as num?)?.toInt() ?? 1,
  authorId: json['authorId'] as String? ?? '',
  index: (json['index'] as num?)?.toInt() ?? 0,
  postIndex: (json['postIndex'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ChapterInfoToJson(_ChapterInfo instance) =>
    <String, dynamic>{
      'tid': instance.tid,
      'title': instance.title,
      'page': instance.page,
      'authorId': instance.authorId,
      'index': instance.index,
      'postIndex': instance.postIndex,
    };
