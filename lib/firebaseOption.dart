import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

class Firebaseoption {
  static FirebaseOptions get currentPlatform {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return android;
    }
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return ios;
    }
    throw UnimplementedError('');
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAkO8HkD7UNsExzn7w5pimtuWqdTraBbqo',
    appId: '1:185716976124:android:f326d2a236d9e168232a79',
    messagingSenderId: '185716976124',
    projectId: 'musicstreaming-9385f',
    storageBucket: 'musicstreaming-9385f.firebasestorage.app',
  );
  // ios example
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC9wBMEJ1WDl8WkUoxHqIVqPLvwClaTYxs',
    appId: '1:599030350718:ios:d4aadf3cf97a599eb6292f',
    messagingSenderId: '599030350718',
    projectId: 'fir-auth-demo-ec48c',
    storageBucket: 'fir-auth-demo-ec48c.appspot.com',
    iosClientId:
        '599030350718-rt5diuiggpna5fmco6k05teqm2km0f66.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseAuthDemo',
  );
}
