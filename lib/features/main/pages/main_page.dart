import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talky/core/services/user_state_service.dart';
import 'package:talky/features/main/widgets/main_page_app_bar.dart';
import 'package:talky/features/profile/providers/user_provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<UserProvider>().getUserModel();
        UserStateService.instance.startTimer();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainPageAppBar(),
      // body: ,
    );
  }
}
