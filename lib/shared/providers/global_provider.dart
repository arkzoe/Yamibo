import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/storage/settings_storage.dart';
import '../theme/app_theme.dart';

final themeModeProvider = NotifierProvider<ThemeModeNotifier, AppThemeMode>(
  ThemeModeNotifier.new,
);

class ThemeModeNotifier extends Notifier<AppThemeMode> {
  @override
  AppThemeMode build() {
    _init();
    return AppThemeMode.light;
  }

  Future<void> _init() async {
    final mode = await SettingsStorage.getThemeMode();
    state = AppTheme.fromInt(mode);
  }

  Future<void> setTheme(AppThemeMode mode) async {
    state = mode;
    await SettingsStorage.setThemeMode(mode.index);
  }
}
