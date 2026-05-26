import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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

      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyDjhFWlQCtMDB5TXMtwYwa37gYKNfPfyio",
    appId: "1:540129529785:web:6d5b525bfff08ce50e3068",
    messagingSenderId: "P540129529785",
    projectId: "job-seeker-portfolio",
    authDomain: "job-seeker-portfolio.firebaseapp.com",
    storageBucket: "job-seeker-portfolio.firebasestorage.app",
  );


  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyC2bhUELXKCGdSdg8le03KW14TxG8-r5vQ",
    appId: "1:540129529785:android:2fb490d1f0bf6b5b0e3068",
    messagingSenderId: "540129529785",
    projectId: "job-seeker-portfolio",
    storageBucket: "job-seeker-portfolio.firebasestorage.app",
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "AIzaSyD21BIYINo4WmOCmllC1csgcXulxqiVGJ4",
    appId: "1:540129529785:ios:fd66f8ecab957ac40e3068",
    messagingSenderId: "540129529785",
    projectId: "job-seeker-portfolio",
    storageBucket: "job-seeker-portfolio.firebasestorage.app",
    iosBundleId: "com.group2.portfolio.jobSeekerPortfolio",
  );
}