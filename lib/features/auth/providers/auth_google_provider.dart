import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:talky/utils/statuses.dart';

class AuthGoogleProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  Statuses _state = Statuses.initial;

  Statuses get state => _state;

  Future<void> signInGoogle() async {
    _updateState(Statuses.loading);
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      if (gUser != null) {
        final GoogleSignInAuthentication gAuth = await gUser.authentication;
        final cred = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken,
          idToken: gAuth.idToken,
        );
        await auth.signInWithCredential(cred);
        _updateState(Statuses.completed);
      }
    } catch (e) {
      _updateState(Statuses.error);
      log("Google Sign-In failed: $e");
    }
  }

  void _updateState(Statuses value) {
    _state = value;
    notifyListeners();
  }
}
