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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for android - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCacztk4xKAyfcCcS76lsNl1uOYyM6V1YM',
    appId: '1:413120607575:web:38ad120feabcf725b0ba12',
    messagingSenderId: '413120607575',
    projectId: 'c-h-service-center-dbae0',
    authDomain: 'c-h-service-center-dbae0.firebaseapp.com',
    storageBucket: 'c-h-service-center-dbae0.appspot.com',
    measurementId: 'G-5BZZ6YJ54X',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCY11-G6G4hO-hrUCi-h7UjlyNGotsN8-I',
    appId: '1:413120607575:ios:e6f9225905d30eccb0ba12',
    messagingSenderId: '413120607575',
    projectId: 'c-h-service-center-dbae0',
    storageBucket: 'c-h-service-center-dbae0.appspot.com',
    iosBundleId: 'com.example.cHServiceCenter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCY11-G6G4hO-hrUCi-h7UjlyNGotsN8-I',
    appId: '1:413120607575:ios:e6f9225905d30eccb0ba12',
    messagingSenderId: '413120607575',
    projectId: 'c-h-service-center-dbae0',
    storageBucket: 'c-h-service-center-dbae0.appspot.com',
    iosBundleId: 'com.example.cHServiceCenter',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCacztk4xKAyfcCcS76lsNl1uOYyM6V1YM',
    appId: '1:413120607575:web:6f1f37c25bfd85b4b0ba12',
    messagingSenderId: '413120607575',
    projectId: 'c-h-service-center-dbae0',
    authDomain: 'c-h-service-center-dbae0.firebaseapp.com',
    storageBucket: 'c-h-service-center-dbae0.appspot.com',
    measurementId: 'G-Z66N5T7WWL',
  );

}