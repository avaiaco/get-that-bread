import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDmLa-diPrSP03_ddf-NgzTHbpE2b3cR4k",
            authDomain: "get-that-bread-asju8m.firebaseapp.com",
            projectId: "get-that-bread-asju8m",
            storageBucket: "get-that-bread-asju8m.firebasestorage.app",
            messagingSenderId: "179267814872",
            appId: "1:179267814872:web:bfa489c602d6a1e8931ead"));
  } else {
    await Firebase.initializeApp();
  }
}
