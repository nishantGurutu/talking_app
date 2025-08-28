import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.deepPurple,
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.deepPurple,
    scaffoldBackgroundColor: const Color(0xFF0F0F12),
    useMaterial3: true,
  );
}
