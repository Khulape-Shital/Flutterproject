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
    apiKey: 'AIzaSyAebSuHyTmeesRHJovwzQFrSf1wgkVT7KQ',
    appId: '1:1011744558:web:af1e3ea86bbbcf6edc44bf',
    messagingSenderId: '1011744558',
    projectId: 'tododata-2378d',
    authDomain: 'tododata-2378d.firebaseapp.com',
    storageBucket: 'tododata-2378d.appspot.com',
    measurementId: 'G-86CBWTW4F6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyATiaNjq6vtKx0jIUZVafCoQblnSN2vf-E',
    appId: '1:1011744558:android:1d6c24b1af3dd3e7dc44bf',
    messagingSenderId: '1011744558',
    projectId: 'tododata-2378d',
    storageBucket: 'tododata-2378d.appspot.com',
  );
}