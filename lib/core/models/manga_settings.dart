import 'package:freezed_annotation/freezed_annotation.dart';

part 'manga_settings.freezed.dart';
part 'manga_settings.g.dart';

@freezed
sealed class MangaSettings with _$MangaSettings {
  const factory MangaSettings({
    @Default(0) int readingMode,
    @Default(false) bool fitWidth,
  }) = _MangaSettings;

  factory MangaSettings.fromJson(Map<String, dynamic> json) =>
      _$MangaSettingsFromJson(json);
}
