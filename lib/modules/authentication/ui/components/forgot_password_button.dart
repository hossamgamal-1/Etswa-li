import 'package:flutter/material.dart';

import '../../../../ui/resources/color_manager.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)))),
      child: const Text(
        'Forgot your password?',
        style: TextStyle(color: ColorManager.cyan, fontSize: 12),
      ),
      onPressed: () {
        //SnackBar
        /*   showToast(
          'طب ما دي غلطتك يا نجم',
          context: context,
          borderRadius: BorderRadius.circular(50),
          duration: const Duration(seconds: 1),
          reverseAnimation: StyledToastAnimation.fade,
          backgroundColor:
              const Color.fromARGB(255, 228, 228, 228),
          textStyle: const TextStyle(
              color: Color.fromARGB(255, 48, 48, 48),
              fontSize: 16),
        );
       */
      },
    );
  }
}
