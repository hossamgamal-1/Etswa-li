import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../ui/resources/color_manager.dart';
import '../../../../modules/authentication/ui/components/auth_strings.dart';
import '../../controller/email_password_auth_controller.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    EmailPasswordAuthController watch =
        context.watch<EmailPasswordAuthController>();
    EmailPasswordAuthController read =
        context.read<EmailPasswordAuthController>();

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
        onPressed: () {
          read.authButtonOnPressed(context);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(ColorManager.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        child: watch.isWaiting
            ? const CircularProgressIndicator(color: ColorManager.white)
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                child: Text(
                  watch.currentAuthMode == AuthMode.logIn
                      ? AuthStrings.buttonTextLogIn
                      : AuthStrings.buttonTextSignUp,
                  style: const TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 18,
                    color: ColorManager.white,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                  ),
                ),
              ),
      ),
    );
  }
}
