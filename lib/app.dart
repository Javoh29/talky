import 'package:flutter/material.dart';
import 'package:talky/features/splash/pages/splash_page.dart';
import 'package:talky/utils/app_colors.dart';
import 'package:talky/utils/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryBlue,
      ),
      onGenerateRoute: AppRouter.generateRoute,
      home: const SplashPage(),
    );
  }
}
