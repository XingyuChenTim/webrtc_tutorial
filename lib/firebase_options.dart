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
    apiKey: 'AIzaSyB_nLepnWSU5o2ibS_CAmg3xt-849G5Uus',
    appId: '1:1064867757555:web:05e26647921afe9fde2686',
    messagingSenderId: '1064867757555',
    projectId: 'signal-9a34b',
    authDomain: 'signal-9a34b.firebaseapp.com',
    storageBucket: 'signal-9a34b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBRuuAOGLplocUWJAA9NwtVD-rpiZS5RGc',
    appId: '1:1064867757555:android:7d97405522aa9b0dde2686',
    messagingSenderId: '1064867757555',
    projectId: 'signal-9a34b',
    storageBucket: 'signal-9a34b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBdBvT0mmIXODEJTOoSjEErpFoR7zsRcU0',
    appId: '1:1064867757555:ios:6dbe27eced16a1d3de2686',
    messagingSenderId: '1064867757555',
    projectId: 'signal-9a34b',
    storageBucket: 'signal-9a34b.appspot.com',
    iosClientId: '1064867757555-29j2plkir5ijo4bvq801easam0vb2f4i.apps.googleusercontent.com',
    iosBundleId: 'dev.flutterexplained.webrtc',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBdBvT0mmIXODEJTOoSjEErpFoR7zsRcU0',
    appId: '1:1064867757555:ios:e46379972d846d9ade2686',
    messagingSenderId: '1064867757555',
    projectId: 'signal-9a34b',
    storageBucket: 'signal-9a34b.appspot.com',
    iosClientId: '1064867757555-q91evvuscc16a8fblvb3dstha9m1btbe.apps.googleusercontent.com',
    iosBundleId: 'dev.flutterexplained.webrtcTutorial',
  );
}
