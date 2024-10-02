import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBHkrqudT0D9hqG2-bDQ56JafFPcpGFobI",
            authDomain: "icc-app-rdrwvz.firebaseapp.com",
            projectId: "icc-app-rdrwvz",
            storageBucket: "icc-app-rdrwvz.appspot.com",
            messagingSenderId: "836587609416",
            appId: "1:836587609416:web:c7ec93525d9d88190fa77d"));
  } else {
    await Firebase.initializeApp();
  }
}
