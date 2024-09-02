import 'package:firebase_auth/firebase_auth.dart';

Future<void> signOut() async {
  try {
    // Sign out from Firebase (this will sign out the user regardless of how they signed in)
    await FirebaseAuth.instance.signOut();

    print("User signed out successfully");
  } catch (e) {
    // Handle errors that may occur during sign-out
    print("Error during sign-out: $e");
  }
}

