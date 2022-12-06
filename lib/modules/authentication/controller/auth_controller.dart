import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/components/auth_strings.dart';
import '../../../ui/screens/home_page.dart';

/* enum AuthMode { logIn, signUp }
 */
class AuthController with ChangeNotifier {
  //AuthMode currentAuthMode = AuthMode.logIn;
  bool isObsecure = true;
  IconData eye = Icons.visibility_off;
  bool checkedEmail = false;
  GlobalKey<FormState> logInKey = GlobalKey();
  TextEditingController passwordcontroller = TextEditingController();

  visibleOnOffSwitcher() {
    isObsecure = !isObsecure;
    eye = eye == Icons.visibility_off ? Icons.visibility : Icons.visibility_off;
    notifyListeners();
  }

  /* authModeSwitcher() {
    currentAuthMode =
        (currentAuthMode == AuthMode.logIn) ? AuthMode.signUp : AuthMode.logIn;
    notifyListeners();
  } */

  String? emailTextFieldValidator(value) {
    return (value == null || !value.contains('@'))
        ? AuthStrings.validatorEmptyEmailText
        : (value != 'hossamgmal1313@gmail.com')
            ? 'Wrong Email or Password Try again!'
            : null;
  }

  emailTextFieldOnSave(String? value) async {
    /*  SharedPreferences preferences = await SharedPreferences.getInstance();

    currentAuthMode == AuthMode.logIn
        ? (String? value) {
            checkedEmail = value == preferences.getString('email');
            notifyListeners();
          }
        : (String? value) {
            value != null ? preferences.setString('email', value) : null;
          }; */
  }

  String? passwordTextFieldValidator(value) {
    return (value == null || value.length < 8)
        ? AuthStrings.validatorShortPasswordText
        : (value != '0147896325')
            ? 'Wrong Password Try again!'
            : null;
  }

  passwordTextFieldOnSave(String? value) async {
    /*   SharedPreferences preferences = await SharedPreferences.getInstance();
    currentAuthMode == AuthMode.logIn
        ? (value, BuildContext context) {
            checkedEmail && value == preferences.getString('password')
                ? Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const HomePage()))
                : ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Wrong password! Try again'),
                    ),
                  );
          }
        : (String? value, BuildContext context) {
            value != null ? preferences.setString('password', value) : null;

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const HomePage()));
          };
   */
  }
  /* String? resetPasswordValidator(String? value) {
    return (value != passwordcontroller.text)
        ? 'Passwords are different'
        : null;
  } */

  authButtonOnPressed(BuildContext context) async {
    if (logInKey.currentState!.validate()) {
      logInKey.currentState!.save();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const HomePage(),
        ),
      );
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setBool('isLoggedIn', true);
    } else {
      logInKey.currentState!.validate();
    }
  }

  static bool isLoggedIn = false;
  static Future<void> isLoggedInFn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    isLoggedIn = preferences.getBool('isLoggedIn') ?? false;
  }
}
