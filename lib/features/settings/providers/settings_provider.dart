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

class SettingsNotifier extends Notifier<ReaderConfigState> {
  @override
  ReaderConfigState build() {
    _init();
    return const ReaderConfigState();
  }

  Future<void> _init() async {
    final fontSize = await SettingsStorage.getFontSize();
    final lineHeight = await SettingsStorage.getLineHeight();
    final loadImages = await SettingsStorage.getLoadImages();
    state = ReaderConfigState(
      fontSize: fontSize,
      lineHeight: lineHeight,
      loadImages: loadImages,
    );
  }

  Future<void> setFontSize(double size) async {
    state = state.copyWith(fontSize: size);
    await SettingsStorage.setFontSize(size);
  }

  Future<void> setLineHeight(double height) async {
    state = state.copyWith(lineHeight: height);
    await SettingsStorage.setLineHeight(height);
  }

  Future<void> setLoadImages(bool value) async {
    state = state.copyWith(loadImages: value);
    await SettingsStorage.setLoadImages(value);
  }
}

final settingsProvider = NotifierProvider<SettingsNotifier, ReaderConfigState>(
  SettingsNotifier.new,
);
