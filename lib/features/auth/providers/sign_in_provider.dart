import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talky/utils/statuses.dart';

class SignInProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  Statuses _state = Statuses.initial;
  String errorText = '';
  Statuses get state => _state;

  Future<void> authByEmail({
    required String email,
    required String password,
  }) async {
    _updateState(Statuses.loading);
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      _updateState(Statuses.completed);
    } catch (e) {
      _updateState(Statuses.error);
      errorText = _sanitizeErrorMessage(e.toString());
      notifyListeners();
    }
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
