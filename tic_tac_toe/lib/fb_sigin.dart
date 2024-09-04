import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

Future<UserCredential?> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult result = await FacebookAuth.instance.login();

  if (result.status == LoginStatus.success) {
    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken!.tokenString);

    // Sign in to Firebase with the Facebook credential
    return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  return null; // Handle other cases (e.g., canceled by user)
}

