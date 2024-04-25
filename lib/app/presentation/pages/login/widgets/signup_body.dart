import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'auth_button.dart';
import 'clickable_rich_text.dart';
import 'label_text_field.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
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
          'Signup',
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
          label: 'Set Password',
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
        LabelTextField(
          controller: confirmPassController,
          label: 'Confirm password',
          hint: 'Re-enter password',
          icon: Icons.lock,
          obscureText: hidePassword,
        ),
        SizedBox(height: 8.h),
        SizedBox(height: 200.h),
        AuthButton(
          text: 'Signup',
          onTap: () {},
        ),
        SizedBox(height: 12.h),
        Center(
          child: ClickableRichText(
            plainText: 'Existing user? ',
            underlinedText: 'Login',
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
