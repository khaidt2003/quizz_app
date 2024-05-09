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
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyCNA_nRNAP1mk6pJD8HIKYfW57PT3iPgrk',
    appId: '1:807031429338:web:8f6c6a9cb1e88b64a0ede3',
    messagingSenderId: '807031429338',
    projectId: 'flutter-quizz-app-edfe9',
    authDomain: 'flutter-quizz-app-edfe9.firebaseapp.com',
    storageBucket: 'flutter-quizz-app-edfe9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHRgcRawR0Er6yd_s2PuEnl21hCjZJOyM',
    appId: '1:807031429338:android:6f7d066fb39cef3fa0ede3',
    messagingSenderId: '807031429338',
    projectId: 'flutter-quizz-app-edfe9',
    storageBucket: 'flutter-quizz-app-edfe9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBzOQn2mYyB3eD9j0LbZdUvgLy0SZ8eOb4',
    appId: '1:807031429338:ios:fd6b46e16d1aa162a0ede3',
    messagingSenderId: '807031429338',
    projectId: 'flutter-quizz-app-edfe9',
    storageBucket: 'flutter-quizz-app-edfe9.appspot.com',
    iosBundleId: 'com.example.quizzApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBzOQn2mYyB3eD9j0LbZdUvgLy0SZ8eOb4',
    appId: '1:807031429338:ios:fd6b46e16d1aa162a0ede3',
    messagingSenderId: '807031429338',
    projectId: 'flutter-quizz-app-edfe9',
    storageBucket: 'flutter-quizz-app-edfe9.appspot.com',
    iosBundleId: 'com.example.quizzApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCNA_nRNAP1mk6pJD8HIKYfW57PT3iPgrk',
    appId: '1:807031429338:web:2096ba5ef3d57ebfa0ede3',
    messagingSenderId: '807031429338',
    projectId: 'flutter-quizz-app-edfe9',
    authDomain: 'flutter-quizz-app-edfe9.firebaseapp.com',
    storageBucket: 'flutter-quizz-app-edfe9.appspot.com',
  );
}
