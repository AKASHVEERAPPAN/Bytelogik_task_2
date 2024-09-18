import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<User?> signInWithGoogle() async {
  // Initialize GoogleSignIn with the clientId for web
  final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId: '913969155078-ojb5pb8kjgcb647laj16eqnvj2a7gjlb.apps.googleusercontent.com', // Your client ID for web
  );

  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

  if (googleUser == null) {
    // If the user cancels the sign-in process
    return null;
  }

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // Create a new credential
  final OAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Once signed in, return the User
  return (await FirebaseAuth.instance.signInWithCredential(credential)).user;
}
