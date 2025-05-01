import 'package:firebase_auth/firebase_auth.dart';

class SigninWithFacebook {
  FirebaseAuth auth;
  SigninWithFacebook(this.auth);

  Future<UserCredential?> signinWithFacebook() async {
    UserCredential userCredential = await auth.signInWithProvider(
      FacebookAuthProvider(),
    );
    return userCredential;
  }
}
