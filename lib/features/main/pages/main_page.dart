import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:talky/core/services/user_state_service.dart';
import 'package:talky/features/main/pages/chat_create_page.dart';
import 'package:talky/features/main/widgets/main_page_app_bar.dart';
import 'package:talky/features/profile/providers/user_provider.dart';
import 'package:talky/utils/app_colors.dart';
import 'package:talky/utils/app_icons.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<UserProvider>().getUserModel();
        UserStateService.instance.startTimer();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainPageAppBar(),
      floatingActionButton: GestureDetector(
        onTap: () {
          showCupertinoModalBottomSheet(
            context: context,
            builder: (context) => const ChatCreatePage(),
          );
        },
        child: Container(
          height: 80,
          width: 80,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryBlue,
          ),
          child: SvgPicture.asset(
            AppIcons.floatingMenu.icon,
            height: 40,
            width: 40,
          ),
        ),
      ),
    );
  }
}
