import 'package:flutter/material.dart';

class FontsConstants {
  static const String fontFamily = 'Poppins';
}

class FontSize {
  static const double s3 = 3;
  static const double s3_2 = 3.2;
  static const double s4 = 4;
  static const double s4_4 = 4.4;
  static const double s4_8 = 4.8;
  static const double s5_8 = 5.8;
  static const double s6_2 = 6.2;
  static const double s16 = 16;
}

TextStyle _getTextStyle(
        {required Color color,
        required double fontSize,
        required FontWeight fontWeight}) =>
    TextStyle(
        fontFamily: FontsConstants.fontFamily,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight);

TextStyle getLightTextStyle(
    {required Color color, double fontSize = FontSize.s16}) {
  return _getTextStyle(
      color: color, fontSize: fontSize, fontWeight: FontWeight.w300);
}

TextStyle getRegularTextStyle(
    {required Color color, double fontSize = FontSize.s16}) {
  return _getTextStyle(
      color: color, fontSize: fontSize, fontWeight: FontWeight.w400);
}

TextStyle getMediumTextStyle(
    {required Color color, double fontSize = FontSize.s16}) {
  return _getTextStyle(
      color: color, fontSize: fontSize, fontWeight: FontWeight.w500);
}

TextStyle getSemiBoldTextStyle(
    {required Color color, double fontSize = FontSize.s16}) {
  return _getTextStyle(
      color: color, fontSize: fontSize, fontWeight: FontWeight.w600);
}

TextStyle getBoldTextStyle(
    {required Color color, double fontSize = FontSize.s16}) {
  return _getTextStyle(
      color: color, fontSize: fontSize, fontWeight: FontWeight.w700);
}
