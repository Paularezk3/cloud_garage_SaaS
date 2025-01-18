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
    apiKey: 'AIzaSyAI9vDgMku6H8u_wige1cinIXtoz5q2TuM',
    appId: '1:267602532261:web:e3b48d9cd53b810169fa4c',
    messagingSenderId: '267602532261',
    projectId: 'cloud-garage-13378',
    authDomain: 'cloud-garage-13378.firebaseapp.com',
    storageBucket: 'cloud-garage-13378.firebasestorage.app',
    measurementId: 'G-5H6FJ6F9EM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA0nNY9bR0jueFs46v_J95jwLStsTS85PI',
    appId: '1:267602532261:android:f4e3441301f0462569fa4c',
    messagingSenderId: '267602532261',
    projectId: 'cloud-garage-13378',
    storageBucket: 'cloud-garage-13378.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDsTTimVOYLW0HKBsN-xZvCCO9n7sO7VbA',
    appId: '1:267602532261:ios:4434b0280d4a467369fa4c',
    messagingSenderId: '267602532261',
    projectId: 'cloud-garage-13378',
    storageBucket: 'cloud-garage-13378.firebasestorage.app',
    iosBundleId: 'com.example.cloudGarage',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDsTTimVOYLW0HKBsN-xZvCCO9n7sO7VbA',
    appId: '1:267602532261:ios:4434b0280d4a467369fa4c',
    messagingSenderId: '267602532261',
    projectId: 'cloud-garage-13378',
    storageBucket: 'cloud-garage-13378.firebasestorage.app',
    iosBundleId: 'com.example.cloudGarage',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAI9vDgMku6H8u_wige1cinIXtoz5q2TuM',
    appId: '1:267602532261:web:f4b1f424c55b896869fa4c',
    messagingSenderId: '267602532261',
    projectId: 'cloud-garage-13378',
    authDomain: 'cloud-garage-13378.firebaseapp.com',
    storageBucket: 'cloud-garage-13378.firebasestorage.app',
    measurementId: 'G-4C9BCZFS5Y',
  );
}