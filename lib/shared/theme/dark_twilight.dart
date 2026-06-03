import 'package:flutter/material.dart';

class DarkTwilight {
  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF13191F),
        colorScheme: const ColorScheme.dark(
          surface: Color(0xFF1A222B),
          primary: Color(0xFF5C8DB5),
          secondary: Color(0xFF2C3E50),
          onPrimary: Color(0xFFFFFFFF),
          onSecondary: Color(0xFFE0E0E0),
          onSurface: Color(0xFFE0E0E0),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color(0xFF1A222B),
          foregroundColor: Color(0xFFE0E0E0),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF1A222B),
          selectedItemColor: Color(0xFF5C8DB5),
          unselectedItemColor: Color(0xFF666666),
        ),
      );
}
