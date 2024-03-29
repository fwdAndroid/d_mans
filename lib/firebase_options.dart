// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyAgeKRMFnq6DP97PabWdIPJLAY597hFSdc',
    appId: '1:964866872592:web:9b238266b9fc7363670195',
    messagingSenderId: '964866872592',
    projectId: 'dmans-bb7c8',
    authDomain: 'dmans-bb7c8.firebaseapp.com',
    storageBucket: 'dmans-bb7c8.appspot.com',
    measurementId: 'G-Q0VDFDP1ND',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAh8m2qDWsF5FrGmAL9gIPDp37owGILQ1U',
    appId: '1:964866872592:android:4ce7db34bb6f8df3670195',
    messagingSenderId: '964866872592',
    projectId: 'dmans-bb7c8',
    storageBucket: 'dmans-bb7c8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDoWP4j9dv0XYPe_TPb89uv16HfUWZvSAI',
    appId: '1:964866872592:ios:dca5573fbb3dd68b670195',
    messagingSenderId: '964866872592',
    projectId: 'dmans-bb7c8',
    storageBucket: 'dmans-bb7c8.appspot.com',
    androidClientId: '964866872592-2rv952377e3itkg44vjh9juk2d76h2ft.apps.googleusercontent.com',
    iosClientId: '964866872592-oicvsufdhdf2q0t6pu0ps6p3d6pabcoe.apps.googleusercontent.com',
    iosBundleId: 'com.example.dMans',
  );
}
