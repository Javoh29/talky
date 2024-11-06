import 'package:flutter/material.dart';
import 'package:talky/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final VoidCallback? suffixTap;
  final EdgeInsets? contentPadding;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final int? maxLines;

  const CustomTextField({
    required this.hintText,
    this.suffixIcon,
    this.suffixTap,
    this.contentPadding,
    this.controller,
    this.onChanged,
    this.maxLines,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      maxLines: maxLines ?? 1,
      cursorColor: AppColors.primaryBlue,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.lightBlack,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.primaryBlue,
            width: 1,
          ),
        ),
        contentPadding: contentPadding ?? const EdgeInsets.all(11),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          color: AppColors.lightBlack,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: suffixTap,
                icon: suffixIcon ?? const SizedBox.shrink(),
              )
            : null,
        isDense: true,
      ),
    );
  }
}
