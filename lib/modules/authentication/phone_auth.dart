import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class PhoneAuthService {
  Future verifyPhoneNumber(String phoneNumber);
}

class PhoneAuthHandler implements PhoneAuthService {
  static late String verificationId;
  @override
  Future verifyPhoneNumber(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      verificationCompleted: onVerficationCompelete,
      verificationFailed: onVerficationFail,
      codeSent: onCodeSent,
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  onVerficationCompelete(PhoneAuthCredential credential) async {
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  onVerficationFail(FirebaseAuthException e) {
    if (e.code == 'invalid-phone-number') {
      debugPrint('The provided phone number is not valid.');
    }
  }

  onCodeSent(String createdVerificationId, int? resendToken) async {
    //String smsCode = '000000';
    verificationId = createdVerificationId;
    // PhoneAuthCredential credential = PhoneAuthProvider.credential(
    //   verificationId: verificationId,
    //   smsCode: smsCode,
    // );

    //await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
