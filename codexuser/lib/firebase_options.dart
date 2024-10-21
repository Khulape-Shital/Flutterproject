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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD-QEXCWQ4_K7cKRjimC-U27IOiLzR5eJo',
    appId: '1:102922073529:web:b447fa1b1926f597c6b268',
    messagingSenderId: '102922073529',
    projectId: 'codex-38e7b',
    authDomain: 'codex-38e7b.firebaseapp.com',
    storageBucket: 'codex-38e7b.appspot.com',
    measurementId: 'G-0B5GPS54GE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDk5D5KFLeT6LDB2lVpImyXN-t53HoZK0I',
    appId: '1:102922073529:android:5d60e0f845358a3dc6b268',
    messagingSenderId: '102922073529',
    projectId: 'codex-38e7b',
    storageBucket: 'codex-38e7b.appspot.com',
  );
}
