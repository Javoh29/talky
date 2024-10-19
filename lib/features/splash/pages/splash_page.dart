import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talky/features/splash/providers/splash_provider.dart';
import 'package:talky/features/splash/widgets/text_talky.dart';
import 'package:talky/utils/app_colors.dart';
import 'package:talky/utils/app_route_names.dart';
import 'package:talky/utils/profile_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff377DFF),
      body: ChangeNotifierProvider(
        create: (context) => SplashProvider()..getProfileState(),
        child: Consumer<SplashProvider>(
          builder: (context, value, child) {
            if (value.state.isCompleted || value.state.isError) {
              String route = AppRouteNames.signInPage;
              if (value.profileState == ProfileState.completed) {
                route = AppRouteNames.mainPage;
              } else if (value.profileState == ProfileState.create) {
                route = AppRouteNames.createProfilePage;
              }
              Future.delayed(
                Duration.zero,
                () => {
                  Navigator.pushReplacementNamed(
                    context,
                    route,
                  )
                },
              );
            }
            return const Center(
              child: TextTalky(
                textSize: 80,
                textColor: Colors.white,
                dotColor: AppColors.blackText,
              ),
            );
          },
        ),
      ),
    );
  }
}
