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
    apiKey: 'AIzaSyAtvADZwJyUy4ZA37p5lhWhdVRvu9uVPX8',
    appId: '1:959745070069:web:19a7efad852ef49254c6bc',
    messagingSenderId: '959745070069',
    projectId: 'health-care-d8ea8',
    authDomain: 'health-care-d8ea8.firebaseapp.com',
    storageBucket: 'health-care-d8ea8.appspot.com',
    measurementId: 'G-0Q8D4DQ04T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxCRKC3avnX0NPVLZtCqclb6JnE-50kD0',
    appId: '1:959745070069:android:0f17cbfc813dca7f54c6bc',
    messagingSenderId: '959745070069',
    projectId: 'health-care-d8ea8',
    storageBucket: 'health-care-d8ea8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDrMuD0CLHd0UgtMuLwW3eXYSRAuySzKLo',
    appId: '1:959745070069:ios:e5ca7a5e612bddc754c6bc',
    messagingSenderId: '959745070069',
    projectId: 'health-care-d8ea8',
    storageBucket: 'health-care-d8ea8.appspot.com',
    iosBundleId: 'com.healthcare.healthCare',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDrMuD0CLHd0UgtMuLwW3eXYSRAuySzKLo',
    appId: '1:959745070069:ios:f80882fa45a2426b54c6bc',
    messagingSenderId: '959745070069',
    projectId: 'health-care-d8ea8',
    storageBucket: 'health-care-d8ea8.appspot.com',
    iosBundleId: 'com.healthcare.healthCare.RunnerTests',
  );
}