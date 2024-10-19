import 'package:firebase_auth/firebase_auth.dart';
import 'package:talky/core/base/base_change_notifier.dart';
import 'package:talky/utils/statuses.dart';

class SignInProvider extends BaseChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  String errorText = '';

  Future<void> authByEmail({
    required String email,
    required String password,
  }) async {
    updateState(Statuses.loading);
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      updateState(Statuses.completed);
    } catch (e) {
      updateState(Statuses.error);
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
}
