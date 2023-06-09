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
    apiKey: 'AIzaSyApkZ9YRJGngqemPZnEf4V8-Zn0-elJAJE',
    appId: '1:196542389739:web:4fac092f6574cb2f050dae',
    messagingSenderId: '196542389739',
    projectId: 'firstdemo-94279',
    authDomain: 'firstdemo-94279.firebaseapp.com',
    databaseURL: 'https://firstdemo-94279-default-rtdb.firebaseio.com',
    storageBucket: 'firstdemo-94279.appspot.com',
    measurementId: 'G-BW3CWFGGW4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBYsbG8MrYBPm38XYiUS5W9Sp3LeVjLngs',
    appId: '1:196542389739:android:b8fa4665a256a950050dae',
    messagingSenderId: '196542389739',
    projectId: 'firstdemo-94279',
    databaseURL: 'https://firstdemo-94279-default-rtdb.firebaseio.com',
    storageBucket: 'firstdemo-94279.appspot.com',
  );
}
