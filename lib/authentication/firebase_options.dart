import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return const FirebaseOptions(
        apiKey: 'AIzaSyAm5amNZR3Msr7TPTrqBl1E0Rpj-iqOcag',
        authDomain: 'wvsu-coop-b6ab4.firebaseapp.com',
        projectId: 'wvsu-coop-b6ab4',
        storageBucket: 'wvsu-coop-b6ab4.appspot.com',
        messagingSenderId: '483933264130',
        appId: '1:483933264130:web:67e65362bfa5f4abc4ca1b',
      );
    }
    throw UnsupportedError('Platform not supported');
  }
}
