import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabelTextField extends StatelessWidget {
  const LabelTextField({
    Key? key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.controller,
    this.obscureText = false,
    this.suffixIconWidget,
    this.inputType,
    this.errorText,
  }) : super(key: key);

  final String label;
  final String hint;
  final String? errorText;
  final bool obscureText;
  final Widget? suffixIconWidget;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    const color = Colors.white;
    const border = UnderlineInputBorder(borderSide: BorderSide(color: color));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: const TextStyle(color: color)),
        SizedBox(height: 6.h),
        TextField(
          controller: controller,
          keyboardType: inputType,
          obscureText: obscureText,
          style: const TextStyle(color: color),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: color),
            hintStyle: const TextStyle(color: color),
            hintText: hint,
            errorText: errorText,
            suffixIcon: suffixIconWidget,
            suffixIconColor: color,
            border: border,
            enabledBorder: border,
            focusedBorder: border,
            filled: true,
            fillColor: Colors.white.withOpacity(0.2),
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
