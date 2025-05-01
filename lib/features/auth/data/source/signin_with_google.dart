import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SigninWithGoogle {
  FirebaseAuth auth;
  SigninWithGoogle(this.auth);

  Future<UserCredential?> signinWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
            clientId:
                "817305494612-56m9ugkp61t3g4dcve6nahse197d5l7v.apps.googleusercontent.com")
        .signIn();

    // Get the authentication details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
