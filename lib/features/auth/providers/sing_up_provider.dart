import 'dart:developer';

import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:talky/core/base/base_change_notifier.dart';
import 'package:talky/utils/app_string.dart';
import 'package:talky/utils/statuses.dart';

class SingUpProvider extends BaseChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  String? errorText;
  bool isChecked = false;
  bool isChooseCheck = false;

  Future<void> sentEmail({required String email}) async {
    updateState(Statuses.loading);
    try {
      EmailOTP.config(
        appEmail: AppString.appMail,
        appName: AppString.appName,
        otpLength: 4,
        otpType: OTPType.numeric,
        expiry: 180000,
      );
      final isSend = await EmailOTP.sendOTP(email: email);
      if (isSend) {
        updateState(Statuses.completed);
      } else {
        errorText = 'Couldn\'t send OTP';
      }
    } catch (e) {
      errorText = 'Couldn\'t send OTP';
      updateState(Statuses.error);
      log(e.toString());
    }
  }

  void checkedCheckBox(bool? value) {
    isChecked = value ?? false;
    isChooseCheck = false;
    notifyListeners();
  }

  void chooseCheckFunc() {
    isChooseCheck = true;
    notifyListeners();
  }

  String _sanitizeErrorMessage(String errorMsg) {
    String sanitized = errorMsg.replaceAll(RegExp(r'\[.*?\]'), '');
    sanitized = sanitized.replaceAll(RegExp(r'//.*'), '');
    sanitized = sanitized.replaceAll(RegExp(r'/\*.*?\*/'), '');
    return sanitized.trim();
  }
}
