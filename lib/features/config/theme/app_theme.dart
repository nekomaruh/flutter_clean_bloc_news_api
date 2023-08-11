import 'package:flutter/material.dart';

const String _fontFamily = 'Muli';

/// Contains the theme of the app
class AppTheme {
  /// Main theme of the app
  static ThemeData get main => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: _fontFamily,
        appBarTheme: _appBarTheme,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      );

  /// AppBar theme
  static AppBarTheme get _appBarTheme => const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Color(0XFF8B8B8B)),
      titleTextStyle: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    );
}
