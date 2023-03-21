import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'components/auth_mode_switch.dart';
import 'components/email_text_field.dart';
import 'components/other_auth_ways.dart';
import 'components/password_text_field.dart';
import 'components/reset_password_text_field.dart';
import 'components/welcome_text.dart';
import 'components/auth_button.dart';
import 'components/forgot_password_button.dart';
import '../business_logic/email_password_auth_controller.dart';

class MainAuthPage extends StatelessWidget {
  const MainAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EmailPasswordAuthController watch =
        context.watch<EmailPasswordAuthController>();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 25.h),
              const WelcomeText(),
              SizedBox(height: 5.h),
              Form(
                key: watch.logInKey,
                child: Column(
                  children: [
                    const EmailTextField(),
                    const PasswordTextField(),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      constraints: BoxConstraints(
                        maxHeight:
                            watch.currentAuthMode == AuthMode.logIn ? 0 : 10.h,
                      ),
                      child: (watch.currentAuthMode == AuthMode.signUp)
                          ? const ResetPasswordTextField()
                          : null,
                    ),
                    const AuthButton(),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      constraints: BoxConstraints(
                        maxHeight:
                            watch.currentAuthMode == AuthMode.signUp ? 0 : 50,
                      ),
                      child: (watch.currentAuthMode == AuthMode.logIn)
                          ? const ForgotPasswordButton()
                          : null,
                    ),
                    const AuthModeSwitch(),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
              SizedBox(
                width: 80.w,
                child: Row(children: [
                  Expanded(child: Divider(thickness: 0.5.w)),
                  const SizedBox(width: 5),
                  const Text('Want other sign up ways?'),
                  const SizedBox(width: 5),
                  Expanded(child: Divider(thickness: 0.5.w)),
                ]),
              ),
              SizedBox(height: 2.h),
              const OtherAuthWays(),
            ],
          ),
        ),
      ),
    );
  }
}
