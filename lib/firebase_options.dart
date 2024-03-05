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
        return macos;
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
    apiKey: 'AIzaSyCndBmQ5sgZxTJIJruMAcllJmX2FtGf9GQ',
    appId: '1:593199063709:web:09d261695737ad13b72a74',
    messagingSenderId: '593199063709',
    projectId: 'fir-crud-e7e9a',
    authDomain: 'fir-crud-e7e9a.firebaseapp.com',
    storageBucket: 'fir-crud-e7e9a.appspot.com',
    measurementId: 'G-B4R9N1FY8D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAFgc4Yb76b8yYsCMjTc5dmhlQg564dnag',
    appId: '1:593199063709:android:c10875043b444d85b72a74',
    messagingSenderId: '593199063709',
    projectId: 'fir-crud-e7e9a',
    storageBucket: 'fir-crud-e7e9a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDurH4_C7x9MkOdBIPs7ARf51piJAyR_sc',
    appId: '1:593199063709:ios:8b6e6f3a2042755cb72a74',
    messagingSenderId: '593199063709',
    projectId: 'fir-crud-e7e9a',
    storageBucket: 'fir-crud-e7e9a.appspot.com',
    iosBundleId: 'com.example.firebaseCrud',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDurH4_C7x9MkOdBIPs7ARf51piJAyR_sc',
    appId: '1:593199063709:ios:840f1276d4f3c2e0b72a74',
    messagingSenderId: '593199063709',
    projectId: 'fir-crud-e7e9a',
    storageBucket: 'fir-crud-e7e9a.appspot.com',
    iosBundleId: 'com.example.firebaseCrud.RunnerTests',
  );
}