import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talky/core/ui_kit/custom_text_field.dart';
import 'package:talky/features/main/widgets/chat_app_bar.dart';
import 'package:talky/features/main/widgets/contact_item.dart';
import 'package:talky/features/profile/models/user_model.dart';
import 'package:talky/utils/app_colors.dart';
import 'package:talky/utils/app_icons.dart';

class ChatCreatePage extends StatelessWidget {
  const ChatCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ChatAppBar(
        centerText: 'Chat',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: CustomTextField(
                  hintText: 'Search',
                  suffixIcon: SvgPicture.asset(
                    AppIcons.search.icon,
                    color: AppColors.lightBlack,
                  ),
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                ),
                child: ListTile(
                  dense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 2,
                  ),
                  leading: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: SvgPicture.asset(
                      AppIcons.chatGroup.icon,
                    ),
                  ),
                  title: const Text(
                    'Start a new group chat',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.blackText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: SvgPicture.asset(
                    AppIcons.chevron.icon,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'Contacts',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.blackText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ContactItem(
                    onTap: () {
                      
                    },
                    userModel: UserModel(
                      name: 'Donald Trump',
                      description: 'Walking with 🐶',
                      image:
                          'https://cdn.nur.kz/images/1200x675/pogudx566imebjbap.jpeg?version=1',
                      lastTime: DateTime.now().add(
                        const Duration(
                          seconds: -30,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  color: AppColors.lightBackground,
                  thickness: 1,
                  height: 1,
                ),
                itemCount: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
