import 'package:firebase_auth/firebase_auth.dart';
import 'package:talky/core/base/base_change_notifier.dart';
import 'package:talky/utils/statuses.dart';

class ForgotPasswordProvider extends BaseChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  String errorText = '';

  Future<void> forgotPassword({required String email}) async {
    updateState(Statuses.loading);

    try {
      await auth.sendPasswordResetEmail(email: email);
      updateState(Statuses.completed);
      notifyListeners();
    } catch (e) {
      updateState(Statuses.error);
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

}
