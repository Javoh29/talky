import 'package:flutter/material.dart';

import 'package:talky/utils/app_colors.dart';

class CheckAgreement extends StatelessWidget {
  const CheckAgreement({
    super.key,
    this.func,
    required this.isChooseCheck,
    required this.isChecked,
    required this.agreement,
    required this.terms,
  });
  final Function(bool?)? func;
  final bool isChooseCheck;
  final bool isChecked;
  final String agreement;
  final String terms;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 24,
          width: 24,
          decoration: BoxDecoration(
            border: Border.all(
              color:
                  isChooseCheck ? AppColors.inCorrectRed : AppColors.blackText,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Checkbox(
            side: const BorderSide(
              color: Colors.transparent,
            ),
            checkColor: isChooseCheck
                ? AppColors.inCorrectRed
                : const Color.fromARGB(255, 74, 78, 82),
            activeColor: Colors.white,
            fillColor: WidgetStateColor.transparent,
            value: isChecked,
            onChanged: func,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: agreement,
                style: TextStyle(
                  color: isChooseCheck
                      ? AppColors.inCorrectRed
                      : AppColors.blackText,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: terms,
                style: TextStyle(
                  color: isChooseCheck
                      ? AppColors.inCorrectRed
                      : AppColors.blackText,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
