import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:talky/core/ui_kit/custom_user_avatar.dart';
import 'package:talky/features/profile/providers/user_provider.dart';
import 'package:talky/utils/app_colors.dart';
import 'package:talky/utils/app_icons.dart';

class MainPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainPageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer<UserProvider>(
              builder: (context, value, child) {
                return CustomUserAvatar(
                  avatarLink: value.userModel?.image,
                  isOnline: true,
                );
              },
            ),
            const Text(
              'Chats',
              style: TextStyle(
                color: AppColors.blackText,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppIcons.search.icon,
                height: 24,
                width: 24,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}
