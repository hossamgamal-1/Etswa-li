/* import 'package:e_commerce/core/themes/app_light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../controller/auth_controller.dart';

class ResetPasswordTextField extends StatelessWidget {
  const ResetPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController watch = context.watch<AuthController>();
    AuthController read = context.read<AuthController>();
    return Container(
      width: 80.w,
      decoration: BoxDecoration(
        color: AppLightTheme.textFieldBackgroundColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Confirm Password',
          suffixIcon: IconButton(
            onPressed: () => read.visibleOnOffSwitcher(),
            icon: Icon(watch.eye),
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
          hintStyle:
              const TextStyle(color: AppLightTheme.textFieldForegroundColor),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.transparent)),
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: watch.isObsecure,
        validator: read.resetPasswordValidator,
      ),
    );
  }
}
 */