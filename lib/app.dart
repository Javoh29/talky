import 'package:flutter/material.dart';
import 'package:talky/features/splash/pages/splash_page.dart';
import 'package:talky/utils/app_colors.dart';
import 'package:talky/utils/app_router.dart';

class App extends StatefulWidget {
  const App({super.key});

  static void restartApp(BuildContext context) {
    context.findRootAncestorStateOfType<_AppState>()?.restartApp();
  }

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Key key = UniqueKey();

  void restartApp() {
    if (mounted) {
      setState(() {
        key = UniqueKey();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primaryBlue,
        ),
        onGenerateRoute: AppRouter.generateRoute,
        home: const SplashPage(),
      ),
    );
  }
}
