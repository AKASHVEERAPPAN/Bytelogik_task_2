import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> google_signOut() async {
  try {
    // Sign out from Firebase
    await FirebaseAuth.instance.signOut();

    // Sign out from Google
    await GoogleSignIn().signOut();

    print("User google signed out successfully");
  } catch (e) {
    // Handle errors that may occur during sign-out
    print("Error during sign-out: $e");
  }
}
