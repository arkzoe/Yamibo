import 'package:flutter/material.dart';

class DarkOled {
  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF000000),
        colorScheme: const ColorScheme.dark(
          surface: Color(0xFF0A0A0A),
          primary: Color(0xFF551200),
          secondary: Color(0xFFFFF0CC),
          onPrimary: Color(0xFFE0E0E0),
          onSecondary: Color(0xFF333333),
          onSurface: Color(0xFFE0E0E0),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color(0xFF000000),
          foregroundColor: Color(0xFFE0E0E0),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF0A0A0A),
          selectedItemColor: Color(0xFFFFF0CC),
          unselectedItemColor: Color(0xFF555555),
        ),
      );
}
