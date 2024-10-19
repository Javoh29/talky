import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talky/core/base/base_change_notifier.dart';
import 'package:talky/features/profile/models/user_model.dart';
import 'package:talky/utils/profile_state.dart';
import 'package:talky/utils/statuses.dart';

class OtpProvider extends BaseChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseStore = FirebaseFirestore.instance;
  bool isCorrect = true;
  List<String> otpCodes = [];


  Future<void> registration({
    required String email,
    required String password,
  }) async {
    updateState(Statuses.loading);
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      updateState(Statuses.completed);

      final user = auth.currentUser;
      if (user != null) {
        final doc = firebaseStore.collection('users').doc(user.uid);
        await doc.set(
          UserModel(
            email: email,
            uid: user.uid,
            profileState: ProfileState.create,
          ).toJson(),
        );
      } else {
        updateState(Statuses.error);
      }
    } catch (e) {
      updateState(Statuses.error);
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
}
