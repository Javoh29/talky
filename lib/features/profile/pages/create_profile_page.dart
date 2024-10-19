import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:talky/core/ui_kit/custom_app_bar.dart';
import 'package:talky/core/ui_kit/custom_text_form.dart';
import 'package:talky/core/ui_kit/primary_button.dart';
import 'package:talky/features/profile/providers/create_profile_provider.dart';
import 'package:talky/utils/app_colors.dart';
import 'package:talky/utils/app_icons.dart';
import 'package:talky/utils/app_route_names.dart';
import 'package:talky/utils/app_string.dart';

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage({
    required this.isOnBack,
    super.key,
  });

  final bool isOnBack;

  @override
  State<CreateProfilePage> createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: widget.isOnBack
          ? CustomAppBar(
              func: () {
                Navigator.pop(context);
              },
            )
          : AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
            ),
      resizeToAvoidBottomInset: false,
      body: ChangeNotifierProvider(
        create: (context) => CreateProfileProvider(),
        child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
            ),
            child: Consumer<CreateProfileProvider>(
              builder: (context, value, child) {
                if (value.state.isCompleted) {
                  Future.delayed(
                    Duration.zero,
                    () => Navigator.pushNamed(
                      context,
                      AppRouteNames.mainPage,
                    ),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 95,
                            backgroundColor: AppColors.avatarColor,
                            child: value.selectedImage == null
                                ? SvgPicture.asset(
                                    AppIcons.profileIcon.icon,
                                    height: 40,
                                  )
                                : Center(
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(95),
                                      ),
                                      child: Image.file(
                                        value.selectedImage!,
                                        fit: BoxFit.cover,
                                        height: 190,
                                      ),
                                    ),
                                  ),
                          ),
                          Positioned(
                            bottom: 5,
                            right: 5,
                            child: IconButton(
                              onPressed: () async {
                                await value.imagePicker();
                              },
                              icon: SvgPicture.asset(
                                AppIcons.profileEdit.icon,
                              ),
                              iconSize: 24,
                              style: const ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                  AppColors.primaryBlue,
                                ),
                                shape: WidgetStatePropertyAll(
                                  CircleBorder(),
                                ),
                              ),
                              constraints: const BoxConstraints.tightFor(
                                  height: 50, width: 50),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomTextForm(
                      controller: nameController,
                      hintText: AppString.enterName,
                      isCorrect: !value.state.isError,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    CustomTextForm(
                      controller: descriptionController,
                      hintText: AppString.enterDescription,
                      isCorrect: !value.state.isError,
                    ),
                    const Spacer(),
                    PrimaryButton(
                      text: AppString.complete,
                      isLoading: value.state.isLoading,
                      func: () {
                        value.saveUserData(
                          name: nameController.text,
                          description: descriptionController.text,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 90,
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }
}
