import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talky/utils/app_colors.dart';

class CustomCodeForm extends StatelessWidget {
  const CustomCodeForm({
    super.key,
    required this.controller,
    required this.isIndex,
    required this.focusNode,
    required this.isCorrect,
  });
  final TextEditingController controller;
  final bool isIndex;
  final FocusNode focusNode;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    Color borderColor;

    if (!isCorrect) {
      borderColor = AppColors.inCorrectRed;
    } else if (isIndex) {
      borderColor = AppColors.primaryBlue;
    } else {
      borderColor = AppColors.lightBlack;
    }
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        textAlign: TextAlign.center,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
        focusNode: focusNode,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        showCursor: false,
        style: const TextStyle(
          color: AppColors.blackText,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
