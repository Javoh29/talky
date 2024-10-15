// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC2js_ZkF4fVRsmeHHzaH8WNnc2-GojQcw',
    appId: '1:610568315359:android:c4819cf57a82ea9b7a646a',
    messagingSenderId: '610568315359',
    projectId: 'talky-app-2',
    storageBucket: 'talky-app-2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB1oqiTSNs5yuEeKKSiZE9JgnSwWfLFuOw',
    appId: '1:610568315359:ios:ca3a33d46dafae797a646a',
    messagingSenderId: '610568315359',
    projectId: 'talky-app-2',
    storageBucket: 'talky-app-2.appspot.com',
    androidClientId: '610568315359-rcvi38gep5tdbk75r4nu4eagrjdl5k5j.apps.googleusercontent.com',
    iosClientId: '610568315359-sh52dfgmthjg0a1dp91ctoqprf94jv34.apps.googleusercontent.com',
    iosBundleId: 'com.simpl.talky',
  );
}
