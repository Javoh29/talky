import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talky/utils/app_colors.dart';
import 'package:talky/utils/app_icons.dart';

class CustomUserAvatar extends StatelessWidget {
  const CustomUserAvatar({
    super.key,
    this.avatarLink,
    this.isOnline = false,
  });
  final String? avatarLink;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: avatarLink ?? '',
          height: 50,
          width: 50,
          imageBuilder: (context, imageProvider) {
            return Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          errorWidget: (context, url, error) => _defUser(),
          placeholder: (context, url) => _defUser(),
        ),
        if (isOnline)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 14,
              width: 14,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.onlineColor,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
              ),
            ),
          )
      ],
    );
  }

  Widget _defUser() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: SvgPicture.asset(
        AppIcons.userDefault.icon,
        fit: BoxFit.cover,
        height: 50,
        width: 50,
      ),
    );
  }
}
