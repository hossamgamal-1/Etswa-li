/* import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/auth_controller.dart';

class AuthModeSwitch extends StatelessWidget {
  const AuthModeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController watch = context.watch<AuthController>();
    AuthController read = context.read<AuthController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            watch.currentAuthMode == AuthMode.logIn
                ? 'Don\'t You Have an Account?'
                : 'You Already Have an Account?',
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
        TextButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)))),
            child: Text(
              watch.currentAuthMode == AuthMode.logIn ? 'Sign up' : 'Log in',
              style: const TextStyle(color: Colors.cyan, fontSize: 12),
            ),
            onPressed: () => read.authModeSwitcher()),
      ],
    );
  }
}
 */