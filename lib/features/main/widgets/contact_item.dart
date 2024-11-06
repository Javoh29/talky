import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talky/core/ui_kit/custom_user_avatar.dart';
import 'package:talky/features/profile/models/user_model.dart';
import 'package:talky/utils/app_colors.dart';
import 'package:talky/utils/app_icons.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    required this.userModel,
    required this.onTap,
    super.key,
  });
  final UserModel userModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isOnline = checkIsOnline(
      userModel.lastTime ??
          DateTime.now().add(
            const Duration(
              days: -1,
            ),
          ),
    );
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 2,
      ),
      onTap: onTap,
      leading: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: CustomUserAvatar(
          avatarLink: userModel.image,
          isOnline: isOnline,
        ),
      ),
      title: Text(
        userModel.name ?? 'Unknown',
        style: const TextStyle(
          fontSize: 16,
          color: AppColors.blackText,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        userModel.description ?? (isOnline ? 'at work' : 'offline'),
        style: const TextStyle(
          color: AppColors.lightBlack,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: SvgPicture.asset(
        AppIcons.chevron.icon,
      ),
    );
  }

  bool checkIsOnline(DateTime value) {
    return DateTime.now().difference(value).inSeconds < 30;
  }
}
