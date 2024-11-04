import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:talky/features/profile/models/user_model.dart';
import 'package:talky/utils/firebase_details.dart';

class UserDataService {
  static final UserDataService _instance = UserDataService._();
  static UserDataService get instance => _instance;
  UserDataService._();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<UserModel?> getUserModel() async {
    final response = await _firebaseFirestore
        .collection(FirebaseDetails.userCollection)
        .doc(
          _auth.currentUser?.uid,
        )
        .get();
    return UserModel.fromJson(response.data() ?? {});
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDoc() async {
    return _firebaseFirestore
        .collection(FirebaseDetails.userCollection)
        .doc(
          _auth.currentUser?.uid,
        )
        .get();
  }

  Future<void> setUserDoc(Map<String, dynamic> data,
      [SetOptions? options]) async {
    return _firebaseFirestore
        .collection(FirebaseDetails.userCollection)
        .doc(
          _auth.currentUser?.uid,
        )
        .set(data);
  }

  Future<void> setUpdateLastTime() async {
    try {
      await _firebaseFirestore
          .collection(FirebaseDetails.userCollection)
          .doc(
            _auth.currentUser?.uid,
          )
          .set(
        {
          'last_time': DateTime.now().millisecondsSinceEpoch,
        },
        SetOptions(merge: true),
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
