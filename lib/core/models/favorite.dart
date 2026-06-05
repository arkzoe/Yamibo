import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite.freezed.dart';
part 'favorite.g.dart';

@freezed
sealed class FavoriteItem with _$FavoriteItem {
  const factory FavoriteItem({
    required String id,
    required String title,
    required String url,
    @Default('') String author,
    @Default('') String authorId,
    @Default('') String lastReply,
    @Default(0) int sortOrder,
    @Default(false) bool isSelected,
    @Default(0) int type,
  }) = _FavoriteItem;

  factory FavoriteItem.fromJson(Map<String, dynamic> json) =>
      _$FavoriteItemFromJson(json);
}
