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
    apiKey: 'AIzaSyB05CxBH2IfifSfP8b6wQ9t4R4dmDpP1_M',
    appId: '1:170006685887:web:30337a030ec0f71ff03e0a',
    messagingSenderId: '170006685887',
    projectId: 'quiz-app-11649',
    authDomain: 'quiz-app-11649.firebaseapp.com',
    storageBucket: 'quiz-app-11649.appspot.com',
    measurementId: 'G-69BEM6R19F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCMmLgXCLGRrhlAV9dVadp5hbgfFxwMHQU',
    appId: '1:170006685887:android:67d9fda2dbbecd10f03e0a',
    messagingSenderId: '170006685887',
    projectId: 'quiz-app-11649',
    storageBucket: 'quiz-app-11649.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDPKPRp7wdJlWZHA4woAdNYmzB9KKBjfvY',
    appId: '1:170006685887:ios:3a3edeb596ba9274f03e0a',
    messagingSenderId: '170006685887',
    projectId: 'quiz-app-11649',
    storageBucket: 'quiz-app-11649.appspot.com',
    iosBundleId: 'com.example.quizApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDPKPRp7wdJlWZHA4woAdNYmzB9KKBjfvY',
    appId: '1:170006685887:ios:3a3edeb596ba9274f03e0a',
    messagingSenderId: '170006685887',
    projectId: 'quiz-app-11649',
    storageBucket: 'quiz-app-11649.appspot.com',
    iosBundleId: 'com.example.quizApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB05CxBH2IfifSfP8b6wQ9t4R4dmDpP1_M',
    appId: '1:170006685887:web:d3613b62f97e79b2f03e0a',
    messagingSenderId: '170006685887',
    projectId: 'quiz-app-11649',
    authDomain: 'quiz-app-11649.firebaseapp.com',
    storageBucket: 'quiz-app-11649.appspot.com',
    measurementId: 'G-ZYK30W17RR',
  );

}