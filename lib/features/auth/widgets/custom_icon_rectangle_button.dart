import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talky/utils/app_colors.dart';

class CustomIconRectangleButton extends StatelessWidget {
  const CustomIconRectangleButton({
    super.key,
    required this.iconPath,
    required this.text,
    required this.func,
    required this.isLoading,
  });
  final String iconPath;
  final String text;
  final Function() func;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 2,
                color: Colors.black.withOpacity(0.08),
              ),
            ]),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 34),
        child: !isLoading
            ? Row(
                children: [
                  SvgPicture.asset(iconPath),
                  Expanded(
                    child: Center(
                        child: Text(
                      text,
                      style: const TextStyle(
                        color: AppColors.blackText,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                  ),
                ],
              )
            : const Center(
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: AppColors.blackText,
                  ),
                ),
              ),
      ),
    );
  }
}
