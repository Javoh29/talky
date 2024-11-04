import 'dart:async';

import 'package:talky/core/services/user_data_service.dart';

class UserStateService {
  UserStateService._();
  static final UserStateService _instance = UserStateService._();
  static UserStateService get instance => _instance;

  final userDataService = UserDataService.instance;
  Timer? _timer;

  void startTimer() {
    _timer = Timer.periodic(
      const Duration(
        seconds: 30,
      ),
      (timer) {
        userDataService.setUpdateLastTime();
      },
    );
  }

  void stopTimer() {
    _timer?.cancel();
  }
}
