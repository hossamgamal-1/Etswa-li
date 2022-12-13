import 'package:e_commerce/core/themes/app_light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../controller/email_password_auth_controller.dart';
import 'auth_strings.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    EmailPasswordAuthController watch =
        context.watch<EmailPasswordAuthController>();
    EmailPasswordAuthController read =
        context.read<EmailPasswordAuthController>();
    return Container(
      width: 80.w,
      margin: EdgeInsets.all(1.25.h),
      decoration: BoxDecoration(
        color: AppLightTheme.textFieldBackgroundColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        validator: (value) => (value == null || value.length < 8)
            ? AuthStrings.validatorShortPasswordText
            : null,
        onSaved: read.passwordTextFieldOnSave,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () => setState(() {
              watch.isObsecure = !watch.isObsecure;
            }), //; read.visibleOnOffSwitcher(),
            icon: watch.isObsecure
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
            color: AppLightTheme.unSelectedIconColor,
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
