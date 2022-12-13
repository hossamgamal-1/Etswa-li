import 'package:e_commerce/modules/authentication/auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../core/injection.dart';
import '../../../ui/screens/home_page.dart';

enum AuthMode { logIn, signUp }

class EmailPasswordAuthController with ChangeNotifier {
  String email = '';
  String password = '';
  AuthMode currentAuthMode = AuthMode.logIn;
  bool isObsecure = true;
  bool isWaiting = false;
  GlobalKey<FormState> logInKey = GlobalKey();
  TextEditingController passwordcontroller = TextEditingController();

  authModeSwitcher() {
    currentAuthMode =
        (currentAuthMode == AuthMode.logIn) ? AuthMode.signUp : AuthMode.logIn;
    notifyListeners();
  }

  emailTextFieldOnSave(String? value) {
    email = value!;
    notifyListeners();
  }

  passwordTextFieldOnSave(String? value) {
    password = value!;
    notifyListeners();
  }

  authButtonOnPressed(BuildContext context) async {
    if (logInKey.currentState!.validate()) {
      logInKey.currentState!.save();
      isWaiting = true;
      notifyListeners();
      currentAuthMode == AuthMode.logIn
          ? await logInAuth(context)
          : await signUpAuth(context);
      isWaiting = false;
      notifyListeners();
      passwordcontroller.clear();
    } else {
      logInKey.currentState!.validate();
    }
  }

  Future<void> logInAuth(context) async {
    Auth auth = Auth(getIt(), getIt());
    try {
      await auth.logInEmailAndPassword(email, password);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        PageTransition(child: const HomePage(), type: PageTransitionType.fade),
      );
    } catch (e) {
      String error = e.toString().split(']')[1];

      SnackBar snackBar = SnackBar(
        content: Text(error),
        duration: const Duration(seconds: 1),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      debugPrint(error);
    }
  }

  Future<void> signUpAuth(context) async {
    Auth auth = Auth(getIt(), getIt());
    try {
      await auth.signUpEmailAndPassword(email, password);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const HomePage(),
        ),
      );
    } catch (e) {
      String error = e.toString().split(']')[1];
      SnackBar snackBar = SnackBar(
        content: Text(error),
        duration: const Duration(seconds: 1),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      debugPrint(error);
    }
  }
}
