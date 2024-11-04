import 'dart:developer';

import 'package:talky/core/base/base_change_notifier.dart';
import 'package:talky/core/services/user_data_service.dart';
import 'package:talky/utils/profile_state.dart';
import 'package:talky/utils/statuses.dart';

class SplashProvider extends BaseChangeNotifier {
  final userDataService = UserDataService.instance;
  ProfileState profileState = ProfileState.initial;

  Future<void> getProfileState() async {
    updateState(Statuses.loading);
    final currentDate = DateTime.now();
    try {
      final userModel = await userDataService.getUserModel();
      profileState = userModel?.profileState ?? ProfileState.initial;
      _finish(
        status: Statuses.completed,
        date: currentDate,
      );
    } catch (e) {
      log(e.toString());
      _finish(
        status: Statuses.error,
        date: currentDate,
      );
    }
  }

  void _finish({
    required Statuses status,
    required DateTime date,
  }) {
    final diffMilliseconds = DateTime.now().difference(date).inMilliseconds;
    if (diffMilliseconds > 5000) {
      updateState(status);
    } else {
      Future.delayed(
        Duration(milliseconds: diffMilliseconds),
        () => updateState(status),
      );
    }
  }
}
