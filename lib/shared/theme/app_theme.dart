import 'package:flutter/material.dart';
import 'light_modern_white.dart';
import 'dark_classic.dart';
import 'dark_oled.dart';
import 'dark_twilight.dart';
import 'dark_oklch.dart';

enum AppThemeMode {
  light,
  darkClassic,
  darkOled,
  darkTwilight,
  darkOklch,
}

class AppTheme {
  static ThemeData getTheme(AppThemeMode mode) {
    return switch (mode) {
      AppThemeMode.light => LightModernWhite.theme,
      AppThemeMode.darkClassic => DarkClassic.theme,
      AppThemeMode.darkOled => DarkOled.theme,
      AppThemeMode.darkTwilight => DarkTwilight.theme,
      AppThemeMode.darkOklch => DarkOklch.theme,
    };
  }

  static String getThemeName(AppThemeMode mode) {
    return switch (mode) {
      AppThemeMode.light => '简约白',
      AppThemeMode.darkClassic => '经典暗',
      AppThemeMode.darkOled => 'OLED 暗',
      AppThemeMode.darkTwilight => '灰蓝暮光',
      AppThemeMode.darkOklch => '紫夜',
    };
  }

  static IconData getThemeIcon(AppThemeMode mode) {
    return switch (mode) {
      AppThemeMode.light => Icons.light_mode,
      AppThemeMode.darkClassic => Icons.dark_mode,
      AppThemeMode.darkOled => Icons.mode_night,
      AppThemeMode.darkTwilight => Icons.nights_stay,
      AppThemeMode.darkOklch => Icons.nightlight_round,
    };
  }

  static AppThemeMode fromInt(int value) {
    return AppThemeMode.values[value.clamp(0, AppThemeMode.values.length - 1)];
  }
}
