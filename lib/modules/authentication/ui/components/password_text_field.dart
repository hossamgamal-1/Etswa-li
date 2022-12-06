import 'package:e_commerce/core/themes/app_light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../controller/auth_controller.dart';
import 'auth_strings.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController watch = context.watch<AuthController>();
    AuthController read = context.read<AuthController>();
    return Container(
      width: 80.w,
      margin: EdgeInsets.all(1.25.h),
      decoration: BoxDecoration(
        color: AppLightTheme.textFieldBackgroundColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        validator: read.passwordTextFieldValidator,
        onSaved: read.passwordTextFieldOnSave,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () => read.visibleOnOffSwitcher(),
            icon: Icon(watch.eye),
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
          hintText: AuthStrings.passwordTextFieldHintText,
          hintStyle:
              const TextStyle(color: AppLightTheme.textFieldForegroundColor),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppLightTheme.transperantColor),
          ),
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: watch.isObsecure,
        controller: watch.passwordcontroller,
      ),
    );
  }
}
