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
    apiKey: 'AIzaSyBYlugEpQpajAepJ4Z4qOLD9s7jV7XiRC4',
    appId: '1:327700232063:web:af2096a9c1ec8c8c4a8c4a',
    messagingSenderId: '327700232063',
    projectId: 'adhikar2-o',
    authDomain: 'adhikar2-o.firebaseapp.com',
    storageBucket: 'adhikar2-o.appspot.com',
    measurementId: 'G-T3X03C3R05',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDqWL5q8EbAaggDeeWQa3w39smmyGBrCVw',
    appId: '1:327700232063:android:90d39d3ca4f5d83b4a8c4a',
    messagingSenderId: '327700232063',
    projectId: 'adhikar2-o',
    storageBucket: 'adhikar2-o.appspot.com',
  );
}