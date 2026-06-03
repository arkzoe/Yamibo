// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MangaSettings _$MangaSettingsFromJson(Map<String, dynamic> json) =>
    _MangaSettings(
      readingMode: (json['readingMode'] as num?)?.toInt() ?? 0,
      fitWidth: json['fitWidth'] as bool? ?? false,
    );

Map<String, dynamic> _$MangaSettingsToJson(_MangaSettings instance) =>
    <String, dynamic>{
      'readingMode': instance.readingMode,
      'fitWidth': instance.fitWidth,
    };
