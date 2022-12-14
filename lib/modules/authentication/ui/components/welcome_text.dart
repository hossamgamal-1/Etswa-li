import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/email_password_auth_controller.dart';
import 'auth_strings.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EmailPasswordAuthController watch =
        context.watch<EmailPasswordAuthController>();

    return RichText(
      text: TextSpan(
          text: watch.currentAuthMode == AuthMode.logIn
              ? AuthStrings.welcomeTextSignIn
              : AuthStrings.welcomeTextSignUp,
          style: const TextStyle(
            letterSpacing: 2,
            color: Colors.black,
            fontFamily: 'Poppings',
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
          children: const [
            TextSpan(
              text: '\nCONTINUE',
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.w500,
                fontFamily: 'Quicksand',
              ),
            ),
          ]),
    );
  }
}
