import 'package:e_commerce/modules/authentication/auth.dart';
import 'package:e_commerce/modules/authentication/controller/phone_auth_controller.dart';
import 'package:e_commerce/modules/authentication/phone_auth.dart';
import 'package:e_commerce/ui/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../../core/injection.dart';
import '../../../core/themes/app_light_theme.dart';

class PhoneAuthPage extends StatelessWidget {
  const PhoneAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    var watch = context.watch<PhoneAuthController>();
    var read = context.read<PhoneAuthController>();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('What\'s your phone number?'),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
            child: Form(
              key: watch.phoneAuthKey2,
              child: TextFormField(
                cursorColor: AppLightTheme.foregroundColor,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: AppLightTheme.foregroundColor, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: AppLightTheme.foregroundColor, width: 1),
                  ),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) => value == null || value == ''
                    ? 'write your phone number'
                    : value.toString().toLowerCase().contains(RegExp(r'[a-z]'))
                        ? 'unValid phone number'
                        : value.length != 11
                            ? 'phone number is either too short or too long'
                            : null,
                onSaved: read.savePhoneAuth,
              ),
            ),
          ),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              onPressed: () {
                if (watch.phoneAuthKey2.currentState!.validate()) {
                  watch.phoneAuthKey2.currentState!.save();
                  Auth auth = Auth(getIt(), getIt());
                  auth.verifyPhoneNumber(watch.phoneNumber);
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      child: const OTPCodePage(),
                      type: PageTransitionType.fade,
                    ),
                  );
                  // Auth auth = Auth(getIt(), getIt());
                  // auth.verifyPhoneNumber(watch.phoneNumber);
                } else {
                  watch.phoneAuthKey2.currentState!.validate();
                }
              },
              child: const Text('Verify'))
        ],
      ),
    );
  }
}

class OTPCodePage extends StatelessWidget {
  const OTPCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    var watch = context.watch<PhoneAuthController>();
    var read = context.read<PhoneAuthController>();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('What\'s your OTPCode?'),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
            child: Form(
              key: watch.phoneAuthKey,
              child: TextFormField(
                cursorColor: AppLightTheme.foregroundColor,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: AppLightTheme.foregroundColor, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: AppLightTheme.foregroundColor, width: 1),
                  ),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) => value == null || value == ''
                    ? 'write your OTPCode'
                    : value.toString().contains(RegExp(r'[a-z]'))
                        ? 'unValid OTPCode'
                        : value.length != 6
                            ? 'OTPCode is either too short or too long'
                            : null,
                onSaved: read.saveSmsCode,
              ),
            ),
          ),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              onPressed: () async {
                if (watch.phoneAuthKey.currentState!.validate()) {
                  watch.phoneAuthKey.currentState!.save();

                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: PhoneAuthHandler.verificationId,
                    smsCode: watch.smsCode,
                  );

                  await FirebaseAuth.instance.signInWithCredential(credential);
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      child: const HomePage(),
                      type: PageTransitionType.fade,
                    ),
                  );
                } else {
                  watch.phoneAuthKey.currentState!.validate();
                }
              },
              child: const Text('Verify'))
        ],
      ),
    );
  }
}
