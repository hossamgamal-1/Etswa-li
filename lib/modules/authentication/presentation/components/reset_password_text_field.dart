import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../presentation/resources/color_manager.dart';
import '../../business_logic/email_password_auth_controller.dart';
import 'auth_strings.dart';

class ResetPasswordTextField extends StatefulWidget {
  const ResetPasswordTextField({super.key});

  @override
  State<ResetPasswordTextField> createState() => _ResetPasswordTextFieldState();
}

class _ResetPasswordTextFieldState extends State<ResetPasswordTextField> {
  @override
  Widget build(BuildContext context) {
    EmailPasswordAuthController watch =
        context.watch<EmailPasswordAuthController>();
    var textEditingController = TextEditingController();
    return Container(
      width: 80.w,
      decoration: BoxDecoration(
        color: ColorManager.textFieldBackgroundColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: 'Confirm Password',
          suffixIcon: IconButton(
            onPressed: () => setState(() {
              watch.isObsecure = !watch.isObsecure;
            }),
            icon: watch.currentAuthMode == AuthMode.signUp
                ? watch.isObsecure
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility)
                : Container(),
            color: ColorManager.unSelectedIconColor,
            hoverColor: ColorManager.transparent,
            splashColor: ColorManager.transparent,
          ),
          hintStyle:
              const TextStyle(color: ColorManager.textFieldForegroundColor),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: ColorManager.transparent)),
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: watch.isObsecure,
        validator: (value) => (value != watch.passwordcontroller.text)
            ? AuthStrings.passowordsAreDifferent
            : null,
        onSaved: (value) => textEditingController.clear(),
      ),
    );
  }
}
