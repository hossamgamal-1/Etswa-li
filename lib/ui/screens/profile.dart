import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../core/injection.dart';
import '../../modules/authentication/auth.dart';
import '../../modules/authentication/ui/main_auth_page.dart';
import '../controllers/home_page_controller.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color.fromARGB(255, 223, 223, 223),
          ),
        ),
        child: const Text(
          'Sign Out',
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () {
          Auth(getIt(), getIt()).signOutEmailAndPassword();
          Navigator.pushReplacement(
            context,
            PageTransition(
                child: const MainAuthPage(), type: PageTransitionType.fade),
          );
          context.read<HomePageController>().bottomNavigatorIndexSetter(0);
        },
      ),
    );
  }
}
