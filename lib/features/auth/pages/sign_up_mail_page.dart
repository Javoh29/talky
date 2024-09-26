import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talky/core/ui_kit/custom_app_bar.dart';
import 'package:talky/core/ui_kit/custom_text_form.dart';
import 'package:talky/core/ui_kit/custom_text_form_with_icon.dart';
import 'package:talky/core/ui_kit/primary_button.dart';
import 'package:talky/features/auth/providers/sing_up_provider.dart';
import 'package:talky/features/auth/widgets/check_agreement.dart';
import 'package:talky/features/auth/widgets/floor_text.dart';
import 'package:talky/features/auth/widgets/wrong_password_email.dart';
import 'package:talky/features/splash/widgets/text_talky.dart';
import 'package:talky/utils/app_colors.dart';
import 'package:talky/utils/app_route_names.dart';
import 'package:talky/utils/app_string.dart';

class SignUpMailPage extends StatelessWidget {
  const SignUpMailPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: CustomAppBar(
        func: () {
          Navigator.pop(context);
        },
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider(
        create: (context) => SingUpProvider(),
        child: Consumer<SingUpProvider>(
          builder: (context, value, child) {
            if (value.state.isCompleted) {
              Future.delayed(
                Duration.zero,
                () => Navigator.pushNamed(
                  context,
                  AppRouteNames.signUpMailOtpPage,
                  arguments: {
                    'email': emailController.text,
                    "password": passwordController.text,
                  },
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
                    AppString.signUpEmail,
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
                  if (value.state.isError && value.errorText != null)
                    WrongPasswordEmail(
                      text: value.errorText ?? '',
                    ),
                  const SizedBox(
                    height: 26,
                  ),
                  CheckAgreement(
                    isChooseCheck: value.isChooseCheck,
                    isChecked: value.isChecked,
                    agreement: AppString.agreement,
                    terms: AppString.terms,
                    func: (check) => value.checkedCheckBox(check),
                  ),
                  const Spacer(),
                  PrimaryButton(
                    text: AppString.signUp,
                    isLoading: value.state.isLoading,
                    func: () {
                      if (value.isChecked) {
                        value.sentEmail(
                          email: emailController.text,
                        );
                      } else {
                        value.chooseCheckFunc();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FloorText(
                    text1: AppString.haveAccount,
                    text2: AppString.signInHere,
                    func: () {
                      Navigator.pushNamed(
                        context,
                        AppRouteNames.signInPage,
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
