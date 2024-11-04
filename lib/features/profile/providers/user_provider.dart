import 'dart:developer';

import 'package:talky/core/base/base_change_notifier.dart';
import 'package:talky/core/services/user_data_service.dart';
import 'package:talky/features/profile/models/user_model.dart';
import 'package:talky/utils/statuses.dart';

class UserProvider extends BaseChangeNotifier {
  final userDataService = UserDataService.instance;
  UserModel? userModel;

  Future<void> getUserModel() async {
    updateState(Statuses.loading);
    try {
      final response = await userDataService.getUserDoc();
      userModel = UserModel.fromJson(response.data() ?? {});
      updateState(Statuses.completed);
    } catch (e) {
      updateState(Statuses.error);
      log('ERR: ${e.toString()}');
    }
  }
}
