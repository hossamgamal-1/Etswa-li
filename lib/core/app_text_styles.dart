import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/themes/app_light_theme.dart';

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
