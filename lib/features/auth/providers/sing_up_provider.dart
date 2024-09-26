import 'dart:developer';

import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talky/utils/app_string.dart';
import 'package:talky/utils/statuses.dart';

class SingUpProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  Statuses _state = Statuses.initial;
  String? errorText;
  bool isChecked = false;
  bool isChooseCheck = false;

  Statuses get state => _state;

  Future<void> sentEmail({required String email}) async {
    _updateState(Statuses.loading);
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
        _updateState(Statuses.completed);
      } else {
        errorText = 'Couldn\'t send OTP';
      }
    } catch (e) {
      errorText = 'Couldn\'t send OTP';
      _updateState(Statuses.error);
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

  void _updateState(Statuses value) {
    _state = value;
    notifyListeners();
  }
}
