import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_manager.dart';

class AppTextStyles {
  static TextStyle get offerPercentageCircleTextStyle => TextStyle(
        fontSize: 3.sp,
        color: ColorManager.white,
      );
  static TextStyle get productTitle => TextStyle(
        fontFamily: 'Poppins',
        fontSize: 3.5.sp,
      );
  static TextStyle get categoryChipTextStyle => TextStyle(
        fontSize: 4.sp,
        fontWeight: FontWeight.w400,
        color: ColorManager.black,
      );
  static TextStyle get mainTitle => TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        fontSize: 4.5.sp,
        color: ColorManager.black,
      );
  static TextStyle get productPageButtonTextStyle => TextStyle(
        fontSize: 4.8.sp,
        fontWeight: FontWeight.w500,
        color: ColorManager.white,
      );
  static TextStyle get productPageDiscribtionTextStyle => TextStyle(
        fontSize: 4.8.sp,
        color: ColorManager.black,
      );
  static TextStyle get productPageAppBarTextStyle => TextStyle(
        fontSize: 5.8.sp,
        fontWeight: FontWeight.w400,
        color: ColorManager.black,
      );
  static TextStyle get productPageTitleTextStyle => TextStyle(
        fontSize: 6.2.sp,
        color: ColorManager.black,
      );
}
