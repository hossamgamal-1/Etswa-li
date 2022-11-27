import 'package:flutter/material.dart';

class AppLightTheme {
  static Color canvasColor = Colors.white;
  static Color foregroundColor = Colors.black;
  ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    canvasColor: canvasColor,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: canvasColor,
      onPrimary: Colors.transparent,
      secondary: Colors.transparent,
      onSecondary: Colors.transparent,
      error: Colors.transparent,
      onError: Colors.transparent,
      background: Colors.transparent,
      onBackground: Colors.transparent,
      surface: Colors.transparent,
      onSurface: Colors.transparent,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      foregroundColor: foregroundColor,
      elevation: 0,
    ),
  );
}
