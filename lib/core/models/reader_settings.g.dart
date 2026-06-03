// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reader_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReaderSettings _$ReaderSettingsFromJson(Map<String, dynamic> json) =>
    _ReaderSettings(
      fontSize: (json['fontSize'] as num?)?.toDouble() ?? 18.0,
      lineHeight: (json['lineHeight'] as num?)?.toDouble() ?? 28.0,
      letterSpacing: (json['letterSpacing'] as num?)?.toDouble() ?? 0.0,
      padding: (json['padding'] as num?)?.toDouble() ?? 16.0,
      nightMode: json['nightMode'] as bool? ?? false,
      fontFamily: (json['fontFamily'] as num?)?.toInt() ?? 0,
      translationMode: (json['translationMode'] as num?)?.toInt() ?? 0,
      loadImages: json['loadImages'] as bool? ?? true,
    );

Map<String, dynamic> _$ReaderSettingsToJson(_ReaderSettings instance) =>
    <String, dynamic>{
      'fontSize': instance.fontSize,
      'lineHeight': instance.lineHeight,
      'letterSpacing': instance.letterSpacing,
      'padding': instance.padding,
      'nightMode': instance.nightMode,
      'fontFamily': instance.fontFamily,
      'translationMode': instance.translationMode,
      'loadImages': instance.loadImages,
    };
