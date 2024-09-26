import 'package:flutter/material.dart';
import 'package:talky/utils/app_colors.dart';

class FloorText extends StatelessWidget {
  const FloorText({
    super.key,
    required this.text1,
    required this.text2,
    required this.func,
  });
  final String text1;
  final String text2;
  final Function() func;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text1,
          style: const TextStyle(
            color: AppColors.blackText,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        GestureDetector(
          onTap: func,
          child: Text(
            text2,
            style: const TextStyle(
              color: AppColors.primaryBlue,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
