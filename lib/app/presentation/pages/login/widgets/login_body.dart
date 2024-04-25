import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'auth_button.dart';
import 'clickable_rich_text.dart';
import 'label_text_field.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      padding: EdgeInsets.only(
        right: 16.w,
        left: 16.w,
        top: 72.h,
      ),
      children: [
        Text(
          'Login',
          style: textTheme.headline2?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 18.h),
        LabelTextField(
          controller: emailController,
          label: 'Email ID',
          hint: 'example@gmail.com',
          icon: Icons.email,
          inputType: TextInputType.emailAddress,
        ),
        LabelTextField(
          controller: passController,
          label: 'Password',
          hint: 'Password',
          icon: Icons.lock,
          obscureText: hidePassword,
          suffixIconWidget: IconButton(
            icon: Icon(
              hidePassword ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () => setState(() {
              hidePassword = !hidePassword;
            }),
          ),
        ),
        SizedBox(height: 8.h),
        Center(
          child: ClickableRichText(
            plainText: '',
            underlinedText: 'Forget password',
            colorPlainText: Colors.white,
            colorUnderlineText: Colors.white,
            onTap: () {},
          ),
        ),
        SizedBox(height: 260.h),
        AuthButton(
          text: 'Login',
          onTap: () {},
        ),
        SizedBox(height: 12.h),
        Center(
          child: ClickableRichText(
            plainText: 'New user? ',
            underlinedText: 'Signup',
            colorPlainText: Colors.white,
            colorUnderlineText: Colors.black,
            onTap: () {},
          ),
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
