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
    apiKey: 'AIzaSyDAVIwlcCATz3U4Y_csTAwvCgszrjMy1O8',
    appId: '1:1028414798492:web:045c62a34f2266a3c00b59',
    messagingSenderId: '1028414798492',
    projectId: 'tiendavivero-871f0',
    authDomain: 'tiendavivero-871f0.firebaseapp.com',
    storageBucket: 'tiendavivero-871f0.appspot.com',
    measurementId: 'G-R2ZW8F97J1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZGRN0n2UN1l5JsCMqxihtPhA-sD3d1TU',
    appId: '1:1028414798492:android:d69cfef3d03e1bbac00b59',
    messagingSenderId: '1028414798492',
    projectId: 'tiendavivero-871f0',
    storageBucket: 'tiendavivero-871f0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCxe-2lMaMfmpKtNX-6SieOfdSHQOWo8mk',
    appId: '1:1028414798492:ios:d2b5dfc598beb8bdc00b59',
    messagingSenderId: '1028414798492',
    projectId: 'tiendavivero-871f0',
    storageBucket: 'tiendavivero-871f0.appspot.com',
    iosBundleId: 'com.example.aprendiendoFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCxe-2lMaMfmpKtNX-6SieOfdSHQOWo8mk',
    appId: '1:1028414798492:ios:d2b5dfc598beb8bdc00b59',
    messagingSenderId: '1028414798492',
    projectId: 'tiendavivero-871f0',
    storageBucket: 'tiendavivero-871f0.appspot.com',
    iosBundleId: 'com.example.aprendiendoFlutter',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDAVIwlcCATz3U4Y_csTAwvCgszrjMy1O8',
    appId: '1:1028414798492:web:6a959871960e5b2fc00b59',
    messagingSenderId: '1028414798492',
    projectId: 'tiendavivero-871f0',
    authDomain: 'tiendavivero-871f0.firebaseapp.com',
    storageBucket: 'tiendavivero-871f0.appspot.com',
    measurementId: 'G-WQTBZBNB9K',
  );
}