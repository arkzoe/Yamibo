import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/storage/settings_storage.dart';

class ReaderConfigState {
  final double fontSize;
  final double lineHeight;
  final bool loadImages;

  const ReaderConfigState({
    this.fontSize = 18.0,
    this.lineHeight = 28.0,
    this.loadImages = true,
  });

  ReaderConfigState copyWith({
    double? fontSize,
    double? lineHeight,
    bool? loadImages,
  }) {
    return ReaderConfigState(
      fontSize: fontSize ?? this.fontSize,
      lineHeight: lineHeight ?? this.lineHeight,
      loadImages: loadImages ?? this.loadImages,
    );
  }
}

class SettingsNotifier extends AsyncNotifier<ReaderConfigState> {
  @override
  Future<ReaderConfigState> build() async {
    final fontSize = await SettingsStorage.getFontSize();
    final lineHeight = await SettingsStorage.getLineHeight();
    final loadImages = await SettingsStorage.getLoadImages();
    return ReaderConfigState(
      fontSize: fontSize,
      lineHeight: lineHeight,
      loadImages: loadImages,
    );
  }

  Future<void> setFontSize(double size) async {
    final current = state.asData?.value ?? const ReaderConfigState();
    state = AsyncValue.data(current.copyWith(fontSize: size));
    await SettingsStorage.setFontSize(size);
  }

  Future<void> setLineHeight(double height) async {
    final current = state.asData?.value ?? const ReaderConfigState();
    state = AsyncValue.data(current.copyWith(lineHeight: height));
    await SettingsStorage.setLineHeight(height);
  }

  Future<void> setLoadImages(bool value) async {
    final current = state.asData?.value ?? const ReaderConfigState();
    state = AsyncValue.data(current.copyWith(loadImages: value));
    await SettingsStorage.setLoadImages(value);
  }
}

final settingsProvider = AsyncNotifierProvider<SettingsNotifier, ReaderConfigState>(
  SettingsNotifier.new,
);
