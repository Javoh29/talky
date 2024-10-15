import 'package:flutter/material.dart';
import 'package:talky/features/auth/pages/forgot_password_page.dart';
import 'package:talky/features/auth/pages/sign_in_mail_page.dart';
import 'package:talky/features/auth/pages/sign_in_page.dart';
import 'package:talky/features/auth/pages/sign_up_mail_otp_page.dart';
import 'package:talky/features/auth/pages/sign_up_mail_page.dart';
import 'package:talky/features/auth/pages/sign_up_page.dart';
import 'package:talky/features/profile/pages/create_profile_page.dart';
import 'package:talky/utils/app_route_names.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case AppRouteNames.signInPage:
        return MaterialPageRoute(
          builder: (context) => const SignInPage(),
        );
      case AppRouteNames.signUpPage:
        return MaterialPageRoute(
          builder: (context) => const SignUpPage(),
        );
      case AppRouteNames.signInMailPage:
        return MaterialPageRoute(
          builder: (context) => const SignInMailPage(),
        );

      case AppRouteNames.signUpMailPage:
        return MaterialPageRoute(
          builder: (context) => const SignUpMailPage(),
        );
      case AppRouteNames.signUpMailOtpPage:
        return MaterialPageRoute(
          builder: (context) => SignUpMailOtpPage(
            email: args?['email'],
            password: args?['password'],
          ),
        );
      case AppRouteNames.forgotPasswordPage:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordPage(),
        );
      case AppRouteNames.createProfilePage:
        return MaterialPageRoute(
          builder: (context) => const CreateProfilePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
