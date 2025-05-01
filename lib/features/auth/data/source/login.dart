import 'package:firebase_auth/firebase_auth.dart';

class Login {
  FirebaseAuth auth;
  Login(this.auth);

  Future<UserCredential?> loginWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  }
}
