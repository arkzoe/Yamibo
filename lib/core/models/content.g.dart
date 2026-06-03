// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Content _$ContentFromJson(Map<String, dynamic> json) => _Content(
  type: $enumDecode(_$ContentTypeEnumMap, json['type']),
  data: json['data'] as String,
  isChapterTitle: json['isChapterTitle'] as bool? ?? false,
);

Map<String, dynamic> _$ContentToJson(_Content instance) => <String, dynamic>{
  'type': _$ContentTypeEnumMap[instance.type]!,
  'data': instance.data,
  'isChapterTitle': instance.isChapterTitle,
};

const _$ContentTypeEnumMap = {
  ContentType.text: 'text',
  ContentType.image: 'image',
};
