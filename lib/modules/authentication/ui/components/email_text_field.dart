import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/resources/color_manager.dart';
import '../../controller/email_password_auth_controller.dart';
import 'auth_strings.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EmailPasswordAuthController read =
        context.read<EmailPasswordAuthController>();

    return Container(
      width: 80.w,
      margin: EdgeInsets.all(1.25.h),
      decoration: BoxDecoration(
        color: ColorManager.textFieldBackgroundColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        validator: (value) => (value == null || !value.contains('@'))
            ? AuthStrings.validatorEmptyEmailText
            : null,
        onSaved: read.emailTextFieldOnSave,
        decoration: InputDecoration(
          hintText: AuthStrings.emailTextFieldHintText,
          hintStyle:
              const TextStyle(color: ColorManager.textFieldForegroundColor),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: ColorManager.transparent)),
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
