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
    apiKey: 'AIzaSyBmA2Bx-Q2K00VySOSl2yaNpShAu_UPFhw',
    appId: '1:646017368128:web:3d4d0771a99626b3b75fa5',
    messagingSenderId: '646017368128',
    projectId: 'futneet-c8201',
    authDomain: 'futneet-c8201.firebaseapp.com',
    storageBucket: 'futneet-c8201.appspot.com',
    measurementId: 'G-QDT4PXRW7F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDa6NGoHfVcgHW6Tu6xL8030tb21tMj9oo',
    appId: '1:646017368128:android:d09f2917afc34347b75fa5',
    messagingSenderId: '646017368128',
    projectId: 'futneet-c8201',
    storageBucket: 'futneet-c8201.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDwmN9ripW0T0RTdaxFSHbhKXo5rzLcic4',
    appId: '1:646017368128:ios:90cb14bc8c1876dab75fa5',
    messagingSenderId: '646017368128',
    projectId: 'futneet-c8201',
    storageBucket: 'futneet-c8201.appspot.com',
    iosBundleId: 'com.example.futneet',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDwmN9ripW0T0RTdaxFSHbhKXo5rzLcic4',
    appId: '1:646017368128:ios:90cb14bc8c1876dab75fa5',
    messagingSenderId: '646017368128',
    projectId: 'futneet-c8201',
    storageBucket: 'futneet-c8201.appspot.com',
    iosBundleId: 'com.example.futneet',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBmA2Bx-Q2K00VySOSl2yaNpShAu_UPFhw',
    appId: '1:646017368128:web:84ea29a4db6fe66cb75fa5',
    messagingSenderId: '646017368128',
    projectId: 'futneet-c8201',
    authDomain: 'futneet-c8201.firebaseapp.com',
    storageBucket: 'futneet-c8201.appspot.com',
    measurementId: 'G-RXD7DPWGBG',
  );
}
