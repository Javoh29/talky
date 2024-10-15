import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talky/core/ui_kit/custom_app_bar.dart';
import 'package:talky/core/ui_kit/custom_text_form.dart';
import 'package:talky/core/ui_kit/custom_text_form_with_icon.dart';
import 'package:talky/core/ui_kit/primary_button.dart';
import 'package:talky/features/auth/providers/sign_in_provider.dart';
import 'package:talky/features/auth/widgets/floor_text.dart';
import 'package:talky/features/auth/widgets/forgot_password_button.dart';
import 'package:talky/features/auth/widgets/wrong_password_email.dart';
import 'package:talky/features/splash/widgets/text_talky.dart';
import 'package:talky/utils/app_colors.dart';
import 'package:talky/utils/app_route_names.dart';
import 'package:talky/utils/app_string.dart';

class SignInMailPage extends StatefulWidget {
  const SignInMailPage({super.key});

  @override
  State<SignInMailPage> createState() => _SignInMailPageState();
}

class _SignInMailPageState extends State<SignInMailPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        func: () => Navigator.pop(context),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider(
        create: (context) => SignInProvider(),
        child: Consumer<SignInProvider>(
          builder: (context, value, child) {
            if (value.state.isCompleted) {
              Future.delayed(
                Duration.zero,
                () => Navigator.pushNamed(
                  context,
                  AppRouteNames.createProfilePage,
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 26, bottom: 40),
                    child: TextTalky(
                      textSize: 40,
                      textColor: AppColors.blackText,
                      dotColor: AppColors.primaryBlue,
                    ),
                  ),
                  const Text(
                    AppString.signInWithEmail,
                    style: TextStyle(
                      color: AppColors.blackText,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextForm(
                    controller: emailController,
                    hintText: AppString.enterEmail,
                    isCorrect: !value.state.isError,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  CustomTextFormWithIcon(
                    controller: passwordController,
                    text: AppString.enterPassword,
                    isCorrect: !value.state.isError,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  if (value.state.isError)
                    WrongPasswordEmail(
                      text: value.errorText,
                    ),
                  ForgotPasswordButton(
                    func: () {
                      Navigator.pushNamed(
                          context, AppRouteNames.forgotPasswordPage);
                    },
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  const Spacer(),
                  PrimaryButton(
                    text: AppString.signIn,
                    isLoading: value.state.isLoading,
                    func: () {
                      value.authByEmail(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FloorText(
                    text1: AppString.haveAccount,
                    text2: AppString.signUpHere,
                    func: () {
                      Navigator.pushNamed(
                        context,
                        AppRouteNames.signUpPage,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 102,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
