import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talky/utils/app_colors.dart';
import 'package:talky/utils/app_icons.dart';
import 'package:talky/utils/app_string.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.func,
    this.centerText = '',
  });
  final Function() func;
  final String centerText;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: TextButton.icon(
        onPressed: func,
        label: const Text(
          AppString.back,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryBlue,
          ),
        ),
        icon: Container(
          height: 30,
          width: 30,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.secondaryBlue,
          ),
          child: SvgPicture.asset(
            AppIcons.chevronBack.icon,
            height: 12,
            width: 14,
          ),
        ),
        style: const ButtonStyle(splashFactory: NoSplash.splashFactory),
      ),
      leadingWidth: 110,
      title: Text(
        centerText,
        style: const TextStyle(
          color: AppColors.blackText,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
