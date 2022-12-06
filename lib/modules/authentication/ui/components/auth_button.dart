import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../controller/auth_controller.dart';
import '../../../../core/themes/app_light_theme.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    // AuthController watch = context.watch<AuthController>();
    AuthController read = context.read<AuthController>();

    return Container(
      margin: EdgeInsets.all(1.25.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(210, 0, 251, 255),
            Color.fromARGB(210, 92, 62, 241),
            Color.fromARGB(210, 251, 0, 255),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextButton(
        onPressed: () => read.authButtonOnPressed(context),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Text(
            /* watch.currentAuthMode == AuthMode.logIn ? */ 'Log in' /* : 'Sign up' */,
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 18,
              color: AppLightTheme.canvasColor,
              fontWeight: FontWeight.w400,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
}
