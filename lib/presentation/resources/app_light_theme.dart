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
      secondary: ColorManager.primaryColor,
      onSecondary: ColorManager.primaryColor,
      error: ColorManager.offerPriceColor,
      onError: ColorManager.offerPriceColor,
      background: ColorManager.white,
      onBackground: ColorManager.white,
      surface: ColorManager.black,
      onSurface: ColorManager.black,
    ),
    splashColor: ColorManager.transparent,
    highlightColor: ColorManager.transparent,
    hoverColor: ColorManager.transparent,
    hintColor: ColorManager.transparent,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      foregroundColor: ColorManager.black,
      elevation: 0,
    ),
  );
}
