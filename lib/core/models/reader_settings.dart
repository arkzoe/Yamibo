import 'package:freezed_annotation/freezed_annotation.dart';

part 'reader_settings.freezed.dart';
part 'reader_settings.g.dart';

@freezed
sealed class ReaderSettings with _$ReaderSettings {
  const factory ReaderSettings({
    @Default(18.0) double fontSize,
    @Default(28.0) double lineHeight,
    @Default(0.0) double letterSpacing,
    @Default(16.0) double padding,
    @Default(false) bool nightMode,
    @Default(0) int fontFamily,
    @Default(0) int translationMode,
    @Default(true) bool loadImages,
  }) = _ReaderSettings;

  factory ReaderSettings.fromJson(Map<String, dynamic> json) =>
      _$ReaderSettingsFromJson(json);
}
