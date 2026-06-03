// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HistoryEntry _$HistoryEntryFromJson(Map<String, dynamic> json) =>
    _HistoryEntry(
      id: json['id'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      type: json['type'] as String? ?? '',
      lastReadChapter: (json['lastReadChapter'] as num?)?.toInt() ?? 0,
      scrollOffset: (json['scrollOffset'] as num?)?.toDouble() ?? 0.0,
      lastReadAt: DateTime.parse(json['lastReadAt'] as String),
    );

Map<String, dynamic> _$HistoryEntryToJson(_HistoryEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'type': instance.type,
      'lastReadChapter': instance.lastReadChapter,
      'scrollOffset': instance.scrollOffset,
      'lastReadAt': instance.lastReadAt.toIso8601String(),
    };
