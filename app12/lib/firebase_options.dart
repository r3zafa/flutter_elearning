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
    apiKey: 'AIzaSyCChIt-6X4cGRUPBmAcvRaGLr50RzqkdZw',
    appId: '1:1025688144362:web:cdb9743c00ddf4f9b10a93',
    messagingSenderId: '1025688144362',
    projectId: 'livechat-frobese',
    authDomain: 'livechat-frobese.firebaseapp.com',
    storageBucket: 'livechat-frobese.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBEGkMUZSeDi6jGL8EbEJO8bU6wtT8VkKo',
    appId: '1:1025688144362:android:217a762854860519b10a93',
    messagingSenderId: '1025688144362',
    projectId: 'livechat-frobese',
    storageBucket: 'livechat-frobese.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCfbWodhy_RvqN-OCkh-qn82swI2vp2wBU',
    appId: '1:1025688144362:ios:4112d52187994d80b10a93',
    messagingSenderId: '1025688144362',
    projectId: 'livechat-frobese',
    storageBucket: 'livechat-frobese.appspot.com',
    iosClientId:
        '1025688144362-25f98ip10r502b5rpptmuv9uhstftf83.apps.googleusercontent.com',
    iosBundleId: 'com.frobese.app12',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCfbWodhy_RvqN-OCkh-qn82swI2vp2wBU',
    appId: '1:1025688144362:ios:4112d52187994d80b10a93',
    messagingSenderId: '1025688144362',
    projectId: 'livechat-frobese',
    storageBucket: 'livechat-frobese.appspot.com',
    iosClientId:
        '1025688144362-25f98ip10r502b5rpptmuv9uhstftf83.apps.googleusercontent.com',
    iosBundleId: 'com.frobese.app12',
  );
}
