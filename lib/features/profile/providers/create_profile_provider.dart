import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:talky/core/base/base_change_notifier.dart';
import 'package:talky/features/profile/models/user_model.dart';
import 'package:talky/utils/profile_state.dart';
import 'package:talky/utils/statuses.dart';

class CreateProfileProvider extends BaseChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore firebaseStore = FirebaseFirestore.instance;

  File? selectedImage;
  String? selectedName;
  String failedUpload = '';
  String errorText = '';

  Future<void> imagePicker() async {
    if (!await Permission.storage.request().isGranted) {
      try {
        FilePickerResult? res = await FilePicker.platform.pickFiles(
          type: FileType.image,
        );
        if (res != null && res.files.single.path != null) {
          selectedImage = File(res.files.single.path!);

          notifyListeners();
        }
      } catch (e) {
        failedUpload = e.toString();
      }
    } else {
      log("Permission denied");
    }
  }

  Future<String?> imageUpload() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    final imageRef = storage
        .ref()
        .child('profile_image/${DateTime.now().microsecondsSinceEpoch}.jpg');

    if (selectedImage != null) {
      final imageRefe = await imageRef.putFile(selectedImage!);
      final imageDownload = await imageRefe.ref.getDownloadURL();
      notifyListeners();

      return imageDownload;
    } else {
      return null;
    }
  }

  Future<void> saveUserData({
    required String name,
    required String description,
  }) async {
    updateState(Statuses.loading);
    try {
      final image = await imageUpload();
      final user = auth.currentUser;
      if (user != null) {
        final doc = firebaseStore.collection('users').doc(user.uid);
        await doc.set(
            UserModel(
              name: name,
              description: description,
              image: image,
              profileState: ProfileState.completed,
            ).toJson(),
            SetOptions(merge: true));
        updateState(Statuses.completed);
      } else {
        updateState(Statuses.error);
        errorText = "User not found!";
      }
    } catch (e) {
      updateState(Statuses.error);
      errorText = "Error saving user data: $e";
    }
  }
}
