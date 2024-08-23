
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return web;
  }

  static const FirebaseOptions web = FirebaseOptions(
  apiKey: "AIzaSyCCoTt8PRtkeT0dRbK-wymTorUs4JdIAzk",
  authDomain: "bytelogick.firebaseapp.com",
  projectId: "bytelogick",
  storageBucket: "bytelogick.appspot.com",
  messagingSenderId: "36809414205",
  appId: "1:36809414205:web:a725a8b330b0e795647c54",
  measurementId: "G-CTVY1XWQRF"
  );

  // Other platforms like Android and iOS can be added here if needed
}
