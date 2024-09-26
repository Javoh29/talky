import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talky/features/auth/providers/auth_google_provider.dart';
import 'package:talky/features/auth/widgets/custom_icon_rectangle_button.dart';
import 'package:talky/features/auth/widgets/floor_text.dart';
import 'package:talky/features/auth/widgets/or_divider.dart';
import 'package:talky/features/splash/widgets/text_talky.dart';
import 'package:talky/utils/app_colors.dart';
import 'package:talky/utils/app_icons.dart';
import 'package:talky/utils/app_route_names.dart';
import 'package:talky/utils/app_string.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthGoogleProvider(),
      child: Scaffold(
        backgroundColor: AppColors.lightBackground,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(
                  height: 71,
                ),
                const TextTalky(
                  textSize: 60,
                  textColor: AppColors.blackText,
                  dotColor: AppColors.primaryBlue,
                ),
                const Spacer(),
                Consumer<AuthGoogleProvider>(
                  builder: (context, value, child) {
                    return CustomIconRectangleButton(
                      iconPath: AppIcons.googleIcon.icon,
                      text: AppString.signInGoogle,
                      func: () => value.signInGoogle(),
                      isLoading: value.state.isLoading,
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: OrDivider(),
                ),
                CustomIconRectangleButton(
                  iconPath: AppIcons.emailIcon.icon,
                  text: AppString.continueEmail,
                  func: () {
                    Navigator.pushNamed(
                      context,
                      AppRouteNames.signInMailPage,
                    );
                  },
                  isLoading: false,
                ),
                const SizedBox(
                  height: 56,
                ),
                FloorText(
                  text1: AppString.dontHaveAccount,
                  text2: AppString.signUpHere,
                  func: () {
                    Navigator.pushNamed(context, AppRouteNames.signUpPage);
                  },
                ),
                const SizedBox(
                  height: 102,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
