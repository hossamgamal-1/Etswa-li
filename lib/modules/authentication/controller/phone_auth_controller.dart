import 'package:flutter/cupertino.dart';

class PhoneAuthController with ChangeNotifier {
  GlobalKey<FormState> phoneAuthKey = GlobalKey();
  GlobalKey<FormState> phoneAuthKey2 = GlobalKey();

  String phoneNumber = '';
  String smsCode = '';
  bool codeSent = false;

  codeSentSetterTrue() {
    codeSent = true;
    notifyListeners();
  }

  codeSentSetterFalse() {
    codeSent = false;
    notifyListeners();
  }

  savePhoneAuth(String? value) {
    phoneNumber = value!;
    notifyListeners();
  }

  saveSmsCode(String? value) {
    smsCode = value!;
    notifyListeners();
  }
}
