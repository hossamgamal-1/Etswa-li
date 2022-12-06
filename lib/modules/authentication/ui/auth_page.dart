import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../controller/auth_controller.dart';
// import 'components/auth_mode_switch.dart';
import 'components/email_text_field.dart';
import 'components/password_text_field.dart';
// import 'components/reset_password_text_field.dart';
import 'components/welcome_text.dart';
import 'components/auth_button.dart';
// import 'components/forgot_password_button.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController watch = context.watch<AuthController>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const WelcomeText(),
            SizedBox(height: 5.h),
            Form(
              key: watch.logInKey,
              child: Column(
                children: const [
                  EmailTextField(),
                  PasswordTextField(),
                  /*  if (watch.currentAuthMode == AuthMode.signUp)
                    const ResetPasswordTextField(), */
                  AuthButton(),
                  /* if (watch.currentAuthMode == AuthMode.logIn)
                    const ForgotPasswordButton(), */
                  //AuthModeSwitch()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
