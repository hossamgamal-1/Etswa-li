import 'package:e_commerce/modules/authentication/ui/components/auth_strings.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../controller/auth_controller.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AuthController watch = context.watch<AuthController>();

    return RichText(
      text: const TextSpan(
          text: /*  watch.currentAuthMode == AuthMode.logIn
              ? */
              AuthStrings.welcomeTextSignIn
          // : AuthStrings.welcomeTextSignUp
          ,
          style: TextStyle(
            letterSpacing: 2,
            color: Colors.black,
            fontFamily: 'Poppings',
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
          children: [
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
