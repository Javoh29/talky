import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talky/core/ui_kit/custom_app_bar.dart';
import 'package:talky/core/ui_kit/custom_text_form.dart';
import 'package:talky/core/ui_kit/primary_button.dart';
import 'package:talky/features/auth/providers/forgot_password_provider.dart';
import 'package:talky/features/auth/widgets/wrong_password_email.dart';
import 'package:talky/features/splash/widgets/text_talky.dart';
import 'package:talky/utils/app_colors.dart';
import 'package:talky/utils/app_route_names.dart';
import 'package:talky/utils/app_string.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: CustomAppBar(
            func: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ChangeNotifierProvider(
          create: (context) => ForgotPasswordProvider(),
          child: Consumer<ForgotPasswordProvider>(
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 21,
                  vertical: 40,
                ),
                child: Column(
                  children: [
                    const TextTalky(
                      textSize: 60,
                      textColor: AppColors.blackText,
                      dotColor: AppColors.primaryBlue,
                    ),
                    const Spacer(),
                    CustomTextForm(
                      controller: emailController,
                      hintText: AppString.enterEmail,
                      isCorrect: !value.state.isError,
                    ),
                    if (value.state.isError)
                      SizedBox(
                        height: 30,
                        child: WrongPasswordEmail(
                          text: value.errorText,
                        ),
                      ),

                    const Spacer(flex: 2,),
                    PrimaryButton(
                      text: AppString.send,
                      isLoading: value.state.isLoading,
                      func: () async {
                        value.forgotPassword(email: emailController.text);
                        if (value.state.isCompleted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(AppString.forgotPasswordSend),
                              duration: const Duration(seconds: 2),
                              action: SnackBarAction(
                                label: 'Press to go back',
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, AppRouteNames.signInPage);
                                },
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
