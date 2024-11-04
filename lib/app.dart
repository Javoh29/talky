import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talky/core/services/user_state_service.dart';
import 'package:talky/features/profile/providers/user_provider.dart';
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
  void dispose() {
    UserStateService.instance.stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => UserProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: AppColors.primaryBlue,
          ),
          onGenerateRoute: AppRouter.generateRoute,
          home: const SplashPage(),
        ),
      ),
    );
  }
}
