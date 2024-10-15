import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talky/utils/statuses.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  String errorText = '';
  Statuses _state = Statuses.initial;

  Statuses get state => _state;

  Future<void> forgotPassword({required String email}) async {
    _updateState(Statuses.loading);

    try {
      await auth.sendPasswordResetEmail(email: email);
      _updateState(Statuses.completed);
      notifyListeners();
    } catch (e) {
      _updateState(Statuses.error);
      errorText = sanitizeErrorMessage(e.toString());
      notifyListeners();
    }
  }

  String sanitizeErrorMessage(String errorMsg) {
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
