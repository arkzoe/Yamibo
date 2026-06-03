// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FavoriteItem _$FavoriteItemFromJson(Map<String, dynamic> json) =>
    _FavoriteItem(
      id: json['id'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      author: json['author'] as String? ?? '',
      lastReply: json['lastReply'] as String? ?? '',
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$FavoriteItemToJson(_FavoriteItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'author': instance.author,
      'lastReply': instance.lastReply,
      'sortOrder': instance.sortOrder,
      'isSelected': instance.isSelected,
    };
