import 'package:flutter/material.dart';
import 'package:talky/utils/app_colors.dart';
import 'package:talky/utils/app_string.dart';


class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColors.dividerBlack,
            height: 1,
            indent: 32,
            endIndent: 20,
          ),
        ),
        Text(
          AppString.or,
          style: TextStyle(
            color: AppColors.dividerBlack,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Divider(
            color: AppColors.dividerBlack,
            height: 1,
            indent: 20,
            endIndent: 32,
          ),
        ),
      ],
    );
  }
}
