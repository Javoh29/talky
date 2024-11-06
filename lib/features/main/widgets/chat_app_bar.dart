import 'package:flutter/material.dart';
import 'package:talky/utils/app_colors.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({
    this.onCancel,
    this.onDone,
    this.centerText = '',
    this.isDoneActive = false,
    super.key,
  });
  final Function()? onCancel;
  final Function()? onDone;
  final String centerText;
  final bool isDoneActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: onCancel ??
                () {
                  Navigator.pop(context);
                },
            style: Theme.of(context).textButtonTheme.style?.copyWith(
                  padding: const WidgetStatePropertyAll(
                    EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                ),
            child: const Text(
              'Cancel',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            centerText,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.blackText,
              fontWeight: FontWeight.bold,
            ),
          ),
          Visibility(
            visible: onDone != null,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            maintainSemantics: true,
            child: TextButton(
              onPressed: onDone,
              style: Theme.of(context).textButtonTheme.style?.copyWith(
                    padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                  ),
              child: Text(
                'Done',
                style: TextStyle(
                  fontSize: 16,
                  color: isDoneActive
                      ? AppColors.primaryBlue
                      : AppColors.lightBlack,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
