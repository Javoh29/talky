import 'package:flutter/material.dart';
import 'package:talky/utils/app_string.dart';

class TextTalky extends StatelessWidget {
  const TextTalky({
    super.key,
    required this.textSize,
    required this.textColor,
    required this.dotColor,
  });
  final double textSize;
  final Color textColor;
  final Color dotColor;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: AppString.talky,
            style: TextStyle(
              fontSize: textSize,
              color: textColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: AppString.dot,
            style: TextStyle(
              color: dotColor,
              fontSize: textSize,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
