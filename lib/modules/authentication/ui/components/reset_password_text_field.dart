import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../controller/email_password_auth_controller.dart';
import '../../../../core/themes/app_light_theme.dart';
import '../../../../modules/authentication/ui/components/auth_strings.dart';

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
    // EmailPasswordAuthController read =
    //     context.read<EmailPasswordAuthController>();
    return Container(
      width: 80.w,
      decoration: BoxDecoration(
        color: AppLightTheme.textFieldBackgroundColor,
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
            color: AppLightTheme.unSelectedIconColor,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
          hintStyle:
              const TextStyle(color: AppLightTheme.textFieldForegroundColor),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.transparent)),
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
