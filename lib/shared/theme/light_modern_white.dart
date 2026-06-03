import 'package:flutter/material.dart';

class LightModernWhite {
  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        colorScheme: const ColorScheme.light(
          surface: Color(0xFFF5F5F5),
          primary: Color(0xFF5A5A5A),
          secondary: Color(0xFFE0E0E0),
          onPrimary: Color(0xFFFFFFFF),
          onSecondary: Color(0xFF333333),
          onSurface: Color(0xFF333333),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF333333),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFF5A5A5A),
          unselectedItemColor: Color(0xFF999999),
        ),
      );
}
