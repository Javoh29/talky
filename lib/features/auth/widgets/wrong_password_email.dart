import 'package:flutter/material.dart';

import 'package:talky/utils/app_colors.dart';


class WrongPasswordEmail extends StatelessWidget {
  const WrongPasswordEmail({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          text,
          style: const TextStyle(
            color: AppColors.inCorrectRed,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
