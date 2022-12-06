import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/themes/app_light_theme.dart';
import '../../controller/auth_controller.dart';
import 'auth_strings.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController read = context.read<AuthController>();

    return Container(
      width: 80.w,
      margin: EdgeInsets.all(1.25.h),
      decoration: BoxDecoration(
        color: AppLightTheme.textFieldBackgroundColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        validator: read.emailTextFieldValidator,
        onSaved: read.emailTextFieldOnSave,
        decoration: InputDecoration(
          hintText: AuthStrings.emailTextFieldHintText,
          hintStyle:
              const TextStyle(color: AppLightTheme.textFieldForegroundColor),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: Colors.transparent)),
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
