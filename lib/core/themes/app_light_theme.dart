import 'package:flutter/material.dart';

class AppLightTheme {
  static const Color canvasColor = Colors.white;
  static const Color foregroundColor = Colors.black;
  static const Color cursorColor = Colors.blueAccent;
  static const Color unSelectedIconColor = Colors.grey;
  static const Color transperantColor = Colors.transparent;
  static const Color offerPriceColor = Colors.red;
  static const Color textFieldBackgroundColor =
      Color.fromARGB(255, 241, 241, 241);
  static const Color textFieldForegroundColor =
      Color.fromARGB(255, 136, 136, 136);

  ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    canvasColor: canvasColor,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: canvasColor,
      onPrimary: canvasColor,
      secondary: cursorColor,
      onSecondary: cursorColor,
      error: offerPriceColor,
      onError: offerPriceColor,
      background: canvasColor,
      onBackground: canvasColor,
      surface: foregroundColor,
      onSurface: foregroundColor,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      foregroundColor: foregroundColor,
      elevation: 0,
    ),
  );
}
