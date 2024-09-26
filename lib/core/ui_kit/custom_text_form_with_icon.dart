import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talky/utils/app_colors.dart';
import 'package:talky/utils/app_icons.dart';


class CustomTextFormWithIcon extends StatefulWidget {
  const CustomTextFormWithIcon({
    super.key,
    required this.controller,
    required this.text,
    required this.isCorrect,
  });
  final TextEditingController controller;
  final String text;
  final bool isCorrect;

  @override
  State<CustomTextFormWithIcon> createState() => _CustomTextFormWithIconState();
}

class _CustomTextFormWithIconState extends State<CustomTextFormWithIcon> {
  bool obscureText = false;

  void obscureFunc() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.controller.addListener(() {
      setState(() {});
    });
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
                hintText: widget.text,
                hintStyle: const TextStyle(
                  color: AppColors.lightBlack,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              obscureText: obscureText,
              style: const TextStyle(
                color: AppColors.blackText,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          GestureDetector(
            onTap: obscureFunc,
            child: SvgPicture.asset(
              !obscureText ? AppIcons.eyes.icon : AppIcons.eyesOff.icon,
              height: 24,
              width: 24,
            ),
          ),
        ],
      ),
    );
  }
}
