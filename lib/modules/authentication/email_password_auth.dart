import 'package:firebase_auth/firebase_auth.dart';

abstract class EmailAndPasswordAuthService {
  Future<void> signUpEmailAndPassword(String email, String password);
  Future<void> logInEmailAndPassword(String email, String password);
  Future<void> signOutEmailAndPassword();
}

class EmailAndPasswordAuthHandler implements EmailAndPasswordAuthService {
  @override
  Future<void> signUpEmailAndPassword(String email, String password) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> logInEmailAndPassword(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signOutEmailAndPassword() async {
    await FirebaseAuth.instance.signOut();
  }
}
