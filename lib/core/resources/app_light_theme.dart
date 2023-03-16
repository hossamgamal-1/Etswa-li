import 'package:flutter/material.dart';

import 'color_manager.dart';

class AppLightTheme {
  ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    canvasColor: ColorManager.white,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: ColorManager.white,
      onPrimary: ColorManager.white,
      secondary: ColorManager.cursorColor,
      onSecondary: ColorManager.cursorColor,
      error: ColorManager.offerPriceColor,
      onError: ColorManager.offerPriceColor,
      background: ColorManager.white,
      onBackground: ColorManager.white,
      surface: ColorManager.black,
      onSurface: ColorManager.black,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      foregroundColor: ColorManager.black,
      elevation: 0,
    ),
  );
}
