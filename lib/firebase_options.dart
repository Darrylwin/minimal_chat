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
    apiKey: 'AIzaSyDC3ruvISk6dYyYR_eZ7gWQf-1-BMH404Q',
    appId: '1:342539799944:web:bf16363e49c22b3557fe3d',
    messagingSenderId: '342539799944',
    projectId: 'minimalchat2',
    authDomain: 'minimalchat2.firebaseapp.com',
    storageBucket: 'minimalchat2.appspot.com',
    measurementId: 'G-5VEGCKHSRW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAE5tPeCdjx6al00TzWhmU7151vvoL1-9k',
    appId: '1:342539799944:android:778d20767f55e4ff57fe3d',
    messagingSenderId: '342539799944',
    projectId: 'minimalchat2',
    storageBucket: 'minimalchat2.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDC3ruvISk6dYyYR_eZ7gWQf-1-BMH404Q',
    appId: '1:342539799944:web:9f6d6a1928f04b4157fe3d',
    messagingSenderId: '342539799944',
    projectId: 'minimalchat2',
    authDomain: 'minimalchat2.firebaseapp.com',
    storageBucket: 'minimalchat2.appspot.com',
    measurementId: 'G-21CXEYEZ05',
  );

}