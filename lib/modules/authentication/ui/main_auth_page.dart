import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'components/auth_mode_switch.dart';
import 'components/email_text_field.dart';
import 'components/password_text_field.dart';
import 'components/reset_password_text_field.dart';
import 'components/welcome_text.dart';
import 'components/auth_button.dart';
import 'components/forgot_password_button.dart';
import '../controller/email_password_auth_controller.dart';
import 'phone_auth_page.dart';

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
                    //
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

class OtherAuthWays extends StatelessWidget {
  const OtherAuthWays({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        boxer(
          Icons.phone,
          color: const Color.fromARGB(255, 122, 206, 27),
          function: () => Navigator.push(
              context,
              PageTransition(
                  child: const PhoneAuthPage(),
                  type: PageTransitionType.bottomToTop)),
        ),
        boxer(Icons.facebook, color: Colors.blue),
        boxer(Icons.email, color: Colors.cyan),
      ],
    );
  }

  InkWell boxer(IconData iconData,
      {Color color = Colors.black, Function()? function}) {
    return InkWell(
      onTap: function == null ? null : () => function(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        width: 50,
        color: color,
        child: Icon(iconData, size: 40, color: Colors.white),
      ),
    );
  }
}
