import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../core/resources/color_manager.dart';
import '../phone_auth_page.dart';

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
        boxer(Icons.facebook, color: ColorManager.blue),
        boxer(Icons.email, color: ColorManager.cyan),
      ],
    );
  }

  InkWell boxer(IconData iconData,
      {Color color = ColorManager.black, Function()? function}) {
    return InkWell(
      onTap: function == null ? null : () => function(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        width: 50,
        color: color,
        child: Icon(iconData, size: 40, color: ColorManager.white),
      ),
    );
  }
}
