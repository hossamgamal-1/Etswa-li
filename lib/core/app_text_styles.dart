import 'package:e_commerce/core/themes/app_light_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  TextStyle get productTitle =>
      TextStyle(fontFamily: 'Poppins', fontSize: 3.5.sp);
  TextStyle get mainTitle => TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        fontSize: 4.5.sp,
        color: AppLightTheme.foregroundColor,
      );
}
