import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/storage/settings_storage.dart';
import '../theme/app_theme.dart';

final themeModeProvider = AsyncNotifierProvider<ThemeModeNotifier, AppThemeMode>(
  ThemeModeNotifier.new,
);

class ThemeModeNotifier extends AsyncNotifier<AppThemeMode> {
  @override
  Future<AppThemeMode> build() async {
    final mode = await SettingsStorage.getThemeMode();
    return AppTheme.fromInt(mode);
  }

  Future<void> setTheme(AppThemeMode mode) async {
    state = AsyncValue.data(mode);
    await SettingsStorage.setThemeMode(mode.index);
  }
}
