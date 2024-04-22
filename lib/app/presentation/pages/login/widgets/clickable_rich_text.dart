import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ClickableRichText extends StatelessWidget {
  const ClickableRichText({
    Key? key,
    required this.plainText,
    required this.underlinedText,
    required this.colorPlainText,
    required this.colorUnderlineText,
    required this.onTap,
  }) : super(key: key);

  final String plainText;
  final String underlinedText;
  final Color colorPlainText;
  final Color colorUnderlineText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: plainText,
            style: TextStyle(color: colorPlainText),
          ),
          TextSpan(
            text: underlinedText,
            style: TextStyle(
              color: colorUnderlineText,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
      style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}
