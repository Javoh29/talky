import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talky/core/ui_kit/custom_app_bar.dart';
import 'package:talky/core/ui_kit/primary_button.dart';
import 'package:talky/features/auth/providers/otp_provider.dart';
import 'package:talky/features/auth/widgets/custom_code_form.dart';
import 'package:talky/features/auth/widgets/floor_text.dart';
import 'package:talky/features/auth/widgets/wrong_password_email.dart';
import 'package:talky/features/splash/widgets/text_talky.dart';

import 'package:talky/utils/app_colors.dart';
import 'package:talky/utils/app_route_names.dart';
import 'package:talky/utils/app_string.dart';

class SignUpMailOtpPage extends StatefulWidget {
  const SignUpMailOtpPage({
    required this.email,
    required this.password,
    super.key,
  });

  final String email;
  final String password;

  @override
  State<SignUpMailOtpPage> createState() => _SignUpMailOtpPageState();
}

class _SignUpMailOtpPageState extends State<SignUpMailOtpPage> {
  int currentIndex = -1;
  final List<TextEditingController> controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );

  final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < focusNodes.length; i++) {
      focusNodes[i].addListener(() {
        setState(() {
          currentIndex = i;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OtpProvider(),
      child: Scaffold(
        appBar: CustomAppBar(
          func: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 21,
          ),
          child: Consumer<OtpProvider>(
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
              return Column(
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
                    AppString.enterDigits,
                    style: TextStyle(
                      color: AppColors.blackText,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      ...List.generate(4, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 13, right: 13),
                          child: CustomCodeForm(
                            isCorrect: value.isCorrect,
                            controller: controllers[index],
                            isIndex: currentIndex == index,
                            focusNode: focusNodes[index],
                          ),
                        );
                      }),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  if (!value.isCorrect)
                    const WrongPasswordEmail(text: AppString.wrongOtp),
                  const Spacer(),
                  PrimaryButton(
                    text: AppString.signUp,
                    isLoading: value.state.isLoading,
                    func: () {
                      value.toList(controllers);

                      value.verifyEmail(
                        pin: value.otpCodes.join(''),
                        email: widget.email,
                        password: widget.password,
                      );
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
              );
            },
          ),
        ),
      ),
    );
  }
}
