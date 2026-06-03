import 'package:flutter/material.dart';

class DarkOklch {
  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF15151F),
        colorScheme: const ColorScheme.dark(
          surface: Color(0xFF1C1C2A),
          primary: Color(0xFF7C6CA0),
          secondary: Color(0xFF4A3F6B),
          onPrimary: Color(0xFFFFFFFF),
          onSecondary: Color(0xFFE0E0E0),
          onSurface: Color(0xFFE8E8E8),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color(0xFF1C1C2A),
          foregroundColor: Color(0xFFE8E8E8),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF1C1C2A),
          selectedItemColor: Color(0xFF7C6CA0),
          unselectedItemColor: Color(0xFF6A6A7A),
        ),
      );
}
