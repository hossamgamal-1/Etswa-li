import 'package:e_commerce/modules/authentication/phone_auth.dart';

import 'email_password_auth.dart';

class Auth {
  final EmailAndPasswordAuthService emailAndPasswordAuthService;
  final PhoneAuthService phoneAuthService;

  Auth(this.emailAndPasswordAuthService, this.phoneAuthService);

  Future<void> signUpEmailAndPassword(String email, String password) =>
      emailAndPasswordAuthService.signUpEmailAndPassword(email, password);
  Future<void> logInEmailAndPassword(String email, String password) =>
      emailAndPasswordAuthService.logInEmailAndPassword(email, password);
  Future<void> signOutEmailAndPassword() =>
      emailAndPasswordAuthService.signOutEmailAndPassword();
  Future<void> verifyPhoneNumber(String phoneNumber) =>
      phoneAuthService.verifyPhoneNumber(phoneNumber);
}
