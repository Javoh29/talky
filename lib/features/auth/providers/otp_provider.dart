import 'dart:developer';

import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talky/utils/statuses.dart';

class OtpProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isCorrect = true;
  Statuses _state = Statuses.initial;
  List<String> otpCodes = [];

  Statuses get state => _state;

  Future<void> registration({
    required String email,
    required String password,
  }) async {
    _updateState(Statuses.loading);
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _updateState(Statuses.completed);
    } catch (e) {
      _updateState(Statuses.error);
      log(e.toString());
    }
  }

  Future<void> verifyEmail({
    required String pin,
    required String email,
    required String password,
  }) async {
    final result = EmailOTP.verifyOTP(otp: pin);
    if (result) {
      await registration(
        email: email,
        password: password,
      );
    } else {
      isCorrect = result;
      notifyListeners();
    }
  }

  void toList(List<TextEditingController> controllers) {
    otpCodes = controllers.map((controller) => controller.text).toList();
  }

  void _updateState(Statuses value) {
    _state = value;
    notifyListeners();
  }
}
