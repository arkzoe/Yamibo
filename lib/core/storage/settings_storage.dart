import 'package:shared_preferences/shared_preferences.dart';

class SettingsStorage {
  SettingsStorage._();

  static const _keyThemeMode = 'theme_mode';
  static const _keyFontSize = 'font_size';
  static const _keyLineHeight = 'line_height';
  static const _keyLoadImages = 'load_images';

  static Future<int> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_keyThemeMode) ?? 0;
  }

  static Future<void> setThemeMode(int mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyThemeMode, mode);
  }

  static Future<double> getFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_keyFontSize) ?? 18.0;
  }

  static Future<void> setFontSize(double size) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_keyFontSize, size);
  }

  static Future<double> getLineHeight() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_keyLineHeight) ?? 28.0;
  }

  static Future<void> setLineHeight(double height) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_keyLineHeight, height);
  }

  static Future<bool> getLoadImages() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyLoadImages) ?? true;
  }

  static Future<void> setLoadImages(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyLoadImages, value);
  }
}
