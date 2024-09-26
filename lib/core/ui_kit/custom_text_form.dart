import 'package:flutter/material.dart';
import 'package:talky/utils/app_colors.dart';

class CustomTextForm extends StatefulWidget {
  const CustomTextForm({
    super.key,
    required this.controller,
    required this.hintText,
    required this.isCorrect,
  });
  final TextEditingController controller;
  final String hintText;
  final bool isCorrect;

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  @override
  Widget build(BuildContext context) {
    widget.controller.addListener(
      () {
        setState(() {});
      },
    );
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 15,
        top: 15,
        bottom: 13,
      ),
      height: 54,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: widget.controller.text.isNotEmpty
              ? (widget.isCorrect
                  ? AppColors.primaryBlue
                  : AppColors.inCorrectRed)
              : (widget.isCorrect
                  ? AppColors.lightBlack
                  : AppColors.inCorrectRed),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: AppColors.lightBlack,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: const TextStyle(
                color: AppColors.blackText,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
