import 'package:freezed_annotation/freezed_annotation.dart';

part 'content.freezed.dart';
part 'content.g.dart';

enum ContentType { text, image }

@freezed
sealed class Content with _$Content {
  const factory Content({
    required ContentType type,
    required String data,
    @Default(false) bool isChapterTitle,
  }) = _Content;

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);
}
